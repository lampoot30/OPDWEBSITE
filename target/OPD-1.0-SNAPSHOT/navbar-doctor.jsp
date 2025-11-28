@@ -0,0 +1,60 @@
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    :root {
        --primary-doctor-color: #007bff;
    }
    .sidebar {
        width: 250px;
        height: 100vh;
        background-color: #fff;
        box-shadow: 2px 0 15px rgba(0, 0, 0, 0.05);
        position: fixed;
        left: 0;
        top: 0;
        z-index: 1000;
        padding: 20px 0;
        overflow-y: auto;
    }
    .sidebar .logo-section {
        text-align: center;
        padding: 20px;
        border-bottom: 1px solid #e0e0e0;
        margin-bottom: 20px;
    }
    .sidebar .logo-section img { width: 60px; height: 60px; border-radius: 50%; margin-bottom: 10px; }
    .sidebar .nav-link { color: #333; padding: 12px 25px; margin: 5px 15px; border-radius: 8px; transition: all 0.3s ease; font-weight: 500; }
    .sidebar .nav-link:hover, .sidebar .nav-link.active { background-color: var(--primary-doctor-color); color: white; text-decoration: none; }
    .sidebar .nav-link i { margin-right: 10px; width: 20px; }
</style>

<!-- Sidebar -->
<div class="sidebar no-print">
    <div class="logo-section">
        <img src="<c:url value='/AMHLOGO.png'/>" alt="AMH Logo">
        <h5 class="mb-0 fw-bold text-primary">Doctor Portal</h5>
    </div>
    <nav class="nav flex-column">
        <a class="nav-link ${pageContext.request.servletPath.endsWith('/doctor-dashboard') ? 'active' : ''}" href="<c:url value='/doctor-dashboard'/>">
            <i class="fas fa-tachometer-alt"></i> Dashboard
        </a>
        <a class="nav-link ${pageContext.request.servletPath.endsWith('/my-patient') ? 'active' : ''}" href="<c:url value='/my-patient'/>">
            <i class="fas fa-users"></i> My Patients
        </a>
        <a class="nav-link ${pageContext.request.servletPath.endsWith('/doctor-profile') ? 'active' : ''}" href="<c:url value='/doctor-profile'/>">
            <i class="fas fa-user-md"></i> My Profile
        </a>
        <hr class="my-3">
        <a class="nav-link text-danger" href="<c:url value='/LogoutServlet'/>">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </nav>
</div>

<script>
    (function() {
        let inactivityTimer;
        const timeoutDuration = 15 * 60 * 1000; // 15 minutes

        function redirectToSessionExpired() {
            window.location.href = '<c:url value="/session_expired.jsp"/>';
        }

        function resetTimer() {
            clearTimeout(inactivityTimer);
            inactivityTimer = setTimeout(redirectToSessionExpired, timeoutDuration);
        }

        window.onload = resetTimer;
        document.onmousemove = resetTimer;
        document.onkeypress = resetTimer;
        // ... and so on for other events
    })();
</script>