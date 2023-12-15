<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
header{
	font-family: '맑음고딕','굴림체';
	color: white;
}
footer{
	font-family: '맑음고딕','굴림체';
	color: white;
}
body {
	font-family: '맑음고딕','굴림체';
	background-image: url('img/jin.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	}
</style>
</head>
<body>
<%
	String result = request.getParameter("R");
	if(result.equals("0")){
%>
<script type="text/javascript">
alert("작업에 실패하였습니다.");
location.href="LoLListServlet";
</script>
<%
	}else{
%>
<script type="text/javascript">
alert("작업이 정상적으로 완료되었습니다.");
location.href="LoLListServlet";
</script>
<%
	}
%>
</body>
</html>