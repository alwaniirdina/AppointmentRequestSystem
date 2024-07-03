<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment Request System</title>
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
            position: relative; /* Added for positioning the buttons */
        }
        .button-container {
            position: absolute;
            top: 20px; /* Adjusted top position */
            right: 20px; /* Adjusted right position */
            display: flex;
            flex-direction: column;
        }
        .button-container button {
            background-color: #4c6ef5;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-bottom: 10px; /* Adjusted margin for vertical stacking */
            cursor: pointer;
            font-size: 16px;
            border-radius: 4px;
        }
        .button-container button:hover {
            background-color: #364fc7;
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
    </style>
</head>
<body>
    <header>
        <h1>Appointment Request System</h1>
        <nav>
            <a href="student.jsp" class="active">Home</a>
            <a href="lecturerList.jsp">Lecturer List</a>
            <a href="login.jsp">Log Out</a>
        </nav>
    </header>

    <div class="container">
        <h1>Welcome, <%= session.getAttribute("username") %></h1>
        <div class="button-container">
            <button onclick="window.location.href = 'CreateAppointment.jsp'">Create Appointment</button>
            <button onclick="window.location.href = 'ManageMaterial.jsp'">Manage Material</button>
        </div>
        <h3>Your Appointments</h3>
        <table>
            <thead>
                <tr>
                    <th>Lecturer Name</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Description</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody id="appointmentTableBody">
                <%
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment_system", "root", "admin");

                        String sql = "SELECT appointments.date, appointments.time, appointments.description, appointments.status, lecturers.name AS lecturer_name "
                                + "FROM appointments "
                                + "JOIN lecturers ON appointments.lecturer_id = lecturers.id "
                                + "JOIN students ON appointments.student_id = students.id "
                                + "WHERE students.username = ?";

                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, (String) session.getAttribute("username")); // Assuming 'username' stores the student's username
                        rs = pstmt.executeQuery();

                        while (rs.next()) {
                            String date = rs.getString("date");
                            String time = rs.getString("time");
                            String description = rs.getString("description");
                            String status = rs.getString("status");
                            String lecturerName = rs.getString("lecturer_name");
                %>
                <tr>
                    <td><%= lecturerName %></td>
                    <td><%= date %></td>
                    <td><%= time %></td>
                    <td><%= description %></td>
                    <td><%= status %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) {
                                rs.close();
                            }
                            if (pstmt != null) {
                                pstmt.close();
                            }
                            if (conn != null) {
                                conn.close();
                            }
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
