<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Edit My Profile - Staff Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f4f7f6; }
        .card { border: none; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.08); }
        .card-header { font-weight: 600; color: white; border-top-left-radius: 15px; border-top-right-radius: 15px; background-color: #17a2b8; }
        .form-label { font-weight: 500; }
    </style>
</head>
<body>

<c:import url="staff_navbar.jsp" />

<div class="main-content">
    <div class="container-fluid">
        <h1 class="h2 mb-4">Edit My Profile</h1>

        <c:if test="${not empty param.error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i>${param.error}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <div class="card">
            <div class="card-header">
                <h5 class="mb-0"><i class="fas fa-user-edit me-2"></i>Update Your Information</h5>
            </div>
            <div class="card-body p-4">
                <form action="update-staff-profile" method="post" enctype="multipart/form-data">
                    <div class="row mb-4">
                        <div class="col-md-3 text-center">
                            <img id="imagePreview" src="<c:url value='${not empty staffProfile.profilePicturePath ? staffProfile.profilePicturePath : "uploads/profile_pictures/default_avatar.png"}'/>" alt="Profile Preview" class="img-thumbnail rounded-circle" style="width: 150px; height: 150px; object-fit: cover;">
                            <label for="profilePicture" class="btn btn-sm btn-outline-info mt-3">
                                <i class="fas fa-upload me-1"></i> Change Picture
                            </label>
                            <input type="file" class="form-control d-none" id="profilePicture" name="profile_picture" accept="image/*">
                        </div>
                        <div class="col-md-9">
                            <h5 class="mb-3">Personal Information</h5>
                            <div class="row">
                                <div class="col-md-4 mb-3"><label for="surname" class="form-label">Surname</label><input type="text" class="form-control" id="surname" name="surname" value="<c:out value='${staffProfile.surname}'/>" required></div>
                                <div class="col-md-4 mb-3"><label for="givenName" class="form-label">Given Name</label><input type="text" class="form-control" id="givenName" name="givenName" value="<c:out value='${staffProfile.givenName}'/>" required></div>
                                <div class="col-md-4 mb-3"><label for="middleName" class="form-label">Middle Name</label><input type="text" class="form-control" id="middleName" name="middleName" value="<c:out value='${staffProfile.middleName}'/>"></div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 mb-3"><label for="dateOfBirth" class="form-label">Date of Birth</label><input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" value="${staffProfile.dateOfBirth}" required></div>
                                <div class="col-md-4 mb-3"><label for="age" class="form-label">Age</label><input type="text" class="form-control" id="age" name="age" value="${staffProfile.age} years old" readonly></div>
                                <div class="col-md-4 mb-3">
                                    <label for="gender" class="form-label">Gender</label>
                                    <select class="form-select" id="gender" name="gender" required>
                                        <option value="Male" ${staffProfile.gender == 'Male' ? 'selected' : ''}>Male</option>
                                        <option value="Female" ${staffProfile.gender == 'Female' ? 'selected' : ''}>Female</option>
                                        <option value="Other" ${staffProfile.gender == 'Other' ? 'selected' : ''}>Other</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3"><label for="address" class="form-label">Address</label><textarea class="form-control" id="address" name="address" rows="2" required><c:out value='${staffProfile.address}'/></textarea></div>
                        </div>
                    </div>

                    <hr class="my-4">
                    <h5 class="mb-3">Account Information</h5>
                    <div class="row">
                        <div class="col-md-6 mb-3"><label for="username" class="form-label">Username</label><input type="text" class="form-control" id="username" name="username" value="<c:out value='${staffProfile.user.username}'/>" readonly></div>
                        <div class="col-md-6 mb-3"><label for="contactNumber" class="form-label">Contact Number</label><input type="tel" class="form-control" id="contactNumber" name="contactNumber" value="<c:out value='${staffProfile.user.contactNumber}'/>" required></div>
                    </div>

                    <div class="text-end mt-4">
                        <a href="<c:url value='/staff-profile'/>" class="btn btn-secondary me-2">Cancel</a>
                        <button type="submit" class="btn btn-info text-white"><i class="fas fa-save me-2"></i>Save Changes</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Change Password Card -->
        <div class="card mt-4">
            <div class="card-header">
                <h5 class="mb-0"><i class="fas fa-key me-2"></i>Change Password</h5>
            </div>
            <div class="card-body">
                <form action="change-password" method="post">
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="currentPassword" class="form-label">Current Password</label>
                            <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="newPassword" class="form-label">New Password</label>
                            <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">Confirm New Password</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    </div>
                    <button type="submit" class="btn btn-info text-white"><i class="fas fa-key me-2"></i>Change Password</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('profilePicture').addEventListener('change', function(event) {
        const [file] = event.target.files;
        if (file) {
            document.getElementById('imagePreview').src = URL.createObjectURL(file);
        }
    });

    // Function to calculate age
    function calculateAge() {
        const dobInput = document.getElementById('dateOfBirth');
        const ageInput = document.getElementById('age');
        const dobValue = dobInput.value;

        if (dobValue) {
            const dob = new Date(dobValue);
            const today = new Date();
            let age = today.getFullYear() - dob.getFullYear();
            const monthDiff = today.getMonth() - dob.getMonth();

            if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < dob.getDate())) {
                age--;
            }

            ageInput.value = age + ' years old';
        }
    }

    // Calculate age on page load
    document.addEventListener('DOMContentLoaded', function() {
        calculateAge();
    });

    // Auto-calculate age when date of birth changes
    document.getElementById('dateOfBirth').addEventListener('change', calculateAge);

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