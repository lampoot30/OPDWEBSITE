<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Verify Password Change - AMH Hospital</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e8f5e9, #c8e6c9);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .verify-card {
            width: 100%;
            max-width: 450px;
            padding: 2rem;
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        .otp-input {
            letter-spacing: 10px;
            font-size: 1.5rem;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="card verify-card">
    <div class="text-center mb-4">
        <img src="<c:url value='/AMHLOGO.png'/>" alt="AMH Logo" style="width: 80px;">
        <h3 class="mt-3">Confirm Password Change</h3>
        <p class="text-muted">An OTP has been sent to your registered mobile number. Please enter it to finalize your password change.</p>
    </div>

    <c:if test="${not empty param.error}">
        <div class="alert alert-danger" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i><c:out value="${param.error}"/>
        </div>
    </c:if>

    <form action="verify-password-change" method="post">
        <div class="mb-3">
            <label for="otp" class="form-label">Enter 6-Digit OTP</label>
            <input type="text" class="form-control otp-input" id="otp" name="otp" maxlength="6" required autofocus>
        </div>
        <button type="submit" class="btn btn-primary w-100">Verify & Change Password</button>
    </form>
    <div class="text-center mt-3">
        <a href="javascript:window.history.back()">Go Back</a>
    </div>
</div>

</body>
</html>