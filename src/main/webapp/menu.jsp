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
      <td width="210"><a href="ListServlet">��ǰ ���</a></td>
      <% if(admin != null) { %>
        <td width="210"><a href="loginCheck.do">��ǰ ���</a></td>
      <% } %>
      <% if(id != null || admin != null) { %>
        <td width="210"><a href="logout.do">�α׾ƿ� �ϱ�</a></td>
      <% } else { %>
        <td width="210"><a href="login.jsp">�α���</a></td>
      <% } %>
    </tr>
    <% if(id != null || admin != null) { %>
      <tr>
        <% if(admin != null) { %>
          <td colspan="3" align="center"><div>ȯ���մϴ� <%= admin %>��</div></td>
        <% } else { %>
          <td colspan="3" align="center"><div>ȯ���մϴ� <%= id %>��</div></td>
        <% } %>
      </tr>
    <% } %>
  </table>
</div>