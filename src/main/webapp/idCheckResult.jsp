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
<h2>계정 중복 확인</h2>
<%
	String id = (String)request.getAttribute("ID");
	int rs = (int)request.getAttribute("RS");
%>
<form action = "idCheck.do" name="fm">
	계 정 : <input type="text" name="IDD" value="<%= id %>"/>
			<input type="submit" value="중복검사"/>
</form>
<%	if(rs==0){ %>
	<%= id %>는 사용 가능합니다
	<input type="button" value="사용" onclick="idOK()"/>
<%
	}else{
%>
	<%= id %>는 이미 사용중입니다
<% 
	}
%>
</div>
<script type="text/javascript">
function idOK(){
	var id = document.fm.IDD.value;
	opener.document.frm.ID.value = id;
	opener.document.frm.ID.readOnly=true;
	opener.document.frm.idChecked.value="OK";//중복검사용 파라미터에 값을 넣는다
	self.close();//팝업창을 닫는다
}
</script>
</body>
</html>