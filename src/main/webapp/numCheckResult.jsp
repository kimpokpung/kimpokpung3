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
<h2>��ǰ �ߺ� Ȯ��</h2>
<%
	int num = (int)request.getAttribute("NUM");
	int rs = (int)request.getAttribute("RS");
%>
<form action = "numCheck.do" name="fm">
	�� �� : <input type="text" name="NMB" value="<%= num %>"/>
			<input type="submit" value="�ߺ��˻�"/>
</form>
<%	if(rs==0){ %>
	<%= num %>�� ��� �����մϴ�
	<input type="button" value="���" onclick="numOK()"/>
<%
	}else{
%>
	<%= num %>�� �̹� ������Դϴ�
<% 
	}
%>
</div>
<script type="text/javascript">
function numOK(){
	var num = document.fm.NMB.value;
	opener.document.frm.NUM.value = num;
	opener.document.frm.NUM.readOnly=true;
	opener.document.frm.numChecked.value="OK";//�ߺ��˻�� �Ķ���Ϳ� ���� �ִ´�
	self.close();//�˾�â�� �ݴ´�
}
</script>
</body>
</html>