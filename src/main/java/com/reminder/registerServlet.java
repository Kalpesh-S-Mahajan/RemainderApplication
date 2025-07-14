package com.reminder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
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
		int uid=Integer.parseInt(request.getParameter("userid"));
		String uname=request.getParameter("name");
		String ucontact=request.getParameter("contact");
		String uemail=request.getParameter("email");
		String upassword=request.getParameter("password");
		
		Connection conn=Dbconnection.connect();
		
		try {
			PreparedStatement pstmt=conn.prepareStatement("insert into user values(?,?,?,?,?)");
			pstmt.setInt(1, uid);
			pstmt.setString(2, uname);
			pstmt.setString(3, ucontact);
			pstmt.setString(4, uemail);
			pstmt.setString(5, upassword);
			
		int i=	pstmt.executeUpdate();
			if(i>0) {
				response.sendRedirect("dashboard.html");
			}else {
				PrintWriter out = response.getWriter();
				out.println("<h2 style='color: red;'>Account not registered.</h2>");
				out.println("<a href='register.html'>🔙 Back to register again..</a>");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
