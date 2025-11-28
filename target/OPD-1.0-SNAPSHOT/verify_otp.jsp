<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Verify Contact Number</title>
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
            letter-spacing: 0.5rem; /* Adds space between characters */
            font-family: monospace; /* Gives a more code-like feel */
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="card p-4">
        <div class="text-center mb-4">
            <h3 class="fw-bold">Verify Your New Number</h3>
            <p class="text-muted">An OTP has been sent to your new contact number: <strong><c:out value="${sessionScope.newContactNumber}"/></strong>. Please enter it below.</p>
        </div>

        <c:if test="${not empty param.error}">
            <div class="alert alert-danger" role="alert"><i class="fas fa-exclamation-triangle me-2"></i><c:out value="${param.error}"/></div>
        </c:if>

        <form action="verify-otp-and-update" method="post">
            <div class="mb-3">
                <label for="otp" class="form-label">Verification Code (OTP)</label>
                <input type="text" class="form-control text-center fs-4 otp-input" id="otp" name="otp" required placeholder="------" maxlength="6" pattern="[0-9]{6}" inputmode="numeric" autofocus title="Please enter a 6-digit OTP code.">
                <div id="otpHelp" class="form-text text-center">Please enter the 6-digit code sent to your number.</div>
            </div>
            <button type="submit" id="verifyBtn" class="btn btn-primary w-100" disabled>Verify and Update Profile</button>
        </form>
        <div class="text-center mt-3">
            <c:choose>
                <c:when test="${sessionScope.userType == 'Super Admin'}">
                    <a href="<c:url value='/edit-super-admin-profile'/>" class="text-decoration-none">Go Back</a>
                </c:when>
                <c:otherwise>
                    <a href="javascript:window.history.back()" class="text-decoration-none">Go Back</a>
                </c:otherwise>
            </c:choose>
            <button type="button" id="resendOtpBtn" class="btn btn-link text-decoration-none p-0 m-0 align-baseline">Resend OTP</button>
        </div>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const otpInput = document.getElementById('otp');
        const verifyBtn = document.getElementById('verifyBtn');
        const resendBtn = document.getElementById('resendOtpBtn');

        otpInput.addEventListener('input', function(e) {
            // Allow only numeric input
            this.value = this.value.replace(/[^0-9]/g, '');

            // Enable/disable button based on input length
            if (this.value.length === 6) {
                verifyBtn.disabled = false;
            } else {
                verifyBtn.disabled = true;
            }
        });

        resendBtn.addEventListener('click', function() {
            resendBtn.disabled = true;
            
            fetch('resend-otp', { method: 'POST' })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    if (data.success) {
                        let cooldown = 60;
                        resendBtn.textContent = 'Resend in ' + cooldown + 's';
                        const timer = setInterval(function() {
                            cooldown--;
                            resendBtn.textContent = 'Resend in ' + cooldown + 's';
                            if (cooldown <= 0) {
                                clearInterval(timer);
                                resendBtn.disabled = false;
                                resendBtn.textContent = 'Resend OTP';
                            }
                        }, 1000);
                    } else {
                        alert(data.message || 'Failed to resend OTP.');
                        resendBtn.disabled = false;
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('An error occurred. Please try again.');
                    resendBtn.disabled = false;
                });
        });
    });
</script>
</body>
</html>