<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String r= request.getParameter("R");
%>
<script type="text/javascript">
alert("�α׾ƿ� �Ǿ����ϴ�.");
location.href = "ListServlet";
</script>
</body>
</html>