<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>AMH Hospital - Out-Patient Department</title>
    <!-- Google Fonts (Poppins) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/custom-style.css" />
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #fdfdfd;
        }

        /* --- Navigation Bar --- */
        .navbar-light-custom {
            background-color: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
            transition: background-color 0.3s ease;
        }
        .navbar-light-custom .navbar-brand,
        .navbar-light-custom .nav-link {
            color: #333;
            font-weight: 500;
        }
        .navbar-light-custom .nav-link:hover {
            color: var(--primary-green);
        }

        /* --- Hero Section --- */
        .hero-section {
            background: linear-gradient(135deg, #e8f5e9 0%, #f1f8e9 100%);
            padding: 6rem 0;
        }

        /* --- Feature Cards --- */
        .feature-card {
            border: 1px solid #e0e0e0;
            border-top: 4px solid var(--primary-green);
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.08);
        }

        /* --- Footer --- */
        .footer-light {
            background-color: #f8f9fa;
            border-top: 1px solid #e9ecef;
            color: #555;
        }
        .footer-light .text-success {
            color: var(--primary-green-dark) !important;
        }
        .footer-light a {
            color: #555;
            transition: color 0.2s;
        }
        .footer-light a:hover {
            color: var(--primary-green);
        }

        /* --- Scroll Animation --- */
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.6s ease-out, transform 0.6s ease-out;
        }
    </style>
</head>
<body>
    <c:import url="navbar-public.jsp" />

    <header class="hero-section text-dark text-center">
        <div class="container">
            <h1 class="display-4 fw-bold text-success fade-in">Welcome to Aurora Memorial Hospital OPD</h1>
            <p class="lead my-4 fade-in" style="transition-delay: 0.1s;">Your health is our priority. Access patient services, book appointments, and manage your medical records with ease.</p>
            <a href="<c:url value='/login.jsp'/>" class="btn btn-success btn-lg">
                <i class="fas fa-sign-in-alt me-2"></i>Access Your Portal
            </a>
        </div>
    </header>

    <main class="container my-5">
        <section id="features" class="text-center py-5">
            <h2 class="mb-4 fw-bold text-success">OUR DIGITAL SERVICES</h2>
            <div class="row g-4 justify-content-center">
                <div class="col-md-6 col-lg-4 fade-in" style="transition-delay: 0.2s;">
                    <div class="card feature-card h-100">
                        <div class="card-body">
                            <div class="feature-icon text-white bg-success rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                <i class="fas fa-users fa-2x"></i>
                            </div>
                            <h3 class="card-title h5 fw-bold">Patient Management</h3>
                            <p class="card-text text-muted">Efficiently manage your personal and medical information in one secure place.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 fade-in" style="transition-delay: 0.3s;">
                    <div class="card feature-card h-100">
                        <div class="card-body">
                            <div class="feature-icon text-white bg-success rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                <i class="fas fa-calendar-check fa-2x"></i>
                            </div>
                            <h3 class="card-title h5 fw-bold">Appointment Booking</h3>
                            <p class="card-text text-muted">Schedule, view, and manage your appointments with our specialists seamlessly.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 fade-in" style="transition-delay: 0.4s;">
                    <div class="card feature-card h-100">
                        <div class="card-body">
                            <div class="feature-icon text-white bg-success rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                <i class="fas fa-file-medical fa-2x"></i>
                            </div>
                            <h3 class="card-title h5 fw-bold">Medical Records</h3>
                            <p class="card-text text-muted">Access your complete medical history, prescriptions, and lab results anytime.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer class="footer-light pt-5 pb-4">
        <div class="container text-center text-md-start">
            <div class="row text-center text-md-start">
                <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h5 class="text-uppercase mb-4 fw-bold text-success">Aurora Memorial Hospital</h5>
                    <p>Providing quality healthcare services to the community with dedication and compassion. Our digital platform aims to make healthcare more accessible for you.</p>
                </div>

                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                    <h5 class="text-uppercase mb-4 fw-bold text-success">Quick Links</h5>
                    <p><a href="<c:url value='/about.jsp'/>" class="text-decoration-none">About Us</a></p>
                    <p><a href="<c:url value='/services'/>" class="text-decoration-none">Services</a></p>
                    <p><a href="<c:url value='/departments'/>" class="text-decoration-none">Departments</a></p>
                </div>

                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h5 class="text-uppercase mb-4 fw-bold text-success">Contact</h5>
                    <p><i class="fas fa-home me-3"></i>Purok 6 ,Reserva Baler Aurora</p>
                    <p><i class="fas fa-envelope me-3"></i>Auroramemhos@gmail.com</p>
                    <p><i class="fas fa-phone me-3"></i>09695702024</p>
                    <P>  <a href="https://www.facebook.com/profile.php?id=61553011967008" class="btn-floating btn-sm" style="font-size: 23px;"><i class="fab fa-facebook"></i> </a>Visit our facebook page</P>
                </div>
            </div>

            <hr class="mb-4">

            <div class="row align-items-center">
                <div class="col-md-7 col-lg-8">
                    <p class="text-center text-md-start">&copy; 2025 Out-Patient Department Management System. All rights reserved.</p>
                </div>
                <div class="col-md-5 col-lg-4">
                    <div class="text-center text-md-end">
                        <a href="<c:url value='/terms_and_conditions.jsp'/>" class="text-decoration-none me-3">Terms and Conditions</a>
                        <a href="<c:url value='/privacy_and_safety.jsp'/>" class="text-decoration-none">Privacy and Safety</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.style.opacity = '1';
                        entry.target.style.transform = 'translateY(0)';
                        observer.unobserve(entry.target);
                    }
                });
            }, {
                threshold: 0.1
            });

            document.querySelectorAll('.fade-in').forEach(element => {
                observer.observe(element);
            });
        });
    </script>
</body>
</html>