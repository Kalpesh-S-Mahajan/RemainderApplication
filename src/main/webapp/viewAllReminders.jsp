<%@ page import="java.sql.*" %>
<%@ page import="com.reminder.Dbconnection" %>
<%@ page import="com.reminder.GetSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Reminders</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            padding: 30px;
        }

        .container {
            max-width: 900px;
            margin: auto;
            background-color: #ffffff;
            padding: 25px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
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

        .delete-link {
            color: red;
            text-decoration: none;
            font-weight: bold;
        }

        .delete-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>📋 All Reminders</h2>

    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            int uid = GetSet.getUid();

            conn = Dbconnection.connect();
            pstmt = conn.prepareStatement("SELECT * FROM reminder WHERE uid = ? ORDER BY rdate DESC");
            pstmt.setInt(1, uid);
            rs = pstmt.executeQuery();

            boolean hasData = false;
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Date</th>
            <th>Action</th>
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
            <td>
                <a class="delete-link"
                   href="deleteReminder.jsp?rid=<%= rs.getInt("rid") %>"
                   onclick="return confirm('Are you sure you want to delete this reminder?');">
                   ❌ Delete
                </a>
            </td>
        </tr>
    <%
        }

        if (!hasData) {
    %>
        <tr>
            <td colspan="5" class="no-data">No reminders found.</td>
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

    <div style="text-align: center;">
        <a class="back-btn" href="dashboard.html">⬅ Back to Dashboard</a>
    </div>
</div>

</body>
</html>
