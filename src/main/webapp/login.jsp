<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Invalidate any existing session to ensure a clean login state and prevent session fixation.
    if (session != null) {
        session.invalidate();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Aurora Memorial Hospital</title>
    <!-- Favicon -->
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/custom-style.css" />
    <style>
        body {
            background: linear-gradient(135deg, #e8f5e9 0%, #f1f8e9 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            padding: 20px 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 25px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 50px;
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
            animation: fadeInUp 0.8s ease-out;
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 8px;
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        }

        .logo-section {
            text-align: center;
            margin-bottom: 40px;
        }

        .logo-section img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            box-shadow: 0 10px 30px rgba(40, 167, 69, 0.3);
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }

        .logo-section img:hover {
            transform: scale(1.05);
        }

        .logo-section h2 {
            color: #28a745;
            font-weight: 700;
            margin-bottom: 10px;
            font-size: 32px;
        }

        .logo-section p {
            color: #666;
            font-size: 16px;
            margin: 0;
        }

        .form-section {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            border-left: 5px solid #28a745;
            position: relative;
            transition: box-shadow 0.3s ease;
        }

        .form-section:hover {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .form-section h3 {
            color: #28a745;
            font-weight: 600;
            margin-bottom: 25px;
            font-size: 20px;
            display: flex;
            align-items: center;
        }

        .form-section h3::before {
            content: '';
            width: 8px;
            height: 8px;
            background: #28a745;
            border-radius: 50%;
            margin-right: 12px;
        }

        .form-floating {
            margin-bottom: 25px;
        }

        .form-control, .form-select {
            border: 2px solid #e9ecef;
            border-radius: 12px;
            padding: 14px 18px;
            font-size: 15px;
            transition: all 0.3s ease;
            background: white;
        }

        .form-control:focus, .form-select:focus {
            border-color: #28a745;
            box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.25);
            background: white;
        }

        .form-control::placeholder {
            color: #adb5bd;
        }

        .btn-login {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
            border: none;
            border-radius: 15px;
            padding: 16px 25px;
            font-size: 18px;
            font-weight: 600;
            color: white;
            width: 100%;
            transition: all 0.3s ease;
            box-shadow: 0 6px 20px rgba(40, 167, 69, 0.3);
            position: relative;
            overflow: hidden;
            margin-top: 20px;
        }

        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(40, 167, 69, 0.4);
            background: linear-gradient(135deg, #218838 0%, #17a2b8 100%);
        }

        .btn-login::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.6s;
        }

        .btn-login:hover::before {
            left: 100%;
        }

        .login-link {
            text-align: center;
            margin-top: 30px;
            color: #666;
        }

        .login-link a {
            color: #28a745;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .login-link a:hover {
            color: #218838;
            text-decoration: underline;
        }

        .loading-spinner {
            display: none;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .spinner-border-sm {
            color: #28a745;
        }

        .progress-bar {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        }

        .form-check-input:checked {
            background-color: #28a745;
            border-color: #28a745;
        }

        .form-check-label {
            color: #666;
        }

        @media (max-width: 768px) {
            .login-container {
                margin: 15px;
                padding: 30px 25px;
            }

            .logo-section h2 {
                font-size: 26px;
            }

            .form-section {
                padding: 25px;
            }
        }

        /* Animation for form entrance */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Success/Error message styling */
        .alert {
            border-radius: 12px;
            border: none;
            margin-bottom: 30px;
        }

        .alert-success {
            background: linear-gradient(135deg, #d4edda 0%, #c3e6cb 100%);
            color: #155724;
        }

        .alert-danger {
            background: linear-gradient(135deg, #f8d7da 0%, #f5c6cb 100%);
            color: #721c24;
        }

        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            padding: 10px 15px;
            background-color: rgba(255, 255, 255, 0.5);
            color: #28a745;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(40, 167, 69, 0.2);
            z-index: 1000;
        }

        .back-button:hover {
            background-color: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>
    <%
        String rememberedContact = "";
        boolean rememberMeChecked = false;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("rememberedContact".equals(cookie.getName())) {
                    rememberedContact = cookie.getValue();
                    rememberMeChecked = true;
                    break;
                }
            }
        }
    %>
    <a href="${pageContext.request.contextPath}/index.jsp" class="back-button"><i class="fas fa-arrow-left me-2"></i>Back to Home</a>
    <div class="login-container">
        <div class="logo-section">
            <img src="<c:url value='/AMHLOGO.png'/>" alt="AMH Logo" class="me-3">
            <img src="<c:url value='/AURORA.png'/>" alt="Aurora Logo">
            <h2>Member Login</h2>
            <p>Please enter your credentials to proceed</p>
        </div>

        <!-- Display success or error messages -->
        <c:if test="${not empty param.success}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle me-2"></i><c:out value="${param.success}" />
            </div>
        </c:if>
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-triangle me-2"></i><c:out value="${param.error}" />
            </div>
        </c:if>

        <form id="loginForm" action="LoginServlet" method="post">
            <div class="form-section">
                <h3><i class="fas fa-sign-in-alt me-2"></i>Login Credentials</h3>
                <div class="form-floating">
                    <input type="tel" class="form-control" id="contactNumber" name="contactNumber" placeholder="Contact Number" value="<%= rememberedContact.isEmpty() ? "+63" : rememberedContact %>" required pattern="^(09|\+639)\d{9}$" title="Enter a valid Philippine number (e.g., +639... or 09...).">
                    <label for="contactNumber"><i class="fas fa-phone me-2"></i>Contact Number</label>
                </div>
                <div class="form-floating">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                    <label for="password"><i class="fas fa-lock me-2"></i>Password</label>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="rememberMe" value="on" id="rememberMe" <%= rememberMeChecked ? "checked" : "" %>>
                        <label class="form-check-label" for="rememberMe">
                            Remember Me
                        </label>
                    </div>
                    <a href="<c:url value='/forgot_password.jsp'/>" class="text-success text-decoration-none">Forgot Password?</a>
                </div>
            </div>

            <button type="submit" class="btn btn-login" id="loginBtn">
                <i class="fas fa-sign-in-alt me-2"></i>Login
            </button>

            <div class="loading-spinner" id="loadingSpinner">
                <div class="spinner-border spinner-border-sm" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
                <span class="ms-2">Logging in...</span>
            </div>
        </form>

        <div class="login-link">
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/register.jsp"><i class="fas fa-user-plus me-1"></i>Register here</a></p>
        </div>
    </div>

    <!-- Info Modal -->
    <div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="infoModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius: 15px; border-left: 5px solid #ffc107;">
                <div class="modal-header" style="border-bottom: none;">
                    <h5 class="modal-title text-dark" id="infoModalLabel"><i class="fas fa-info-circle me-2 text-warning"></i>Information</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="infoModalBody">
                    <p class="text-muted">Modal message will appear here.</p>
                </div>
                <div class="modal-footer" style="border-top: none;">
                    <button type="button" class="btn btn-success" data-bs-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Prevent back button navigation to cached pages
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }

        // Additional protection against back button
        window.addEventListener('pageshow', function(event) {
            if (event.persisted) {
                // Page was restored from cache, force reload
                window.location.reload();
            }
        });

        // Clear any remaining session data on login page
        if (typeof(Storage) !== "undefined") {
            localStorage.clear();
            sessionStorage.clear();
        }

        // Form validation before submit
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const contactNumberInput = document.getElementById('contactNumber');
            let contactNumber = contactNumberInput.value.trim();
            const password = document.getElementById('password').value.trim();

            if (!contactNumber || !password) {
                e.preventDefault();
                // Use the custom modal instead of a generic alert
                const infoModal = new bootstrap.Modal(document.getElementById('infoModal'));
                document.getElementById('infoModalBody').textContent = 'Please fill in all required fields.';
                infoModal.show();
                return;
            }
            
            // Normalize contact number to +63 format before submission
            if (contactNumber.startsWith('09') && contactNumber.length === 11) {
                contactNumber = '+63' + contactNumber.substring(1);
                // Update the input value so the servlet receives the normalized number
                contactNumberInput.value = contactNumber;
            }
            
            // Show loading state
            const loginBtn = document.getElementById('loginBtn');
            const loadingSpinner = document.getElementById('loadingSpinner');

            loginBtn.disabled = true;
            loginBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Logging In...';
            loadingSpinner.style.display = 'flex';
        });

        // Restrict contact number field to digits only
        document.getElementById('contactNumber').addEventListener('input', function (e) {
            // Allow '+' for the country code prefix
            this.value = this.value.replace(/[^\d+]/g, '');
        });
        
        // Handle contact number input field logic
        const contactInput = document.getElementById('contactNumber');
        contactInput.addEventListener('focus', function() {
            if (this.value === '') {
                this.value = '+63';
            }
        });
        contactInput.addEventListener('blur', function() {
            if (this.value === '+63') {
                this.value = '';
            }
        });
    </script>
</body>
</html>
