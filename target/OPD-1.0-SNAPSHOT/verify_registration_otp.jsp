<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Verify Your Account</title>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-color: #f4f7f6;
        }
        .card {
            width: 100%;
            max-width: 450px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        .otp-input {
            letter-spacing: 0.5rem;
            font-family: monospace;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="card p-4">
        <div class="text-center mb-4">
            <h3 class="fw-bold">Verify Your Account</h3>
            <p class="text-muted">An OTP has been sent to your contact number: <strong><c:out value="${sessionScope.registrationData['contactNumber']}"/></strong>. Please enter it below to complete your registration.</p>
        </div>

        <c:if test="${not empty param.error}">
            <div class="alert alert-danger" role="alert"><i class="fas fa-exclamation-triangle me-2"></i><c:out value="${param.error}"/></div>
        </c:if>

        <form action="VerifyRegistrationOtpServlet" method="post">
            <div class="mb-3">
                <label for="otp" class="form-label">Verification Code (OTP)</label>
                <input type="text" class="form-control text-center fs-4 otp-input" id="otp" name="otp" required placeholder="------" maxlength="6" pattern="[0-9]{6}" inputmode="numeric" autofocus title="Please enter a 6-digit OTP code.">
                <div id="otpHelp" class="form-text text-center">Please enter the 6-digit code.</div>
            </div>
            <button type="submit" id="verifyBtn" class="btn btn-primary w-100" disabled>Verify and Register</button>
        </form>
        <div class="text-center mt-3">
            <a href="<c:url value='/login.jsp'/>" class="text-decoration-none">Cancel Registration</a>
        </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const otpInput = document.getElementById('otp');
        const verifyBtn = document.getElementById('verifyBtn');

        otpInput.addEventListener('input', function(e) {
            this.value = this.value.replace(/[^0-9]/g, '');

            if (this.value.length === 6) {
                verifyBtn.disabled = false;
            } else {
                verifyBtn.disabled = true;
            }
        });
    });
</script>
</body>
</html>