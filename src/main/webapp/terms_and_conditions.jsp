<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Terms and Conditions - AMH Hospital OPD</title>
    <!-- Google Fonts (Poppins) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        .navbar-light-custom {
            background-color: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
        }
        .content-section {
            background-color: #fff;
            padding: 3rem;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }
        .content-section h2 {
            color: #28a745; /* Primary Green */
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid #e9ecef;
        }
        .content-section p {
            line-height: 1.8;
            color: #555;
        }
        .footer-light {
            background-color: #f8f9fa;
            border-top: 1px solid #e9ecef;
            color: #555;
        }
        .footer-light a {
            color: #555;
        }
    </style>
</head>
<body>
    <!-- Public Navigation Bar -->
    
 <c:import url="navbar-public.jsp" />

    <main class="container my-5">
        <div class="content-section">
            <h1 class="display-5 fw-bold text-center mb-5">Terms and Conditions</h1>

            <h2>1. Introduction</h2>
            <p>Welcome to the Aurora Memorial Hospital (AMH) Out-Patient Department (OPD) Management System. These terms and conditions outline the rules and regulations for the use of our digital services. By accessing this website, we assume you accept these terms and conditions. Do not continue to use the AMH OPD System if you do not agree to all of the terms and conditions stated on this page.</p>

            <h2>2. User Accounts</h2>
            <p>When you create an account with us, you must provide information that is accurate, complete, and current at all times. Failure to do so constitutes a breach of the Terms, which may result in immediate termination of your account on our Service. You are responsible for safeguarding the password that you use to access the Service and for any activities or actions under your password.</p>

            <h2>3. Appointment Booking and Cancellation</h2>
            <p>Our system allows you to book appointments with our healthcare professionals. While we strive to ensure all scheduled appointments are honored, unforeseen circumstances may require rescheduling. We will notify you of any changes. You are responsible for attending your appointments on time. If you need to cancel or reschedule, please do so through the portal at least 24 hours in advance where possible.</p>

            <h2>4. Medical Information and Privacy</h2>
            <p>The information provided through this portal is for informational purposes only and is not a substitute for professional medical advice, diagnosis, or treatment. Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition. Your personal and medical information is protected under our Privacy Policy and relevant data privacy laws.</p>

            <h2>5. Limitation of Liability</h2>
            <p>In no event shall Aurora Memorial Hospital, nor any of its officers, directors, and employees, be held liable for anything arising out of or in any way connected with your use of this website, whether such liability is under contract. Aurora Memorial Hospital, including its officers, directors, and employees shall not be held liable for any indirect, consequential, or special liability arising out of or in any way related to your use of this website.</p>

            <h2>6. Changes to Terms</h2>
            <p>We reserve the right, at our sole discretion, to modify or replace these Terms at any time. We will provide notice of any changes by posting the new Terms and Conditions on this page. Your continued use of the Service after any such changes constitutes your acceptance of the new Terms.</p>

            <p class="mt-5 text-muted">Last updated: November 28, 2025</p>
        </div>
    </main>

    <!-- Footer -->
    <footer class="footer-light pt-5 pb-4 mt-5">
        <div class="container text-center text-md-start">
            <div class="row align-items-center">
                <div class="col-md-7 col-lg-8">
                    <p class="text-center text-md-start">&copy; 2025 Out-Patient Department Management System. All rights reserved.</p>
                </div>
                <div class="col-md-5 col-lg-4">
                    <div class="text-center text-md-end">
                        <a href="<c:url value='/privacy_and_safety.jsp'/>" class="text-decoration-none">Privacy and Safety</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>