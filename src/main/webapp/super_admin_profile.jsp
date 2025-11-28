<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    // Backup security check. The primary check is in SecurityFilter.java
    String userType = (String) session.getAttribute("userType");
    if (!"Admin".equals(userType) && !"Super Admin".equals(userType)) {
        response.sendRedirect(request.getContextPath() + "/login.jsp?error=Access Denied");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Super Admin Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7f6;
        }
        .main-content {
            /* This margin can be adjusted if you have a sidebar */
            margin-left: 0; 
            padding: 30px;
        }
        .profile-header {
            padding: 2rem;
            background-color: #fff;
            border-radius: 15px;
            margin-bottom: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }
        .profile-header img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #fff;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            background-color: #e9ecef;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
        }
        .card-header {
            font-weight: 600;
            background-color: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
            color: #0d6efd; /* A professional blue */
        }
    </style>
</head>
<body>

<c:import url="super_admin_navbar.jsp" />

<div class="main-content">
    <c:if test="${not empty param.success}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle me-2"></i>${param.success}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Profile Header -->
    <div class="profile-header d-flex align-items-center">
        <div class="me-4">
            <img src="<c:url value='${not empty adminProfile.profilePicturePath ? adminProfile.profilePicturePath : "/uploads/profile_pictures/default_avatar.png"}'/>" alt="Profile Picture" style="width: 150px; height: 150px; border-radius: 50%; object-fit: cover;">
        </div>
        <div>
            <h2 class="mb-0">${adminProfile.givenName} ${adminProfile.surname}</h2>
            <p class="text-muted mb-1">User ID: ${user.userId}</p>
            <span class="badge bg-primary">${sessionScope.userType}</span>
        </div>
        <div class="ms-auto">
            <a href="<c:url value='/edit-super-admin-profile'/>" class="btn btn-outline-primary"><i class="fas fa-edit me-2"></i>Edit Profile</a>
        </div>
    </div>

    <!-- Profile Details -->
    <div class="row">
        <div class="col-xl-8">
            <div class="card mb-4">
                <div class="card-header">Personal Details</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4 mb-3"><label class="form-label text-muted small">Given Name</label><p class="fw-bold">${adminProfile.givenName}</p></div>
                        <div class="col-md-4 mb-3"><label class="form-label text-muted small">Middle Name</label><p class="fw-bold">${adminProfile.middleName}</p></div>
                        <div class="col-md-4 mb-3"><label class="form-label text-muted small">Surname</label><p class="fw-bold">${adminProfile.surname}</p></div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 mb-3"><label class="form-label text-muted small">Date of Birth</label><p class="fw-bold"><fmt:formatDate value="${adminProfile.dateOfBirth}" pattern="MMMM dd, yyyy" /></p></div>
                       <div class="col-md-6 info-item">
                        <div class="label">Age</div>
                        <div class="value">${adminProfile.age} years old</div>
                    </div>
                        <div class="col-md-4 mb-3"><label class="form-label text-muted small">Gender</label><p class="fw-bold">${adminProfile.gender}</p></div>
                    </div>
                    <div><label class="form-label text-muted small">Address</label><p class="fw-bold">${adminProfile.address}</p></div>
                </div>
            </div>
        </div>
        <div class="col-xl-4">
            <div class="card mb-4">
                <div class="card-header">Account Details</div>
                <div class="card-body">
                    <div class="mb-3"><label class="form-label text-muted small">Username</label><p class="fw-bold">${user.username}</p></div>
                    <div><label class="form-label text-muted small">Contact Number</label><p class="fw-bold">${user.contactNumber}</p></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // --- Session Timeout ---
    (function() {
        let inactivityTimer;
        const timeoutDuration = 15 * 60 * 1000; // 15 minutes, matches web.xml

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
        document.onclick = resetTimer;
        document.onscroll = resetTimer;
        document.onfocus = resetTimer;
    })();
</script>
</body>
</html>
