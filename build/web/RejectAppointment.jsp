<%-- 
    Document   : RejectAppointment
    Created on : 2 Jul 2024, 8:46:09?pm
    Author     : User
--%>

<%@ page import="java.sql.*" %>
<%
    int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appointment_system", "root", "admin");
        String query = "UPDATE appointments SET status = 'reject' WHERE id = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, appointmentId);
        pstmt.executeUpdate();
        con.close();
        response.sendRedirect("ManageAppointment.jsp");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
