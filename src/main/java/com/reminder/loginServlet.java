package com.reminder;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String uemail=request.getParameter("email");
		String upassword=request.getParameter("password");
		
		Connection conn=Dbconnection.connect();
		
		
		try {
			PreparedStatement pstmt=conn.prepareStatement("select * from user where uemail=? and upassword=?");
			pstmt.setString(1, uemail);
			pstmt.setString(2, upassword);
			
			ResultSet rs=   pstmt.executeQuery();
			
			if(rs.next()) {
				int uid=rs.getInt(1);
				GetSet.setUid(uid);
				response.sendRedirect("dashboard.html");
			
				
			}else {
				PrintWriter out = null;
				out.println("<h2 style='color: red;'>❌ Invalid username or password!</h2>");
	            
			}
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
