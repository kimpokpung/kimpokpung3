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
                alert("계정을 입력해주세요.");
                frm.ID.focus();
                return false;
            }
            if (frm.PWD.value === "") {
                alert("암호를 입력해주세요.");
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
                    <th colspan="2"><h2>로 그 인</h2></th>
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
                                    alert("이 서비스를 이용하고싶으시면 로그인해주세요.");
                                </script>
                            <% } %>
                            <table align="center">
                                <tr>
                                    <th>
                                        계 정 : <input type="text" name="ID" size="10"/>
                                        암 호 : <input type="password" name="PWD" size="10"/>
                                        <input type="submit" value="로그인"/>
                                        <input type="reset" value="취 소"/>
                                        <a href="userEntry.jsp">
                                            <input type="button" value="신규가입">
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