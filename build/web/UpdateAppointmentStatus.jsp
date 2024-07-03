<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Appointment Status</title>
    </head>
    <body>
        <%
            int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
            String status = request.getParameter("status");
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment_system", "root", "admin");
                String query = "UPDATE appointments SET status = ? WHERE id = ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, status);
                pstmt.setInt(2, appointmentId);
                int rowsUpdated = pstmt.executeUpdate();
                if (rowsUpdated > 0) {
                    out.println("<p>Appointment status updated successfully!</p>");
                } else {
                    out.println("<p>Failed to update appointment status.</p>");
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        %>
        <button onclick="window.location.href = 'ManageAppointment.jsp'">Back to Manage Appointments</button>
    </body>
</html>
