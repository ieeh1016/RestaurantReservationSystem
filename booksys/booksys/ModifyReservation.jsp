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
					<i class="glyphicon glyphicon-user"></i> <br>예약 수정
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
			<%
			String roid = request.getParameter("roid");
			String customer_id = request.getParameter("customer_id");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String time = request.getParameter("time");
			String covers = request.getParameter("covers");
			String table_id = request.getParameter("table_id");
			%>
			<div class="col-md-12">
				<div class="table-responsive">
					<form action="Manager_ModifyAction.jsp" method="post">
						<table class="table">
							<tr>
								<th>Reservation Oid</th>
								<td><input type="text" name="roid"
									value="<%=roid%>" readonly></td>
							</tr>
							<tr>
								<th>Customer ID</th>
								<td><input type="text" name="customer_id"
									value="<%=customer_id%>" readonly></td>
							</tr>
							<tr>
								<th>Name</th>
								<td><%=name%></td>
							</tr>
							<tr>
								<th>Phone Number</th>
								<td><%=phone%></td>
							</tr>
							<tr>
								<th>Time</th>
								<td><input type="text" name="time" value="<%=time%>"></td>
							</tr>
							<tr>
								<th>Covers</th>
								<td><input type="text" name="covers" value="<%=covers%>"></td>
							</tr>
							<tr>
								<th>Table Number</th>
								<td><input type="text" name="table_id"
									value="<%=table_id%>"></td>
							</tr>
							<tr>
								<th></th>
								<th><input type="submit" class="btn btn-default"
									value="수정하기" /></th>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>