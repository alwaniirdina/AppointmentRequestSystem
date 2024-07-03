<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.annotation.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Page</title>
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
            .buttons {
                display: flex;
                flex-direction: column;
            }
            .buttons button {
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <% 
                // Check if the user is logged in and is an admin
               
                if (session == null || session.getAttribute("role") == null || !"admin".equalsIgnoreCase((String)session.getAttribute("role"))) {
                    response.sendRedirect("login.jsp");
                    return;
                }
                String username = (String) session.getAttribute("username");
            %>
            <h1>Hi, Welcome, <%= username %>!</h1>
            
            <div class="buttons">
                <button onclick="location.href='ViewLecturers.jsp'">View Lecturers List</button>
                <button onclick="location.href='AddLecturer.jsp'">Add New Lecturer</button>
            </div>
        </div>
    </body>
</html>
