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
 * Servlet implementation class ListUpdateServlet
 */
@WebServlet("/listUpdateDo.do")
public class ListUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		String brand =request.getParameter("BRAND");
		String name = request.getParameter("NAME");
		String silo = request.getParameter("SILO");
		String price = request.getParameter("PRICE");
		String desc = request.getParameter("DESC");
		String pic = request.getParameter("PIC");
		String num =request.getParameter("NUM");
		String update = "update cleats_tbl set BRAND=?, NAME=?, SILO=?, PRICE=?, DESCRIPTION=?, PICTURE=? where NUM=?";
		int result = -1; Connection con=null; PreparedStatement pstmt=null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","hr","hr");
			pstmt =con.prepareStatement(update);
			pstmt.setString(1, brand); 
			pstmt.setString(2, name);
			pstmt.setString(3, silo); 
			pstmt.setInt(4, Integer.parseInt(price));
			pstmt.setString(5, desc); 
			pstmt.setString(6, pic); 
			pstmt.setInt(7, Integer.parseInt(num)); 
			result = pstmt.executeUpdate();
			con.commit();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("수정 중 문제발생!");
			System.out.println(e.getMessage());
		}finally {
			try {
				pstmt.close(); con.close();
			} catch (Exception e2) {
				
			}
		}
		response.sendRedirect("listUpdateResult.jsp?R="+result);
	}
}
