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
@WebServlet("/itemEntry.do")
public class ItemEntryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemEntryServlet() {
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
		String num = request.getParameter("NUM");
		String brand = request.getParameter("BRAND");
		String name =request.getParameter("NAME");
		String silo = request.getParameter("SILO");
		String price = request.getParameter("PRICE");
		String desc = request.getParameter("DESC");
		String pic = request.getParameter("PIC");
		String insert = "insert into cleats_tbl values(?,?,?,?,?,?,?)";
		Connection con = null; PreparedStatement pstmt = null;
		int result = -1;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","hr","hr");
			pstmt = con.prepareStatement(insert);
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.setString(2, brand); 
			pstmt.setString(3, name);
			pstmt.setString(4, silo); 
			pstmt.setInt(5, Integer.parseInt(price));
			pstmt.setString(6, desc);
			pstmt.setString(7, pic);
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("상품 등록중 문제 발생!");
			e.printStackTrace();
			System.out.println(e.getMessage());
		}finally {
			try {
				pstmt.close(); con.close();
			}catch (Exception e) {
			}
		}
		response.sendRedirect("itemEntryResult.jsp?R="+result);
	}

}








