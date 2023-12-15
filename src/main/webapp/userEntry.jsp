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
</style>
</head>
<body>
<div align="center">
<header>
	<h1>"What is your best cleats?"</h1>
	<img alt="" src="img/mainbanner.jpg" width="655">
</header>
<nav>
<%@ include file="menu.jsp" %>
</nav>
<table>
		<tr><th colspan="10"><h2>회 원 가 입</h2></th></tr>

<section>
<form action="userEntry.do" method="post" name="frm" onsubmit="return check(this)">
<input type="hidden" name="idChecked">
 		<tr><th class="header">I D</th><td class="mid"><input type="text" name="ID"></td></tr><!--<input type="button" value="중복 검사" onclick="idCheck()"/> -->
		<tr><th class="header">P W D</th><td class="mid"><input type="text" name="PW"></td></tr>
		<tr><th class="header">이 름</th><td class="mid"><input type="text" name="NAME"></td></tr>
		<tr><th class="header">주 소</th><td class="mid"><input type="text" name="ADDR"></td></tr>
		<tr><th class="header">이 메 일</t><td class="mid"><input type="text" name="EMAIL"></td></tr>
		<tr><th class="header">전화번호</th><td class="mid"><input type="text" name="PHONE"></td></tr>
		<tr><th colspan="5" align="center"><input type="submit" value="등 록"/><input type="reset" value="취 소"/></tr>
</form>
</section>
<script type="text/javascript">
function check(){
	if(frm.ID.value==""){
		alert("ID를 입력해주세요."); frm.ID.focus(); return false;
	}
	var id = document.frm.ID.value;
// 	var url = "idCheck.do?ID="+id;
// 	window.open(url,"_blank_","width=450,height=200");
	if(document.frm.PW.value==""){
		alert("암호를 입력해주세요."); document.frm.PW.focus(); return false;
	}
	if(document.frm.NAME.value==""){
		alert("이름을 입력해주세요."); document.frm.NAME.focus(); return false;
	}
	if(document.frm.ADDR.value==""){
		alert("주소를 입력해주세요."); document.frm.ADDR.focus(); return false;
	}
	if(document.frm.EMAIL.value==""){
		alert("이메일을 입력해주세요."); document.frm.EMAIL.focus(); return false;
	}
	if( ! confirm("등록하시겠습니까??")) return;
}
</script>
</div>
<!-- <footer> -->
<!--   <div id="wrapper"> -->
<!--     <table> -->
<!--       <tr><th>World Best Cleats Store WBCL</th></tr> -->
<!--       <tr align="left"><td>Tel : 000-0000-0000 (AM10:00~PM07:00)</td></tr> -->
<!--       <tr align="left"><td>e-mail : cleats@google.com</td></tr> -->
<!--     </table> -->
<!--   </div> -->
<!-- </footer> -->
</body>
</html>





