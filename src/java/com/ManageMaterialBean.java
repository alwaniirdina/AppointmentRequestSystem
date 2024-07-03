/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com;

import java.io.InputStream;
import java.sql.*;

public class ManageMaterialBean {
    private int appointmentId;
    private String userId;
    private String userRole;

    // Getters and Setters
    public int getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(int appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserRole() {
        return userRole;
    }

    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }

    // Database connection details
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/appointment_system";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "admin";

    public ResultSet getAppointments() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
        PreparedStatement pstmt;

        String query;
        if ("student".equalsIgnoreCase(userRole)) {
            query = "SELECT l.name AS lectName, a.date, a.file, a.id AS appointmentId FROM appointments a " +
                    "JOIN lecturers l ON a.lecturer_id = l.id " +
                    "WHERE a.student_id = ? AND a.status = 'approved'";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);
        } else if ("lecturer".equalsIgnoreCase(userRole)) {
            query = "SELECT s.name AS studentName, a.date, a.file, a.id AS appointmentId FROM appointments a " +
                    "JOIN students s ON a.student_id = s.id " +
                    "WHERE a.lecturer_id = ? AND a.status = 'approved'";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, userId);
        } else {
            throw new SQLException("Invalid role");
        }

        return pstmt.executeQuery();
    }

    public boolean addFile(InputStream fileInputStream) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
             PreparedStatement pstmt = conn.prepareStatement("UPDATE appointments SET file = ? WHERE id = ?")) {
            pstmt.setBlob(1, fileInputStream);
            pstmt.setInt(2, appointmentId);
            return pstmt.executeUpdate() > 0;
        }
    }

    public boolean deleteFile() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
             PreparedStatement pstmt = conn.prepareStatement("UPDATE appointments SET file = NULL WHERE id = ?")) {
            pstmt.setInt(1, appointmentId);
            return pstmt.executeUpdate() > 0;
        }
    }
}