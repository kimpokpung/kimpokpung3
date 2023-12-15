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
<h2>상품 중복 확인</h2>
<%
	int num = (int)request.getAttribute("NUM");
	int rs = (int)request.getAttribute("RS");
%>
<form action = "numCheck.do" name="fm">
	계 정 : <input type="text" name="NMB" value="<%= num %>"/>
			<input type="submit" value="중복검사"/>
</form>
<%	if(rs==0){ %>
	<%= num %>은 사용 가능합니다
	<input type="button" value="사용" onclick="numOK()"/>
<%
	}else{
%>
	<%= num %>은 이미 사용중입니다
<% 
	}
%>
</div>
<script type="text/javascript">
function numOK(){
	var num = document.fm.NMB.value;
	opener.document.frm.NUM.value = num;
	opener.document.frm.NUM.readOnly=true;
	opener.document.frm.numChecked.value="OK";//중복검사용 파라미터에 값을 넣는다
	self.close();//팝업창을 닫는다
}
</script>
</body>
</html>