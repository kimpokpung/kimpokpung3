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
<h2>���� �ߺ� Ȯ��</h2>
<%
	String id = (String)request.getAttribute("ID");
	int rs = (int)request.getAttribute("RS");
%>
<form action = "idCheck.do" name="fm">
	�� �� : <input type="text" name="IDD" value="<%= id %>"/>
			<input type="submit" value="�ߺ��˻�"/>
</form>
<%	if(rs==0){ %>
	<%= id %>�� ��� �����մϴ�
	<input type="button" value="���" onclick="idOK()"/>
<%
	}else{
%>
	<%= id %>�� �̹� ������Դϴ�
<% 
	}
%>
</div>
<script type="text/javascript">
function idOK(){
	var id = document.fm.IDD.value;
	opener.document.frm.ID.value = id;
	opener.document.frm.ID.readOnly=true;
	opener.document.frm.idChecked.value="OK";//�ߺ��˻�� �Ķ���Ϳ� ���� �ִ´�
	self.close();//�˾�â�� �ݴ´�
}
</script>
</body>
</html>