<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<meta charset="UTF-8">
<%@ page import="java.util.*,cleats.*" %>
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
<link href="/style.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
</head>
<body>
<div align="center">
<header>
	<h1>"What is your best cleats?"</h1>
	<img alt="" src="img/mainbanner.jpg" width="655">
</header>
<nav><%@ include file="menu.jsp" %></nav>
  <section>
    <%
    ArrayList<Cleats> list = (ArrayList<Cleats>)request.getAttribute("LIST");
    int count = list.size();
    String adminn = (String)session.getAttribute("ADMIN");
    if(count == 0){
    %>
      <h3>제품 목록이 없습니다.</h3>
    <%
    } else {
    %>
        <table border="1" width="655"><td width="70">구 분</td><td width="110">브 랜 드</td><td width="110">제 품 명</td><td width="110">사 일 로</td><td width="110">가 격</td>
        <% 
                if(adminn != null) { 
                %>

        <td width="110">수정/삭제</td></table>
      <% } %>
      <table border="1" width="655"><tbody>
      <%
      for(int i=0;i<count;i++){
          Cleats cl = list.get(i);
      %>
        <tr><form action="ListupServlet.do" method="post" value="<%=cl.getNum() %>">
        	 	<input type="hidden" name="NUM" value="<%= cl.getNum() %>"><td align="center" width="51"><a href="Detail.do?NUM=<%=cl.getNum() %>"><%=cl.getNum() %></a></td>
          <td width="80"><%= cl.getBrand() %></td>
          <td width="80"><%= cl.getName() %></td>
          <td width="80"><%= cl.getSilo() %></td>
          <td width="80"><%= cl.getPrice() %></td>
                <% 
                if(adminn != null) { 
                %>
          <td width="80"><input type="submit" value="수 정" name="BTN"><input type="submit" value="삭 제" name="BTN"></td>
        </form></tr>  	
      <% } %>
      <%
      }
      %>
      </tbody></table>
    <%
    }
    %>



	  </section>
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