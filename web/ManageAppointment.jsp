<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Appointments</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
                margin: 0;
                padding: 0;
            }
            header {
                background-color: #e1d5f7; /* Header background color */
                color: #333;
                padding: 20px 0;
                text-align: center;
                position: fixed;
                width: 100%;
                top: 0;
                z-index: 1000;
            }
            header h1 {
                margin: 0;
                font-size: 2em;
            }
            header nav {
                margin-top: 10px;
            }
            header nav a {
                color: #333;
                text-decoration: none;
                padding: 10px 20px;
                margin: 0 10px;
                border-bottom: 2px solid transparent;
                transition: all 0.3s ease;
            }
            header nav a:hover,
            header nav a.active {
                border-bottom: 2px solid #333;
            }
            .container {
                max-width: 900px; /* Adjusted width */
                margin: 130px auto 0; /* Adjusted for fixed header */
                background: #d1a3ff;
                padding: 40px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            h1 {
                color: #333;
                text-align: center;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background: white;
                border-radius: 8px;
                overflow: hidden;
            }
            table, th, td {
                border: 1px solid #ddd;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #e1e1e1;
            }
            .button-container {
                text-align: center;
                margin: 20px 0;
            }
            .button-container form {
                display: inline;
            }
            .button-container button {
                background-color: #4c6ef5;
                color: white;
                border: none;
                padding: 10px 20px;
                margin: 5px;
                cursor: pointer;
                font-size: 16px;
                border-radius: 4px;
            }
            .button-container button:hover {
                background-color: #364fc7;
            }
                    a.button-back {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 20px;
            background-color: #4c6ef5;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            text-align: center;
        }
        a.button-back:hover {
            background-color: #364fc7;
        }
        </style>
    </head>
    <body>
        <header>
            <h1>Appointment Request System</h1>
            <nav>
                <a href="Lecturer.jsp">Home</a>
                <a href="lecturerList.jsp">Lecturer List</a>
                <a href="profile.jsp">Profile</a>
                <a href="login.jsp">Log Out</a>
            </nav>
        </header>
        <div class="container">
            <a href="Lecturer.jsp"class="button-back">Back</a>
            <h2>Manage Appointments</h2>
            <h2>Pending Appointment Requests</h2>
            <table>
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Assuming the lecturer's ID is stored in the session
                        Integer lecturerId = (Integer) session.getAttribute("id");
                        if (lecturerId == null) {
                            out.println("<p>Error: Lecturer ID is not set in the session.</p>");
                        } else {
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment_system", "root", "admin");
                                String query = "SELECT a.id, s.name AS studentName, a.date, a.time, a.description FROM appointments a JOIN students s ON a.student_id = s.id WHERE a.lecturer_id = ? AND a.status = 'pending'";
                                PreparedStatement pstmt = con.prepareStatement(query);
                                pstmt.setInt(1, lecturerId);
                                ResultSet rs = pstmt.executeQuery();
                                while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("studentName") %></td>
                        <td><%= rs.getDate("date") %></td>
                        <td><%= rs.getTime("time") %></td>
                        <td><%= rs.getString("description") %></td>
                        <td class="button-container">
                            <form action="UpdateAppointmentStatus.jsp" method="post">
                                <input type="hidden" name="appointmentId" value="<%= rs.getInt("id") %>">
                                <input type="hidden" name="status" value="approved">
                                <button type="submit">Approve</button>
                            </form>
                            <form action="UpdateAppointmentStatus.jsp" method="post">
                                <input type="hidden" name="appointmentId" value="<%= rs.getInt("id") %>">
                                <input type="hidden" name="status" value="rejected">
                                <button type="submit">Reject</button>
                            </form>
                        </td>
                    </tr>
                    <%
                                }
                                con.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
