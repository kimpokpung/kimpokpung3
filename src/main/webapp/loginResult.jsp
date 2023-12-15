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
</header>
<nav>
<%@ include file="menu.jsp" %>
</nav>
<section>
<%
	String result =request.getParameter("R");
	if(result.equals("OK")){
%>
<script type="text/javascript">
alert("로그인 되었습니다.");
location.href = "ListServlet";
</script>
<%
	}else{
%>
<script type="text/javascript">
alert("로그인에 실패하였습니다. 관리자에게 문의해주세요");
location.href = "ListServlet";
</script>
<%
	}
%>
</section>
<footer>

</footer>
</div>
</body>
</html>