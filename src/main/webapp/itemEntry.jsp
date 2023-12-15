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
<table width="655" border="1" class="cl"><tr><th>상품 등록</th></tr></table>
</header>
<nav><%@ include file="menu.jsp" %></nav>
<section>
<form action="itemEntry.do" method="post" name="frm" onsubmit="return check(this)">
<input type="hidden" name="numChecked">
<table>
<tr><th>구 분</th><td class="mid"><input type="text" name="NUM"></td></tr><!-- <input type="button" value="중복 검사" onclick="numCheck()"/> -->
<tr><th>브 랜 드</th><td><input type="text" name="BRAND"></td></tr>
<tr><th>제 품 명</th><td><input type="text" name="NAME"></td></tr>
<tr><th>사 일 로</th><td><input type="text" name="SILO"></td></tr>
<tr><th>가 격</th><td><input type="text" name="PRICE"></td></tr>
<tr><th>제품설명</th><td><input type="text" name="DESC"></td></tr>
<tr><th>제품사진</th><td><input type="text" name="PIC"></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="등 록"/><input type="reset" value="취 소"/></tr>
</table>
</form>
</section>
<script type="text/javascript">
function check(){
	   if(frm.NUM.value==""){
	      alert("번호를 입력해주세요."); frm.NUM.focus(); return false;
	   }
	   if(frm.BRAND.value==""){
	      alert("브랜드명을 입력해주세요"); frm.BRAND.focus(); return false;
	   }
	   if(frm.NAME.value==""){
	      alert("제품명을 입력해주세요"); frm.NAME.focus(); return false;
	   }
	   if(frm.SILO.value==""){
	      alert("사일로를 입력해주세요"); frm.SILO.focus(); return false;
	   }
	   if(frm.PRICE.value==""){
	      alert("가격을 입력해주세요"); frm.PRICE.focus(); return false;
	   }
	   if(frm.DESC.value==""){
	      alert("제품 설명을 입력해주세요"); frm.DESC.focus(); return false;
	   }
	   if(frm.PIC.value==""){
		      alert("제품 사진을 입력해주세요"); frm.PIC.focus(); return false;
		   }
	   if( ! confirm("등록하시겠습니까??")) return;
	}
</script>
<footer>
</footer>
</div>
</body>
</html>