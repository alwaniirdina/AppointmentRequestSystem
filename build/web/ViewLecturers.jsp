<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lecturers List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .actions button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .actions button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Lecturers List</h1>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
            <% 
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment_system", "root", "admin");
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM lecturers");

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("name");
                        String username = rs.getString("username");
                        String email = rs.getString("email");
                        String phone = rs.getString("phone");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= username %></td>
                <td><%= email %></td>
                <td><%= phone %></td>
                <td class="actions">
                    <form action="UpdateLecturer.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= id %>">
                        <button type="submit">Update</button>
                    </form>
                    <form action="DeleteLecturerServlet" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= id %>">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
            <% 
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </table>
        <button onclick="location.href='AddLecturer.jsp'">Add New Lecturer</button>
    </div>
</body>
</html>
