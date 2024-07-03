<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Appointment</title>
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
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
            margin-bottom: 5px;
            color: #333;
        }
        select, input, textarea, button {
            padding: 10px;
            margin-bottom: 15px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            background-color: #4c6ef5;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
        }
        button:hover {
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
        <h1>Create New Appointment, <%= session.getAttribute("username") %></h1>
        <form action="CreateAppointment.jsp" method="post">
            <label for="lecturer">Select Lecturer:</label>
            <select id="lecturer" name="lecturer" required onchange="this.form.submit()">
                <option value="">Select a lecturer</option>
                <% 
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment_system", "root", "admin");
                        String sql = "SELECT id, name FROM lecturers";
                        pstmt = conn.prepareStatement(sql);
                        rs = pstmt.executeQuery();
                        while(rs.next()) {
                            int lecturerId = rs.getInt("id");
                            String lecturerName = rs.getString("name");
                %>
                            <option value="<%= lecturerId %>" <%= (request.getParameter("lecturer") != null && request.getParameter("lecturer").equals(String.valueOf(lecturerId))) ? "selected" : "" %>>
                                <%= lecturerName %>
                            </option>
                <% 
                        }
                    } catch(Exception e) {
                        e.printStackTrace();
                    } finally {
                        if(rs != null) try { rs.close(); } catch(SQLException se) { se.printStackTrace(); }
                        if(pstmt != null) try { pstmt.close(); } catch(SQLException se) { se.printStackTrace(); }
                        if(conn != null) try { conn.close(); } catch(SQLException se) { se.printStackTrace(); }
                    }
                %>
            </select>
        </form>

        <% 
            if (request.getParameter("lecturer") != null && !request.getParameter("lecturer").isEmpty()) {
                int selectedLecturerId = Integer.parseInt(request.getParameter("lecturer"));
                int studentId = (int) session.getAttribute("id");
        %>
                <form action="CreateAppoinmentServlet" method="post">
                    <input type="hidden" name="lecturer" value="<%= selectedLecturerId %>">
                    <input type="hidden" name="studentId" value="<%= studentId %>">
                    <input type="hidden" name="status" value="Pending">

                    <table>
                        <thead>
                            <tr>
                                <th>Available Date</th>
                                <th>Available Time</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment_system", "root", "admin");
                                    String sql = "SELECT available_date, available_time FROM available_times WHERE lecturer_id = ?";
                                    pstmt = conn.prepareStatement(sql);
                                    pstmt.setInt(1, selectedLecturerId);
                                    rs = pstmt.executeQuery();
                                    while(rs.next()) {
                                        String availableDate = rs.getString("available_date");
                                        String availableTime = rs.getString("available_time");
                            %>
                                        <tr>
                                            <td><%= availableDate %></td>
                                            <td><%= availableTime %></td>
                                        </tr>
                            <% 
                                    }
                                } catch(Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if(rs != null) try { rs.close(); } catch(SQLException se) { se.printStackTrace(); }
                                    if(pstmt != null) try { pstmt.close(); } catch(SQLException se) { se.printStackTrace(); }
                                    if(conn != null) try { conn.close(); } catch(SQLException se) { se.printStackTrace(); }
                                }
                            %>
                        </tbody>
                    </table>

                    <label for="date">Select Date:</label>
                    <input type="date" id="date" name="date" required>

                    <label for="time">Select Time:</label>
                    <select id="time" name="time" required>
                        <option value="">Select a time</option>
                        <% 
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment_system", "root", "admin");
                                String sql = "SELECT DISTINCT available_time FROM available_times WHERE lecturer_id = ?";
                                pstmt = conn.prepareStatement(sql);
                                pstmt.setInt(1, selectedLecturerId);
                                rs = pstmt.executeQuery();
                                while(rs.next()) {
                                    String availableTime = rs.getString("available_time");
                        %>
                                    <option value="<%= availableTime %>"><%= availableTime %></option>
                        <% 
                                }
                            } catch(Exception e) {
                                e.printStackTrace();
                            } finally {
                                if(rs != null) try { rs.close(); } catch(SQLException se) { se.printStackTrace(); }
                                if(pstmt != null) try { pstmt.close(); } catch(SQLException se) { se.printStackTrace(); }
                                if(conn != null) try { conn.close(); } catch(SQLException se) { se.printStackTrace(); }
                            }
                        %>
                    </select>

                    <label for="description">Description of Appointment:</label>
                    <textarea id="description" name="description" rows="4" required></textarea>

                    <button type="submit">Submit</button>
                </form>
        <% 
            } else { 
        %>
                <p>Please select a lecturer to view available dates and times.</p>
        <% 
            } 
        %>
    </div>
</body>
</html>
