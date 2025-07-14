<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.reminder.Dbconnection" %>
<%@ page import="com.reminder.GetSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Today's Reminders</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            padding: 40px 20px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background-color: #ffffff;
            padding: 30px 25px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
            font-size: 15px;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f1f1f1;
        }

        .no-data {
            text-align: center;
            padding: 20px;
            font-size: 16px;
            color: #cc0000;
        }

        .back-btn {
            display: inline-block;
            margin-top: 20px;
            background-color: #007BFF;
            color: white;
            padding: 10px 18px;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }

        .back-btn:hover {
            background-color: #0056b3;
        }

        .btn-container {
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>📅 Today's Reminders</h2>

    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            int uid = GetSet.getUid();

        
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String todayDate = sdf.format(new Date());

            conn = Dbconnection.connect();
            pstmt = conn.prepareStatement("SELECT * FROM reminder WHERE uid = ? AND rdate = ?");
            pstmt.setInt(1, uid);
            pstmt.setString(2, todayDate);
            rs = pstmt.executeQuery();

            boolean hasData = false;
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Date</th>
        </tr>

    <%
        while (rs.next()) {
            hasData = true;
    %>
        <tr>
            <td><%= rs.getInt("rid") %></td>
            <td><%= rs.getString("rtitle") %></td>
            <td><%= rs.getString("rdesc") %></td>
            <td><%= rs.getString("rdate") %></td>
        </tr>
    <%
        }

        if (!hasData) {
    %>
        <tr>
            <td colspan="4" class="no-data">No reminders scheduled for today.</td>
        </tr>
    <%
        }

        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                out.println("<p style='color:red;'>Error closing DB: " + ex.getMessage() + "</p>");
            }
        }
    %>
    </table>

    <div class="btn-container">
        <a class="back-btn" href="dashboard.html">⬅ Back to Dashboard</a>
    </div>
</div>

</body>
</html>
