<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="booksys.application.persistency.LoginMapper"%>
<%
request.setCharacterEncoding("UTF-8");

String inputName = null;
String inputPhone = null;

if (request.getParameter("inputName") == null) {
%>
<script>
	alert("이름을 입력하세요");
	location.href = 'Customer_login.jsp'
</script>
<%
} else if (request.getParameter("inputPhone") == null) {
%>
<script>
	alert("전화번호를 입력하세요");
	location.href = 'Customer_login.jsp'
</script>
<%
} else {
inputName = request.getParameter("inputName");
inputPhone = request.getParameter("inputPhone");
LoginMapper lm = new LoginMapper();
if (lm.login(inputName, inputPhone)) {
	session.setAttribute("name", inputName);
	session.setAttribute("phone", inputPhone);
	response.sendRedirect("Customer_loggedin.jsp");
} else {
%>
<script>
	alert("예약 확인 실패");
	location.href = 'Customer_login.jsp'
</script>
<%
}
}
%>