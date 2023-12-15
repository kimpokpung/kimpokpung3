package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NumCheckServlet
 */
@WebServlet("/numCheck.do")
public class NumCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NumCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("NUM");
		String q = "select count(*) from cleats_tbl where num=?";
		int result = -1;
		Connection con=null; PreparedStatement pstmt=null; ResultSet rs=null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","hr","hr");
			pstmt=con.prepareStatement(q);
			pstmt.setInt(1, Integer.parseInt(num));
			rs=pstmt.executeQuery();//select실행
			if(rs.next()) {
				result=rs.getInt(1);//조회결과를 저장
			}
		} catch (Exception e) {
			System.out.println("상품 중복 검사중 문제 발생");
			System.out.println(e.getMessage());
		}finally {
			try {
				rs.close(); pstmt.close(); con.close();
			} catch (Exception e) {

			}
		}
		request.setAttribute("NUM", num);//계정을 저장
		request.setAttribute("RS", result);//중복검사의 결과
		RequestDispatcher rd = request.getRequestDispatcher("idCheckResult.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
