<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="booksys.application.persistency.ReservationMapper"%>

<%
ReservationMapper rm = new ReservationMapper();

if (request.getParameter("time") == "") {
%>
<script>
	alert("시간을 입력하세요");
	location.href = 'Manager_Modify.jsp'
</script>
<%
} else if (request.getParameter("covers") == "") {
%>
<script>
	alert("인원수를 입력하세요");
	location.href = 'Manager_Modify.jsp'
</script>
<%
} else if (!rm.overflow(request.getParameter("covers"), request.getParameter("table_id")) && rm.editReservation(request.getParameter("time"), request.getParameter("covers"), request.getParameter("table_id"),
		request.getParameter("customer_id"), request.getParameter("roid"))) {
%>
<script>
	alert("예약이 수정되었습니다!");
	location.href = 'Manager_Modify.jsp'
</script>
<%
} else {
%>
<script>
	alert("다시 입력해주세요");
	location.href = 'Manager_Modify.jsp'
</script>
<%
}
%>