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
 * Servlet implementation class ModifyServlet
 */
@WebServlet("/Modify.do")
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyServlet() {
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
		String btn = request.getParameter("BTN");
		int result = -1;
		if(btn.equals("변 경")) {
			String brand =request.getParameter("BRAND");
			String name = request.getParameter("NAME");
			String silo = request.getParameter("SILO");
			String price = request.getParameter("PRICE");
			String desc = request.getParameter("DESC");
			String pic = request.getParameter("PICTURE");
			result = Update(num, brand, name, silo, price, desc, pic);
			response.sendRedirect("itemEntry.jsp?R="+result);
		}else if(btn.equals("삭 제")){
			result = Delete(num);
			response.sendRedirect("listdelete.jsp?R="+result);
		}
		
	}
	
	protected int Update(String num, String brand, String name, String silo, String price, String desc, String pic) {
		String update = "update cleats_tbl set num = ?, brand = ?, name =?, silo=?, price=?, description=?, picture=? where num =?";
		Connection con = null;  PreparedStatement pstmt = null; int result = -1;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","hr","hr");
			pstmt =con.prepareStatement(update);
			pstmt.setInt(1, Integer.parseInt(num));
			pstmt.setString(2, brand); 
			pstmt.setString(3, name);
			pstmt.setString(4, silo); 
			pstmt.setInt(5, Integer.parseInt(price));
			pstmt.setString(6, desc); 
			pstmt.setString(7, pic); 
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("업데이트 중 문제 발생!");
		}finally {
			try {
				pstmt.close(); con.close();
			}catch (Exception e) {}
		}
		return result;
	}
	
	protected int Delete(String num) {
		String delete = "delete from cleats_tbl where num =?";
		Connection con = null; PreparedStatement pstmt = null; int result = -1;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","hr","hr");
			pstmt = con.prepareStatement(delete);
			pstmt.setInt(1, Integer.parseInt(num));
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("삭제 중 문제발생!");
		}finally {
			try {
				con.close(); pstmt.close();
			}catch (Exception e) {}
		}
		return result;
	}

}









