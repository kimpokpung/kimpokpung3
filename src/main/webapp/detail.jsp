<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="cleats.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
header {background-color: green; color: black;}
}
th, td {
    border: 1px solid black;
    padding: 8px;

}
</style>
</head>
<body>
<div align="center">
<header>
	<h1>"What is your best cleats?"</h1>
	<img alt="" src="img/mainbanner.jpg" width="655" height="180">
</header>

<section>
<%
Cleats cl = (Cleats)request.getAttribute("CLEATS");
%>
<form action="Modify.do" method="post" onsubmit="return check(this)">
<nav><%@ include file="menu.jsp" %></nav>
<table border="1">
<tr><th>구 분</th><td class="mid" colspan="2"><%= cl.getNum()%></td></tr>
<tr><th rowspan="5"><img alt="" src="img/<%= cl.getPictrue() %>" height="223"></th></tr>
<tr><th>브 랜 드</th><td><%= cl.getBrand() %></td></tr>
<tr><th>제 품 명</th><td><%= cl.getName() %></td></tr>
<tr><th>사 일 로</th><td><%= cl.getSilo() %></td></tr>
<tr><th>가 격</th><td><%= cl.getPrice() %></td></tr>
<tr><th>정 보</th><td colspan="2"><%= cl.getDesc() %></td></tr>
</table>
</form>
</section>
</script>
</div>
<!-- <footer> -->
<!--   <div id="wrapper"> -->
<!--     <table> -->
<!--       <tr><th>World Best Cleats Store WBCL</th></tr> -->
<!--       <tr align="left"><td>Tel : 000-0000-0000 (AM10:00~PM07:00)</td></tr> -->
<!--       <tr align="left"><td>e-mail : cleats@google.com</td></tr> -->
<!--     </table> -->
<!--   </div> -->
<!-- </footer> -->
</body>
</html>








