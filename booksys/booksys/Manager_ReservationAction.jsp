<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="booksys.application.persistency.ReservationMapper"%>
<%
request.setCharacterEncoding("UTF-8");

ReservationMapper rm = new ReservationMapper();

String name = request.getParameter("name");
String phone = request.getParameter("phoneNumber");
String date = request.getParameter("date");
String time = request.getParameter("time");
String table_id = request.getParameter("table_id");
String covers = request.getParameter("covers");
String menu = request.getParameter("menu");

if (name == "" || phone == "" || date == "" || time == "" || table_id == "" || covers == "" || menu == "") {
%>
<script>
	alert("모두 입력해주세요");
	location.href = 'Manager_Reservation.jsp'
</script>
<%
}
if (!rm.overflow(covers, table_id)) {
rm.addReservation(name, phone, date, time, table_id, covers, menu);
%>
<script>
	alert("예약이 추가되었습니다!");
	location.href = 'Manager_Confirm.jsp'
</script>
<%
} else {
%>
<script>
	alert("다시 입력하세요");
	location.href = 'Manager_Reservation.jsp'
</script>
<%
}
%>
