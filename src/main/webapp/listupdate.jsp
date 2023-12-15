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
	<h2>상품 등록 화면</h2>
</header>
<nav>
<%@ include file="menu.jsp" %>
</nav>
<section>
<%	    Cleats cl = (Cleats)request.getAttribute("LIST"); %>
<form action="listUpdateDo.do" method="post" name="item" onsubmit="return check(this)">
<input type="hidden" name="codeChecked" value="<%= cl.getNum() %>">
<table>
 	<tr><th>구 분</th><td><input type="text" name="NUM" value="<%= cl.getNum() %>"></td></tr><%--<input type="button" value="중복 검사" onclick="numCheck()"/> --%>
	<tr><th>브 랜 드</th><td><input type="text" name="BRAND" value="<%= cl.getBrand() %>"></td></tr>
	<tr><th>제 품 명</th><td><input type="text" name="NAME" value="<%= cl.getName() %>"></td></tr>
	<tr><th>사 일 로</th><td><input type="text" name="SILO" value="<%= cl.getSilo() %>"></td></tr>
	<tr><th>가 격</th><td><input type="text" name="PRICE" value="<%= cl.getPrice() %>"></td></tr>
	<tr><th>제품설명</th><td><textarea rows="5" name="DESC"><%= cl.getDesc() %></textarea></td></tr>
	<tr><th>제품사진</th><td><input type="text" rows="5" name="PIC" value="<%= cl.getPictrue() %>"></td></tr>
	
	<tr><td colspan="2" align="center">
		<input type="submit" value="완 료"/>
		<input type="reset" value="취 소"/></td></tr>
</table>
</form>



<script type="text/javascript">
function check(){
	if(frm.NUM.value==""){
		alert("구분을 입력해주세요."); frm.NUM.focus(); return false;
	}
	var num = document.frm.NUM.value;
// 	var url = "numCheck.do?NUM="+num;
// 	window.open(url,"_blank_","width=450,height=200");
	if(document.frm.BRAND.value==""){
		alert("브랜드 이름을 입력해주세요."); document.frm.BRAND.focus(); return false;
	}
	if(document.frm.NAME.value==""){
		alert("제품명을 입력해주세요."); document.frm.NAME.focus(); return false;
	}
	if(document.frm.SILO.value==""){
		alert("사일로를 입력해주세요."); document.frm.SILO.focus(); return false;
	}
	if(document.frm.PRICE.value==""){
		alert("가격을 입력해주세요."); document.frm.PRICE.focus(); return false;
	}
	if(document.frm.DESC.value==""){
		alert("제품설명을 입력해주세요."); document.frm.DESC.focus(); return false;
	}
	if(document.frm.PIC.value==""){
		alert("제품사진을 입력해주세요."); document.frm.DESC.focus(); return false;
	}
	if( ! confirm("등록하시겠습니까??")) return;
}

</script>
</section>
</div>
</body>
</html>