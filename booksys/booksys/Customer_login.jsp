<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>SE Restaurant</title>
<style>
body {
	font-family: "Lato", sans-serif;
	font-weight: bold;
}

.main-head {
	height: 150px;
	background: #FFF;
}

.sidenav {
	height: 100%;
	background-color: #fedb43;
	overflow-x: hidden;
	padding-top: 20px;
}

.main {
	padding: 0px 10px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
}

@media screen and (max-width: 450px) {
	.login-form {
		margin-top: 10%;
	}
	.register-form {
		margin-top: 10%;
	}
}

@media screen and (min-width: 768px) {
	.main {
		margin-left: 40%;
	}
	.sidenav {
		width: 40%;
		position: fixed;
		z-index: 1;
		top: 0;
		left: 0;
	}
	.login-form {
		margin-top: 80%;
	}
	.register-form {
		margin-top: 20%;
	}
}

.login-main-text {
	margin-top: 20%;
	padding: 60px;
	color: #000;
}

.login-main-text h2 {
	font-weight: 300;
}

.btn-black {
	background-color: #fedb43;
	color: #fff;
}
</style>
</head>
<body>
	<div class="sidenav">
		<div class="login-main-text">
			<a href="Main.jsp"><img alt="SE Restaurant" src="img/Logo.png"
				width="360px" height="120px"></a><br>
			<br>
			<br>
			<br>
			<h2>예약 확인</h2>
		</div>
	</div>
	<div class="main">
		<div class="col-md-6 col-sm-12">
			<div class="login-form">
				<form action="Customer_LoginAction.jsp" method="post">
					<div class="form-group">
						<label>User Name</label> <input type="text" class="form-control"
							name="inputName" placeholder="성함" />
					</div>
					<div class="form-group">
						<label>User Phone</label> <input type="text" class="form-control"
							name="inputPhone" placeholder="전화번호" />
					</div>
					<input type="submit" class="btn btn-default" value="예약 확인" />
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>