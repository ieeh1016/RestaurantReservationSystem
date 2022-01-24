<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="booksys.application.persistency.WalkInMapper"%>
<%@page import="booksys.application.persistency.ReservationMapper"%>

<%
WalkInMapper wm = new WalkInMapper();
ReservationMapper rm = new ReservationMapper();

String covers = request.getParameter("covers");
String date = request.getParameter("date");
String time = request.getParameter("time");
String table_id = request.getParameter("table_id");
String menu = request.getParameter("menu");

if (covers == "" || date == "" || time == "" || table_id == "" || menu == "") {
%>
<script>
	alert("모두 입력해주세요");
	location.href = 'Manager_WalkIn.jsp'
</script>
<%
} else if (rm.overflow(covers, table_id)) {
%>
<script>
	alert("다시 입력하세요");
	location.href = 'Manager_WalkIn.jsp'
</script>
<%
} else if (wm.addWalkIn(covers, date, time, table_id, menu)) {
%>
<script>
	alert("워크인이 추가되었습니다!");
	location.href = 'Manager_ConfirmWalkIn.jsp'
</script>

<%
}
%>