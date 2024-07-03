<%-- 
    Document   : SetAvailableTime
    Created on : 3 Jun 2024, 5:34:51 pm
    Author     : User
--%>

<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Set Available Time</title>
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
        form {
            display: flex;
            flex-direction: column;
            margin-top: 20px; /* Adjusted margin for form alignment */
        }
        label {
            margin-top: 10px;
            margin-bottom: 5px;
            color: #333;
        }
        input, button {
            padding: 10px;
            margin-bottom: 15px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
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
                <a href="Lecturer.jsp" >Home</a>
                
                <a href="login.jsp">Log Out</a>
            </nav>
        </header>
        <div class="container">
            <a href="Lecturer.jsp"class="button-back">Back</a>
            <h1>Set Available Time</h1><br>
            <form id="availableTimeForm" action="SetAvailableTimeServlet" method="post">
                <label for="date">Select Date:</label>
                <input type="date" id="date" name="date" required>

                <label for="time">Select Time:</label>
                <input type="time" id="time" name="time" required>

                <button type="submit">Set Time</button>
            </form>
        </div>
    </body>
</html>
