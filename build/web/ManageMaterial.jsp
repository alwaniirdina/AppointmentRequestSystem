<%@ page import="com.ManageMaterialBean" %>
<%@ page import="java.sql.*, java.io.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Manage Material</title>
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
        form {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        input[type="file"] {
            flex: 1;
        }
        input[type="submit"] {
            background-color: #4c6ef5;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
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
<%
    if (session == null || session.getAttribute("role") == null || session.getAttribute("id") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String userRole = (String) session.getAttribute("role");
    Integer userIdInteger = (Integer) session.getAttribute("id");
    String userId = userIdInteger.toString();

    ManageMaterialBean materialBean = new ManageMaterialBean();
    materialBean.setUserRole(userRole);
    materialBean.setUserId(userId);

    ResultSet rs = null;
    try {
        rs = materialBean.getAppointments();
%>
    <header>
        <h1>Appointment Request System</h1>
        <nav>
            <a href="Lecturer.jsp" class="active">Home</a>
           
            
            <a href="login.jsp">Log Out</a>
        </nav>
    </header>
    <div class="container">
        <a href="Lecturer.jsp" class="button-back">Back</a>
        <h1>Manage Material</h1><br>
        <table>
            <thead>
                <tr>
                    <th>Appointment ID</th>
                    <th><%= "student".equalsIgnoreCase(userRole) ? "Lecturer Name" : "Student Name" %></th>
                    <th>Date</th>
                    <th>File</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
<%
        while (rs.next()) {
            int appointmentId = rs.getInt("appointmentId");
            String name = rs.getString(1);
            String date = rs.getString(2);
            Blob fileBlob = rs.getBlob(3);
            String fileExists = (fileBlob != null) ? "Yes" : "No";
%>
                <tr>
                    <td><%= appointmentId %></td>
                    <td><%= name %></td>
                    <td><%= date %></td>
                    <td><%= fileExists %></td>
                    <td>
                        <form action="ManageMaterialServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="appointmentId" value="<%= appointmentId %>"/>
                            <input type="file" name="file"/>
                            <input type="submit" name="action" value="Add File"/>
                            <input type="submit" name="action" value="Delete File"/>
                        </form>
                    </td>
                </tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
    }
%>
            </tbody>
        </table>
    </div>
</body>
</html>
