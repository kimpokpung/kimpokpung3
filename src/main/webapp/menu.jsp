<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<style type="text/css">
  td {
    text-align: center;
  }
</style>
<div align="center">
  <table border="1" width="655">
    <%
      String id = (String)session.getAttribute("ID");
      String admin = (String)session.getAttribute("ADMIN");
    %>
    <tr>
      <td width="210"><a href="ListServlet">상품 목록</a></td>
      <% if(admin != null) { %>
        <td width="210"><a href="loginCheck.do">상품 등록</a></td>
      <% } %>
      <% if(id != null || admin != null) { %>
        <td width="210"><a href="logout.do">로그아웃 하기</a></td>
      <% } else { %>
        <td width="210"><a href="login.jsp">로그인</a></td>
      <% } %>
    </tr>
    <% if(id != null || admin != null) { %>
      <tr>
        <% if(admin != null) { %>
          <td colspan="3" align="center"><div>환영합니다 <%= admin %>님</div></td>
        <% } else { %>
          <td colspan="3" align="center"><div>환영합니다 <%= id %>님</div></td>
        <% } %>
      </tr>
    <% } %>
  </table>
</div>