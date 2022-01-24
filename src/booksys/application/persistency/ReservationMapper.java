package booksys.application.persistency;

import java.sql.*;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.io.*;
import java.util.*;
import java.text.DateFormat;
import java.util.Calendar;
import booksys.application.persistency.BookingMapper;

public class ReservationMapper {
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// Manager_ReservationAction에서 사용하는 예약 추가 기능
	public boolean addReservation(String name, String phone, String date, String time, String table_id, String covers,
			String menu) {
		int point = 0;
		int rsCus = 0;
		int rsMenu = 0;

		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/booksys", "root", "1234");
			if (conn == null)
				throw new Exception("데이터베이스 연결 불가<br>");
			stmt = conn.createStatement();

			// customer 존재 여부 확인
			String sql = String.format(
					"select name, phoneNumber from Customer where name = '%s' and phoneNumber = '%s';", name, phone);
			rs = stmt.executeQuery(sql);
			boolean found = rs.next();
			if (!found) {
				String sqlCus = String.format("insert into Customer (name,phoneNumber,point) values (?,?,0);");
				pstmt = conn.prepareStatement(sqlCus);
				pstmt.setString(1, name);
				pstmt.setString(2, phone);
				pstmt.executeUpdate();
			}
			rs.close();

			// 예약 넣기
			String sql2 = String.format(
					"select c.oid, m.oid from Customer as c, Menu as m where c.name = '%s' and c.phoneNumber ='%s' and m.menuName = '%s';",
					name, phone, menu);
			rs = stmt.executeQuery(sql2);
			while (rs.next()) {
				rsCus = rs.getInt("c.oid");
				rsMenu = rs.getInt("m.oid");
			}
			rs.close();

			String sqlRes1 = String.format(
					"insert into Reservation (covers, date, time, table_id, menu_id, customer_id) values (?,?,?,?,?,?);");
			pstmt = conn.prepareStatement(sqlRes1);
			pstmt.setString(1, covers);
			pstmt.setString(2, date);
			pstmt.setString(3, time);
			pstmt.setString(4, table_id);
			pstmt.setInt(5, rsMenu);
			pstmt.setInt(6, rsCus);
			rs = pstmt.executeQuery();
			rs.close();

			// 포인트 적립
			String sql3 = String.format(
					"select c.point from Customer as c, Reservation as r where c.oid = r.customer_id and c.name = '%s' and c.phoneNumber = '%s';",
					name, phone);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql3);
			while (rs.next()) {
				point = rs.getInt(1);
			}
			point = point + 100;
			rs.close();

			String sql4 = String.format("UPDATE Customer SET point = '%d' where name = '%s' and phoneNumber = '%s';",
					point, name, phone);
			rs = stmt.executeQuery(sql4);

			rs.close();

			stmt.close();
			conn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 테이블 covers와 예약 covers 확인
	public boolean overflow(String covers, String table_id) throws Exception {
		boolean overflow = false;
		int intcovers = Integer.parseInt(covers);
		int places = 0;

		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/booksys", "root", "1234");
			if (conn == null)
				throw new Exception("데이터베이스 연결 불가<br>");

			stmt = conn.createStatement();
			String sql = String.format("Select places from `Table` where oid = '%s';", table_id);
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				places = rs.getInt("places");
			}
			if (intcovers > places) {
				overflow = true;
				return overflow;
			}

			rs.close();
			stmt.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return overflow;
	}

	// Manager_ModifyAction에서 사용하는 예약 수정 코드
	public boolean editReservation(String editTime, String editCovers, String tno, String id, String roid) {
		String sql = String.format(
				"UPDATE Reservation SET covers = '%s', time = '%s', table_id = '%s' WHERE  customer_id = '%s' and oid = '%s';",
				editCovers, editTime, tno, id, roid);

		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/booksys", "root", "1234");

			if (conn == null)
				throw new Exception("데이터베이스 연결 불가<br>");

			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();

			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Manager_DeleteAction에서 사용하는 예약 삭제 코드
	public boolean deleteReservation(String roid, String name, String phone) {
		String sql = String.format("SELECT point FROM Customer WHERE name = '%s' and phoneNumber = '%s';", name, phone);
		String sql2 = String.format("DELETE FROM Reservation WHERE oid = '%s';", roid);
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/booksys", "root", "1234");

			if (conn == null)
				throw new Exception("데이터베이스 연결 불가<br>");
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				int point = Integer.valueOf(rs.getString("point"));
				point -= 100;
				String sql3 = String.format(
						"UPDATE Customer SET point = '%d' WHERE name = '%s' and phoneNumber = '%s';", point, name,
						phone);
				stmt.executeUpdate(sql3);
			}
			stmt.executeUpdate(sql2);
			stmt.close();
			conn.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
