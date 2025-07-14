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
import java.util.Date;

/**
 * Servlet implementation class addReminderServlet
 */
@WebServlet("/addReminderServlet")
public class addReminderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addReminderServlet() {
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
		
		int rid=0;
		String rtitle=request.getParameter("title");
		String rdesc=request.getParameter("description");
		String rdate=request.getParameter("reminderDate");
		int uid=GetSet.getUid();
		Connection conn=Dbconnection.connect();
		try {
			PreparedStatement pstmt=conn.prepareStatement("insert into reminder values(?,?,?,?,?)");
			pstmt.setInt(1, rid);
			pstmt.setString(2, rtitle);
			pstmt.setString(3, rdesc);
			pstmt.setString(4, rdate);
			pstmt.setInt(5, uid);
			
			int i = pstmt.executeUpdate();
			System.out.println(i);
			if(i>0) {
				response.sendRedirect("dashboard.html");
			}else {
				PrintWriter out=null;
				out.println("<h2 style='color: red;'>❌ Remainder not added..!</h2>");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
