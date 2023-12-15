package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String id = request.getParameter("ID");
		String password = request.getParameter("PWD");
		String select = "select pw from users_tbl where id = ?";
		Connection con = null; PreparedStatement pstmt = null; ResultSet rs= null;
		String result = "NOK"; //로그인 성공유무
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","hr","hr");
			pstmt = con.prepareStatement(select);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String pwd = rs.getString(1);
				if(pwd.equals(password)) {
					result = "OK";//로그인 성공
					HttpSession session = request.getSession();//세션을 생성한다
					if(id.equals("admin")) {
					session.setAttribute("ADMIN", id);//계정을 세션에 저장한다(관리자)
					} else {
						session.setAttribute("ID", id);//계정을 세션에 저장한다(일반)
					}
				}
			}
		} catch (Exception e) {
			System.out.println("로그인 중 문제 발생");
			System.out.println(e.getMessage());
		}finally {
			try {
				rs.close(); pstmt.close(); con.close();
			}catch(Exception e){
				
			}
		}
		response.sendRedirect("loginResult.jsp?R="+result);
	}

}












