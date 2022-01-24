package booksys.application.persistency;

import java.sql.*;

public class WalkInMapper {
	// Manager_WalkInAction에서 사용하는 워크인 추가 기능
	public boolean addWalkIn(String covers, String date, String time, String table_id, String menuName) {
		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/booksys", "root", "1234");
			if (conn == null)
				throw new Exception("데이터베이스 연결 오류<br>");

			stmt = conn.createStatement();
			
			String sql = String.format("Select oid from Menu where menuName = '%s';", menuName);
			String menu_id = null;
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next())
				menu_id = rs.getString("oid");

			String sql2 = String.format(
					"INSERT INTO WalkIn(covers, date, time, table_id, menu_id) values ('%s', '%s', '%s', '%s', '%s');",
					covers, date, time, table_id, menu_id);
			stmt.executeUpdate(sql2);
			
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
}
