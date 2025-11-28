<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Privacy and Safety - AMH Hospital OPD</title>
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
            <h1 class="display-5 fw-bold text-center mb-5">Privacy and Safety Policy</h1>

            <h2>1. Our Commitment to Your Privacy</h2>
            <p>Aurora Memorial Hospital (AMH) is committed to protecting the privacy and security of your personal and health information. This Privacy and Safety Policy explains how we collect, use, and safeguard your data when you use our Out-Patient Department (OPD) Management System.</p>

            <h2>2. Information We Collect</h2>
            <p>We collect information that you provide directly to us when you register for an account, book an appointment, or update your profile. This includes, but is not limited to: your name, address, contact number, date of birth, and medical history. We also collect information automatically as you navigate the site, such as your IP address and browsing activity, to improve our service.</p>

            <h2>3. How We Use Your Information</h2>
            <p>Your information is used to: provide and manage your healthcare services, including scheduling and managing appointments; communicate with you about your appointments and our services; maintain your medical records; and comply with legal and regulatory requirements. We will not share your information with third parties without your explicit consent, except as required by law.</p>

            <h2>4. Data Security and Safety</h2>
            <p>We implement a variety of security measures to maintain the safety of your personal information. Our system uses encryption to protect data transmitted to and from the site. Access to your personal and health information is restricted to authorized healthcare professionals and staff who need the information to provide services to you. You are responsible for keeping your account password confidential.</p>

            <h2>5. Your Rights</h2>
            <p>You have the right to access, update, or correct your personal information at any time through your user profile. You also have the right to request a copy of your medical records in accordance with hospital policy and applicable laws. If you wish to close your account, please contact our support staff.</p>

            <h2>6. Contact Us</h2>
            <p>If you have any questions about this Privacy and Safety Policy, please contact us at Auroramemhos@gmail.com or call us at 09695702024.</p>

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
                        <a href="<c:url value='/terms_and_conditions.jsp'/>" class="text-decoration-none me-3">Terms and Conditions</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>