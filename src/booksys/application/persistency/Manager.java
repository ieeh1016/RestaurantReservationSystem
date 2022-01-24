package booksys.application.persistency;

import java.sql.*;

public class Manager {

	// Manger_Statistics에서 사용하는 전체 매뉴 개수 통계 코드
	public static int[] menuCount() {
		int[] mCount = { 0, 0, 0, 0, 0, 0 };
		String sql = "select menu_id from Reservation";
		String sql2 = "select menu_id from WalkIn";

		Connection conn = null;
		Statement stmt = null;

		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/booksys", "root", "1234");

			if (conn == null)
				throw new Exception("데이터베이스 연결 오류<br>");

			stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery(sql);
			ResultSet rset2 = stmt.executeQuery(sql2);
			
			// 예약된 메뉴의 개수
			while (rset.next()) {
				int menu = rset.getInt("menu_id");
				switch (menu) {
				case 1:
					mCount[0] += 1;
					break;
				case 2:
					mCount[1] += 1;
					break;
				case 3:
					mCount[2] += 1;
					break;
				case 4:
					mCount[3] += 1;
					break;
				case 5:
					mCount[4] += 1;
					break;
				case 6:
					mCount[5] += 1;
					break;
				}
			}
			// 워크인에서 주문된 메뉴의 개수
			while (rset2.next()) {
				int menu = rset2.getInt("menu_id");
				switch (menu) {
				case 1:
					mCount[0] += 1;
					break;
				case 2:
					mCount[1] += 1;
					break;
				case 3:
					mCount[2] += 1;
					break;
				case 4:
					mCount[3] += 1;
					break;
				case 5:
					mCount[4] += 1;
					break;
				case 6:
					mCount[5] += 1;
					break;
				}
			}
			
			rset.close();
			rset2.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mCount;
	}

	// Main.jsp에서 사용하는 베스트 메뉴 기능
	public static int bestMenu() {
		int max = 0;
		int maxIndex = -1;
		int[] mc = menuCount();

		for (int i = 0; i < 6; i++) {
			if (mc[i] > max) {
				max = mc[i];
				maxIndex = i;
			}
		}
		return maxIndex;
	}
}