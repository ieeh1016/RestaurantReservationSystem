<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="bootstrap-3.3.2-dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>SE Restaurant</title>
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

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12">
				<h2>
					<i class="glyphicon glyphicon-user"></i> <br>전체 예약
				</h2>
			</div>
			<div class="col-md-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="Manager_Confirm.jsp">전체
								예약</a></li>
						<li class="breadcrumb-item"><a href="Manager_Reservation.jsp">예약
								추가</a></li>
						<li class="breadcrumb-item"><a href="Manager_Modify.jsp">예약
								수정</a></li>
						<li class="breadcrumb-item"><a
							href="Manager_ConfirmWalkIn.jsp">전체 워크인</a></li>
						<li class="breadcrumb-item"><a href="Manager_WalkIn.jsp">워크인
								추가</a></li>
						<li class="breadcrumb-item"><a href="Manager_Statistics.jsp">통계</a></li>
					</ol>
				</nav>
			</div>

			<br>
			<div class="col-md-12">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th>Oid</th>
								<th>Name</th>
								<th>Phone Number</th>
								<th>Covers</th>
								<th>Date</th>
								<th>Time</th>
								<th>Table ID</th>
								<th>Menu</th>
								<th>Point</th>
							</tr>
						</thead>
						<tbody>
							<%
							Connection conn = null;
							Statement stmt = null;
							ResultSet rs = null;

							try {
								Class.forName("org.mariadb.jdbc.Driver");
								conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/booksys", "root", "1234");
								String sql = String.format(
								"select r.oid, c.name, c.phoneNumber, r.covers, r.date, r.time, r.table_id, m.menuName, c.point from Customer as c, Reservation as r, Menu as m where c.Oid = r.customer_id and r.menu_id = m.oid order by r.Oid");
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getString("r.oid")%></td>
								<td><%=rs.getString("name")%></td>
								<td><%=rs.getString("phoneNumber")%></td>
								<td><%=rs.getString("covers")%></td>
								<td><%=rs.getString("date")%></td>
								<td><%=rs.getString("time")%></td>
								<td><%=rs.getString("table_id")%></td>
								<td><%=rs.getString("menuName")%></td>
								<td><%=rs.getString("c.point")%></td>
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