<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="cleats.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
<div align="center">
<header>
	<h2>��ǰ ��� ȭ��</h2>
</header>
<nav>
<%@ include file="menu.jsp" %>
</nav>
<section>
<%	    Cleats cl = (Cleats)request.getAttribute("LIST"); %>
<form action="listUpdateDo.do" method="post" name="item" onsubmit="return check(this)">
<input type="hidden" name="codeChecked" value="<%= cl.getNum() %>">
<table>
 	<tr><th>�� ��</th><td><input type="text" name="NUM" value="<%= cl.getNum() %>"></td></tr><%--<input type="button" value="�ߺ� �˻�" onclick="numCheck()"/> --%>
	<tr><th>�� �� ��</th><td><input type="text" name="BRAND" value="<%= cl.getBrand() %>"></td></tr>
	<tr><th>�� ǰ ��</th><td><input type="text" name="NAME" value="<%= cl.getName() %>"></td></tr>
	<tr><th>�� �� ��</th><td><input type="text" name="SILO" value="<%= cl.getSilo() %>"></td></tr>
	<tr><th>�� ��</th><td><input type="text" name="PRICE" value="<%= cl.getPrice() %>"></td></tr>
	<tr><th>��ǰ����</th><td><textarea rows="5" name="DESC"><%= cl.getDesc() %></textarea></td></tr>
	<tr><th>��ǰ����</th><td><input type="text" rows="5" name="PIC" value="<%= cl.getPictrue() %>"></td></tr>
	
	<tr><td colspan="2" align="center">
		<input type="submit" value="�� ��"/>
		<input type="reset" value="�� ��"/></td></tr>
</table>
</form>



<script type="text/javascript">
function check(){
	if(frm.NUM.value==""){
		alert("������ �Է����ּ���."); frm.NUM.focus(); return false;
	}
	var num = document.frm.NUM.value;
// 	var url = "numCheck.do?NUM="+num;
// 	window.open(url,"_blank_","width=450,height=200");
	if(document.frm.BRAND.value==""){
		alert("�귣�� �̸��� �Է����ּ���."); document.frm.BRAND.focus(); return false;
	}
	if(document.frm.NAME.value==""){
		alert("��ǰ���� �Է����ּ���."); document.frm.NAME.focus(); return false;
	}
	if(document.frm.SILO.value==""){
		alert("���Ϸθ� �Է����ּ���."); document.frm.SILO.focus(); return false;
	}
	if(document.frm.PRICE.value==""){
		alert("������ �Է����ּ���."); document.frm.PRICE.focus(); return false;
	}
	if(document.frm.DESC.value==""){
		alert("��ǰ������ �Է����ּ���."); document.frm.DESC.focus(); return false;
	}
	if(document.frm.PIC.value==""){
		alert("��ǰ������ �Է����ּ���."); document.frm.DESC.focus(); return false;
	}
	if( ! confirm("����Ͻðڽ��ϱ�??")) return;
}

</script>
</section>
</div>
</body>
</html>