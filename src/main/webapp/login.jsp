<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
    <script type="text/javascript">
        function check(frm) {
            if (frm.ID.value === "") {
                alert("������ �Է����ּ���.");
                frm.ID.focus();
                return false;
            }
            if (frm.PWD.value === "") {
                alert("��ȣ�� �Է����ּ���.");
                frm.PWD.focus();
                return false;
            }
        }
    </script>
</head>
<body>
    <div id="wrapper" align="center">
        <header>
            <h1>"What is your best cleats?"</h1>
            <img alt="" src="img/mainbanner.jpg" width="665">
        </header>
        <form action="login.do" method="post" onsubmit="return check(this)">
            <table border="1" width="650">
                <tr>
                    <th colspan="2"><h2>�� �� ��</h2></th>
                </tr>
                <tr>
                    <td>
                        <nav><%@ include file="menu.jsp" %></nav>
                    </td>
                </tr>
                <tr>
                    <td>
                        <section>
                            <% String check = request.getParameter("CHECK"); if(check!=null){ %>
                                <script type="text/javascript">
                                    alert("�� ���񽺸� �̿��ϰ�����ø� �α������ּ���.");
                                </script>
                            <% } %>
                            <table align="center">
                                <tr>
                                    <th>
                                        �� �� : <input type="text" name="ID" size="10"/>
                                        �� ȣ : <input type="password" name="PWD" size="10"/>
                                        <input type="submit" value="�α���"/>
                                        <input type="reset" value="�� ��"/>
                                        <a href="userEntry.jsp">
                                            <input type="button" value="�ű԰���">
                                        </a>
                                    </th>
                                </tr>
                            </table>
                        </section>
                    </td>
                </tr>
            </table>
        </form>
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