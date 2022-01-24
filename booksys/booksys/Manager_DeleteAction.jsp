<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="booksys.application.persistency.ReservationMapper"%>
<%
ReservationMapper rm = new ReservationMapper();
String roid = request.getParameter("roid");
String name = request.getParameter("name");
String phone = request.getParameter("phone");
if (rm.deleteReservation(roid, name, phone)) {
%>
<script>
	alert("예약이 삭제되었습니다!");
	location.href = 'Manager_Modify.jsp'
</script>
<%
} else {
%>
<script>
	alert("삭제 오류");
	location.href = 'Manager_Modify.jsp'
</script>
<%
}
%>