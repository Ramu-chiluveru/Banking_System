<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Generate a 6-digit OTP
    int otp = (int)(Math.random() * 9000) + 1000;
    session.setAttribute("generatedOtp", otp);

    // Simulate sending OTP (e.g., via email/SMS)
    // For demonstration, we're simply displaying it
%>
<!DOCTYPE html>
<html>
<head>
    <title>Generate OTP</title>
</head>
<body>
    <h2>OTP Generated</h2>
    <p>Your OTP is: <%= otp %></p>
    <p><a href="payAmount.jsp">Proceed to Pay Amount</a></p>
</body>
</html>
