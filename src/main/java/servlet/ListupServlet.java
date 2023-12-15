package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cleats.Cleats;

/**
 * Servlet implementation class ListupServlet
 */
@WebServlet("/ListupServlet.do")
public class ListupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String num = request.getParameter("NUM");
		System.out.println(num);
		String select = "select * from cleats_tbl where num=?";
		String mod = request.getParameter("BTN");
		System.out.println(mod);
		Connection con=null; PreparedStatement pstmt=null; ResultSet rs = null;
		//ArrayList<Cleats> list = new ArrayList<Cleats>();
		Cleats cl = null;
	if(mod.equals("수 정")) {
		System.out.println("수정 번호:"+num);
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","hr","hr");
			pstmt = con.prepareStatement(select);
			pstmt.setInt(1, Integer.parseInt(num));
			rs = pstmt.executeQuery();//select 실행
			if(rs.next()) {
				cl = new Cleats();
				cl.setNum(rs.getInt(1));
				cl.setBrand(rs.getString(2));
				cl.setName(rs.getString(3));
				cl.setSilo(rs.getString(4));
				cl.setPrice(rs.getInt(5));
				cl.setDesc(rs.getString(6));
				cl.setPictrue(rs.getString(7));
				//list.add(cl);
			}
		}catch(Exception e) {
			System.out.println("교과목 변경용 검색 중 문제 발생!");
			System.out.println(e.getMessage());
		}
		//Forward
		request.setAttribute("LIST", cl);
		RequestDispatcher rd = request.getRequestDispatcher("listupdate.jsp");
		rd.forward(request, response);
	}	else if (mod.equals("삭 제")) {
		System.out.println("삭제번호:"+num);
		String delete = "delete from cleats_tbl where num=?";
		int result=-1;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","hr","hr");
			pstmt = con.prepareStatement(delete);
			pstmt.setInt(1, Integer.parseInt(num));
			result = pstmt.executeUpdate();//delete 실행
		}catch(Exception e) {
			System.out.println("제품 삭제 중 문제발생!");
			System.out.println(e.getMessage());
		}finally {
			try {
				pstmt.close(); con.close();
			}catch(Exception e) {}
		}
		//redirect
		response.sendRedirect("listDeleteResult.jsp?R="+result);
	}
	}
}
		

