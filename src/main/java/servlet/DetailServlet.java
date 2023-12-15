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

import cleats.Cleats;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/Detail.do")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("NUM");
		String select = "select * from cleats_tbl where num = ?";
		Connection con = null; PreparedStatement pstmt = null; ResultSet rs = null;
		Cleats cl = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","hr","hr");
			pstmt = con.prepareStatement(select);
			pstmt.setInt(1, Integer.parseInt(num));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cl = new Cleats();
				cl.setNum(rs.getInt(1));
				cl.setBrand(rs.getString(2));
				cl.setName(rs.getString(3));
				cl.setSilo(rs.getString(4));
				cl.setPrice(rs.getInt(5));
				cl.setDesc(rs.getString(6));
				cl.setPictrue(rs.getString(7));
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				rs.close(); con.close(); pstmt.close();
			}catch (Exception e) {}
		}
		request.setAttribute("CLEATS", cl);
		RequestDispatcher rd = request.getRequestDispatcher("detail.jsp");
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
