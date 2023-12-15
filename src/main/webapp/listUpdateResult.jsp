<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<header>
	<h2>제품 수정</h2>
</header>
<nav>
	<%@ include file="menu.jsp" %>
</nav>
<section>
<%
	String result = request.getParameter("R");
	if(result.equals("0")){
%>
<script type="text/javascript">
	alert("수정이 되지 않았습니다.");
	location.href="ListServlet";
</script>
<%	} else { %>
<script type="text/javascript">
	alert("수정되었습니다.");
	location.href="ListServlet";
</script>
<%	} %>
</section>
</div>
</body>
</html>








