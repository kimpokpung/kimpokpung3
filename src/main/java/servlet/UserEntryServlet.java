package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EntryServlet
 */
@WebServlet("/userEntry.do")
public class UserEntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserEntryServlet() {
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
		String pw = request.getParameter("PW");
		String name =request.getParameter("NAME");
		String addr = request.getParameter("ADDR");
		String email = request.getParameter("EMAIL");
		String phone = request.getParameter("PHONE");
		String insert = "insert into users_tbl values(?,?,?,?,?,?,'amature')";
		Connection con = null; PreparedStatement pstmt = null;
		int result = -1;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","hr","hr");
			pstmt = con.prepareStatement(insert);
			pstmt.setString(1, id);
			pstmt.setString(2, pw); 
			pstmt.setString(3, name);
			pstmt.setString(4, addr); 
			pstmt.setString(5, email);
			pstmt.setString(6, phone); 
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("사용자 등록중 문제 발생!");
		}finally {
			try {
				pstmt.close(); con.close();
			}catch (Exception e) {
			}
		}
		response.sendRedirect("userEntryResult.jsp?R="+result);
	}

}








