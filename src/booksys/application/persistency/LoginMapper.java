package booksys.application.persistency;

import java.sql.*;

public class LoginMapper {
	Connection conn = null;
	Statement stmt = null;

	String jdbcdriver = "org.mariadb.jdbc.Driver";
	String jdbcurl = "jdbc:mariadb://localhost:3306/booksys";
	String id = "root";
	String pw = "1234";

	String name = null;
	String phoneNumber = null;

	public boolean login(String userName, String userPhone) {
		String sql = "SELECT name, phoneNumber FROM Customer";

		try {
			Class.forName(jdbcdriver);
			conn = DriverManager.getConnection(jdbcurl, id, pw);

			if (conn == null)
				throw new Exception("데이터베이스 연결 오류<br>");

			stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery(sql);

			while (rset.next()) {
				name = rset.getString("name");
				phoneNumber = rset.getString("phoneNumber");

				if (name.equals(userName) && phoneNumber.equals(userPhone)) {
					return true;
				}
			}
			rset.close();
			stmt.close();
			conn.close();
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