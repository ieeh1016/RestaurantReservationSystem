<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SE Restaurant</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<script type="text/javascript">
	
</script>
<style>
nav[class="navbar navbar-default"] {
	height: 150px;
	background-color: #fedb43;
	border: none;
}

img[src="img/Logo.png"] {
	width: 330px;
}

img[src="img/CustomerBtn.png"], img[src="img/AdminBtn.png"] {
	float: right;
	width: 150px;
	margin: 40px 30px 0 0;
	overflow: hidden;
}

img[src="img/CustomerBtn.png"]:hover, img[src="img/AdminBtn.png"]:hover
	{
	transform: scale(1.2);
}

th, td {
	text-align: center;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default">
		<div>
			<a class="navbar-brand" href="Main.jsp"> <img alt="SE Restaurant"
				src="img/Logo.png">
			</a>
		</div>
		<div class="navbar-right">
			<a href="Manager_login.jsp"> <img src="img/AdminBtn.png"
				alt="관리자메뉴">
			</a> <a href="Customer_login.jsp"> <img src="img/CustomerBtn.png"
				alt="예약확인">
			</a>
		</div>
	</nav>
	<%
	String name = (String) session.getAttribute("name");
	String phone = (String) session.getAttribute("phone");

	Connection conn = null;
	Statement stmt = null;

	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/booksys", "root", "1234");

		if (conn == null)
			throw new Exception("데이터베이스 연결 불가<br>");
		stmt = conn.createStatement();
		String sql = String.format(
		"select r.date, r.time, r.table_id, m.menuName from Customer as c, Reservation as r, Menu as m where c.Oid = r.customer_id and r.menu_id = m.Oid and name = '%s';",
		name);
		String sql2 = String.format("select point from Customer where name = '%s';", name);
		ResultSet rs = stmt.executeQuery(sql);
		ResultSet rs2 = stmt.executeQuery(sql2);
	%>
	<div class="container-fluid">
		<div class="row-fluid">
			<br>
			<div class="col-md-12">
				<h2>
					<i class="glyphicon glyphicon-user"></i> <br>예약자 정보
				</h2>
			</div>
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th>예약자 성함</th>
							<td><%=name%></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><%=phone%></td>
						</tr>
						<tr>
							<th>포인트</th>
							<%
							if (rs2.next()) {
							%>
							<td><%=rs2.getString("point")%></td>
							<%
							}
							%>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-12">
				<h2>
					<i class="glyphicon glyphicon-user"></i> <br>전체 예약
				</h2>
			</div>
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>예약 날짜</th>
								<th>예약 시간</th>
								<th>테이블 번호</th>
								<th>예약 메뉴</th>
							</tr>
						</thead>
						<tbody>
							<%
							while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getString("r.date")%></td>
								<td><%=rs.getString("r.time")%></td>
								<td><%=rs.getString("r.table_id")%></td>
								<td><%=rs.getString("m.menuName")%></td>
							</tr>
							<%
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
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>