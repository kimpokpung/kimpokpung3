<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
header{
	font-family: '�������','����ü';
	color: white;
}
footer{
	font-family: '�������','����ü';
	color: white;
}
body {
	font-family: '�������','����ü';
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
	alter("��ϵ��� �ʾҽ��ϴ�. �����ڿ��� �����ϼ���")
	location.href="ListServlet";//������� ���ư���
</script>
<%
	} else{
%>
<script type="text/javascript">
	alert("��ϵǾ����ϴ�");
	location.href="ListServlet";//������� ���ư���.
</script>
<%
	}
%>
</body>
</html>