<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
header {background-color: green; color: black;}
}
th, td {
    border: 1px solid black;
    padding: 8px;

}
table.cl {background-color: white;}
</style>
</head>
<body>
<div align="center">
<header>
	<h1>"What is your best cleats?"</h1>
	<img alt="" src="img/mainbanner.jpg" width="655">
</header>
<header>
<table width="655" border="1" class="cl"><tr><th>��ǰ ���</th></tr></table>
</header>
<nav><%@ include file="menu.jsp" %></nav>
<section>
<form action="itemEntry.do" method="post" name="frm" onsubmit="return check(this)">
<input type="hidden" name="numChecked">
<table>
<tr><th>�� ��</th><td class="mid"><input type="text" name="NUM"></td></tr><!-- <input type="button" value="�ߺ� �˻�" onclick="numCheck()"/> -->
<tr><th>�� �� ��</th><td><input type="text" name="BRAND"></td></tr>
<tr><th>�� ǰ ��</th><td><input type="text" name="NAME"></td></tr>
<tr><th>�� �� ��</th><td><input type="text" name="SILO"></td></tr>
<tr><th>�� ��</th><td><input type="text" name="PRICE"></td></tr>
<tr><th>��ǰ����</th><td><input type="text" name="DESC"></td></tr>
<tr><th>��ǰ����</th><td><input type="text" name="PIC"></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="�� ��"/><input type="reset" value="�� ��"/></tr>
</table>
</form>
</section>
<script type="text/javascript">
function check(){
	   if(frm.NUM.value==""){
	      alert("��ȣ�� �Է����ּ���."); frm.NUM.focus(); return false;
	   }
	   if(frm.BRAND.value==""){
	      alert("�귣����� �Է����ּ���"); frm.BRAND.focus(); return false;
	   }
	   if(frm.NAME.value==""){
	      alert("��ǰ���� �Է����ּ���"); frm.NAME.focus(); return false;
	   }
	   if(frm.SILO.value==""){
	      alert("���Ϸθ� �Է����ּ���"); frm.SILO.focus(); return false;
	   }
	   if(frm.PRICE.value==""){
	      alert("������ �Է����ּ���"); frm.PRICE.focus(); return false;
	   }
	   if(frm.DESC.value==""){
	      alert("��ǰ ������ �Է����ּ���"); frm.DESC.focus(); return false;
	   }
	   if(frm.PIC.value==""){
		      alert("��ǰ ������ �Է����ּ���"); frm.PIC.focus(); return false;
		   }
	   if( ! confirm("����Ͻðڽ��ϱ�??")) return;
	}
</script>
<footer>
</footer>
</div>
</body>
</html>