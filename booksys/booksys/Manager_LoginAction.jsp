<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("managerID");
String pw = request.getParameter("managerPW");

if (id.equals("admin") && pw.equals("12345678")) {
%>
<script>
	location.href = "Manager_Confirm.jsp";
</script>
<%
} else {
%>
<script>
	alert("다시 입력하세요");
	location.href = "Manager_login.jsp";
</script>
<%
}
%>