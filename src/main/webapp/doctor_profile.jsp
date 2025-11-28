<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    // Security check: Only allow Doctor users to access this page.
    if (!"Doctor".equals(session.getAttribute("userType"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp?error=Access Denied");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>My Profile - Doctor Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7f6;
        }
        .main-content {
            margin-left: 250px; /* Adjusted to match sidebar width */
            padding: 2rem;
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
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
        }
        .card-header {
            font-weight: 600;
            background-color: #f8f9fa;
            border-bottom: 1px solid #e9ecef;
            color: #007bff; /* Doctor's primary color */
        }
    </style>
</head>
<body>

<c:import url="navbar-doctor.jsp" />

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
            <img id="profileImg" src="<c:url value='${not empty doctor.profilePicturePath ? doctor.profilePicturePath : "uploads/profile_pictures/default_avatar.png"}'/>" alt="Profile Picture" style="width: 150px; height: 150px; border-radius: 50%; object-fit: cover;">
        </div>
        <div>
            <h2 class="mb-0">Dr. ${doctor.givenName} ${doctor.surname}</h2>
            <p class="text-muted mb-1">User ID: ${user.userId}</p>
            <span class="badge bg-primary">${doctor.specialization}</span>
        </div>
        <div class="ms-auto">
            <button id="editProfileBtn" class="btn btn-primary"><i class="fas fa-edit me-2"></i>Edit Profile</button>
            <div id="editModeButtons" style="display: none;">
                <button type="button" id="cancelBtn" class="btn btn-secondary me-2"><i class="fas fa-times me-2"></i>Cancel</button>
                <button type="submit" form="profileForm" class="btn btn-success"><i class="fas fa-save me-2"></i>Save Changes</button>
            </div>
        </div>
    </div>

    <!-- Profile Details -->
    <form id="profileForm" action="<c:url value='/update-doctor-profile'/>" method="post" enctype="multipart/form-data">
        <div class="row">
            <div class="col-xl-8">
                <div class="card mb-4">
                    <div class="card-header">Personal Details</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 mb-3"><label class="form-label fw-bold">Given Name</label><input type="text" class="form-control" name="givenName" value="${doctor.givenName}" readonly></div>
                            <div class="col-md-4 mb-3"><label class="form-label fw-bold">Middle Name</label><input type="text" class="form-control" name="middleName" value="${doctor.middleName}" readonly></div>
                            <div class="col-md-4 mb-3"><label class="form-label fw-bold">Surname</label><input type="text" class="form-control" name="surname" value="${doctor.surname}" readonly></div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 mb-3"><label class="form-label fw-bold">Date of Birth</label><input type="text" class="form-control" name="dateOfBirth" value="${doctor.dateOfBirth}" readonly></div>
                            <div class="col-md-4 mb-3"><label class="form-label fw-bold">Age</label><input type="text" class="form-control" name="age" value="${doctor.age}" readonly></div>
                            <div class="col-md-4 mb-3"><label class="form-label fw-bold">Gender</label><input type="text" class="form-control" name="gender" value="${doctor.gender}" readonly></div>
                        </div>
                        <div><label class="form-label fw-bold">Address</label><textarea class="form-control" name="address" rows="2" readonly>${doctor.address}</textarea></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4">
                <div class="card mb-4">
                    <div class="card-header">Account & Professional Details</div>
                    <div class="card-body">
                        <div class="mb-3"><label class="form-label fw-bold">Username</label><input type="text" class="form-control" name="username" value="${user.username}" readonly></div>
                        <div class="mb-3"><label class="form-label fw-bold">Contact Number</label><input type="text" class="form-control" name="contactNumber" value="${user.contactNumber}" readonly></div>
                        <hr>
                        <div class="mb-3"><label class="form-label fw-bold">License Number</label><input type="text" class="form-control" name="licenseNumber" value="${doctor.licenseNumber}" readonly></div>
                        <div><label class="form-label fw-bold">License Expiry Date</label><input type="text" class="form-control" name="licenseExpiryDate" value="${doctor.licenseExpiryDate}" readonly></div>
                    </div>
                </div>
                <div class="card mb-4" id="upload-section" style="display: none;">
                    <div class="card-header">Profile Picture</div>
                    <div class="card-body text-center">
                        <label for="profilePictureInput" class="form-label">Change Picture</label>
                        <input class="form-control form-control-sm" type="file" id="profilePictureInput" name="profile_picture" accept="image/*">
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Change Password Card -->
    <div id="changePasswordSection" class="card mt-4" style="display: none;">
        <div class="card-header">
            <h5 class="mb-0"><i class="fas fa-key me-2"></i>Change Password</h5>
        </div>
        <div class="card-body">
            <form action="change-password" method="post">
                <div class="mb-3">
                    <label for="oldPassword" class="form-label">Enter Old Password</label>
                    <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
                </div>
                <div class="mb-3">
                    <label for="newPassword" class="form-label">New Password</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                </div>
                <div class="mb-3">
                    <label for="confirmNewPassword" class="form-label">Re-enter New Password</label>
                    <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" required>
                </div>
                <button type="submit" class="btn btn-primary">Change Password</button>
            </form>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const editBtn = document.getElementById('editProfileBtn');
        const editModeButtons = document.getElementById('editModeButtons');
        const cancelBtn = document.getElementById('cancelBtn');
        const uploadSection = document.getElementById('upload-section');
        const passwordSection = document.getElementById('changePasswordSection');
        const form = document.getElementById('profileForm');
        const inputs = form.querySelectorAll('input, textarea');

        editBtn.addEventListener('click', function() {
            inputs.forEach(input => {
                if (input.name !== 'username') { // Do not allow editing username
                    input.readOnly = false;
                }
            });

            // Change date inputs to type="date"
            document.querySelector('input[name="dateOfBirth"]').type = 'date';
            document.querySelector('input[name="licenseExpiryDate"]').type = 'date';

            uploadSection.style.display = 'block';
            passwordSection.style.display = 'block';
            editBtn.style.display = 'none';
            editModeButtons.style.display = 'block';
        });

        cancelBtn.addEventListener('click', function() {
            window.location.reload();
        });

        // Image preview
        const profilePictureInput = document.getElementById('profilePictureInput');
        if (profilePictureInput) {
            profilePictureInput.onchange = evt => {
                const [file] = profilePictureInput.files;
                if (file) {
                    document.getElementById('profileImg').src = URL.createObjectURL(file);
                }
            }
        }
    });
</script>
</body>
</html>