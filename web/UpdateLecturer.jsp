<%-- 
    Document   : UpdateLecturer
    Created on : 3 Jul 2024, 4:56:44 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Update Lecturer</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 20px;
            }
            .container {
                max-width: 400px;
                margin: auto;
                background: white;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            h1 {
                text-align: center;
                color: #333;
            }
            input[type="text"], input[type="password"], select {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ddd;
                box-sizing: border-box;
            }
            button {
                width: 100%;
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px;
                cursor: pointer;
                margin-top: 10px;
            }
            button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Update Lecturer</h1>
            <% 
                String idStr = request.getParameter("id");
                if (idStr == null || idStr.isEmpty()) {
                    response.sendRedirect("ViewLecturers.jsp");
                    return;
                }
                int id = Integer.parseInt(idStr);

                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                String name = "", username = "", email = "", phone = "";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment_system", "root", "admin");
                    String query = "SELECT * FROM lecturers WHERE id = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setInt(1, id);
                    rs = pstmt.executeQuery();

                    if (rs.next()) {
                        name = rs.getString("name");
                        username = rs.getString("username");
                        email = rs.getString("email");
                        phone = rs.getString("phone");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            %>
            <form action="UpdateLecturerServlet" method="post">
                <input type="hidden" name="id" value="<%= id %>">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= name %>" required><br>
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" value="<%= username %>" required><br>
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= email %>" required><br>
                <label for="phone">Phone No:</label>
                <input type="text" id="phone" name="phone" value="<%= phone %>" required><br>
                <button type="submit">Update Lecturer</button>
            </form>
        </div>
    </body>
</html>
