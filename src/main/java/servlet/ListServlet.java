package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cleats.Cleats;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet("/ListServlet")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String select = "select * from cleats_tbl";
		Connection con = null; Statement stmt = null; ResultSet rs = null;
		ArrayList<Cleats> list = new ArrayList<Cleats>();
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","hr","hr");
			stmt = con.createStatement();
			rs=stmt.executeQuery(select);
			while(rs.next()) {
				Cleats cl = new Cleats();
				cl.setNum(rs.getInt(1));
				cl.setBrand(rs.getString(2));
				cl.setName(rs.getString(3));
				cl.setSilo(rs.getString(4));
				cl.setPrice(rs.getInt(5));
				cl.setDesc(rs.getString(6));
				cl.setPictrue(rs.getString(7));
				list.add(cl);
			}
		}catch (Exception e) {
			
			// TODO: handle exception
		}finally {
			try {
				con.close(); stmt.close(); rs.close();
			}catch (Exception e) {}
		}
		request.setAttribute("LIST", list);
		RequestDispatcher rd = request.getRequestDispatcher("list.jsp");
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
