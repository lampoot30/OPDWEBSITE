<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Security check: only allow Super Admin users to access this page.
    if (!"Super Admin".equals(session.getAttribute("userType"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp?error=Access Denied.");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add New Admin - Super Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7f6;
        }
        .main-content {
            margin-left: 250px;
            padding: 30px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
        }
        .card-header {
            font-weight: 600;
            background-color: var(--primary-admin-blue, #0d6efd);
            color: white;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .form-section-title {
            font-weight: 600;
            color: #0d6efd;
            border-bottom: 2px solid #0d6efd;
            padding-bottom: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<c:import url="super_admin_navbar.jsp" />

<div class="main-content">
    <div class="container-fluid">
        <h1 class="h2 mb-4">Create New Admin Account</h1>

        <!-- Display success or error messages -->
        <c:if test="${not empty param.success}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fas fa-check-circle me-2"></i><c:out value="${param.success}"/>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i><c:out value="${param.error}"/>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <div class="card">
            <div class="card-header">
                <h5 class="mb-0"><i class="fas fa-user-plus me-2"></i>New Admin Details</h5>
            </div>
            <div class="card-body p-4">
                <form id="addAdminForm" action="AddAdminServlet" method="post" enctype="multipart/form-data">
                    <h5 class="form-section-title">Personal Information</h5>
                    <div class="row">
                        <div class="col-md-4 mb-3"><label for="surname" class="form-label fw-bold">Surname</label><input type="text" class="form-control" id="surname" name="surname" required></div>
                        <div class="col-md-4 mb-3"><label for="givenName" class="form-label fw-bold">Given Name</label><input type="text" class="form-control" id="givenName" name="givenName" required></div>
                        <div class="col-md-4 mb-3"><label for="middleName" class="form-label fw-bold">Middle Name</label><input type="text" class="form-control" id="middleName" name="middleName"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3"><label for="dateOfBirth" class="form-label fw-bold">Date of Birth</label><input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required></div>
                        <div class="col-md-6 mb-3">
                            <label for="gender" class="form-label fw-bold">Gender</label>
                            <select class="form-select" id="gender" name="gender" required>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3"><label for="address" class="form-label fw-bold">Address</label><textarea class="form-control" id="address" name="address" rows="2" required></textarea></div>

                    <hr class="my-4">
                    <h5 class="form-section-title">Account & Contact</h5>
                     <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="contactNumber" class="form-label fw-bold">Contact Number</label>
                            <input type="tel" class="form-control" id="contactNumber" name="contactNumber" value="+63" required pattern="^(09|\+639)\d{9}$" title="Enter a valid Philippine number (e.g., +639... or 09...).">
                        </div>
                         <div class="col-md-6 mb-3">
                            <label for="username" class="form-label fw-bold">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required readonly>
                            <div class="form-text">Username is auto-generated from the name fields.</div>
                        </div>
                    </div>
                    
                    <hr class="my-4">
                    <h5 class="form-section-title">Profile Picture</h5>
                    <div class="d-flex align-items-center">
                        <img id="imagePreview" src="<c:url value='/uploads/profile_pictures/default_avatar.png'/>" alt="Profile Preview" class="img-thumbnail rounded-circle me-4" style="width: 100px; height: 100px; object-fit: cover;">
                        <div class="flex-grow-1">
                            <label for="profilePicture" class="form-label">Upload Picture (Optional)</label>
                            <input class="form-control" type="file" id="profilePicture" name="profile_picture" accept="image/*">
                        </div>
                    </div>

                    <div class="text-end mt-4">
                        <button type="submit" class="btn btn-primary fw-bold">
                            <i class="fas fa-plus-circle me-2"></i>Add Admin User
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
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

        // Auto-generate username from name fields
        function generateUsername() {
            const surname = document.getElementById('surname').value.trim();
            const givenName = document.getElementById('givenName').value.trim();
            const middleName = document.getElementById('middleName').value.trim();

            if (surname && givenName) {
                let username = surname.toLowerCase() + '.' + givenName.toLowerCase();
                if (middleName) {
                    username += '.' + middleName.charAt(0).toLowerCase();
                }
                document.getElementById('username').value = username;
            }
        }

        // Add event listeners to name fields
        document.getElementById('surname').addEventListener('input', generateUsername);
        document.getElementById('givenName').addEventListener('input', generateUsername);
        document.getElementById('middleName').addEventListener('input', generateUsername);

        // Form submission logic
        document.getElementById('addAdminForm').addEventListener('submit', function(e) {
            const usernameInput = document.getElementById('username');

            // Ensure username is generated before submission
            if (!usernameInput.value) {
                generateUsername();
            }

            // If the username is still empty, prevent submission
            if (!usernameInput.value) {
                e.preventDefault();
                alert('Please fill in Surname and Given Name to generate a username.');
                return;
            }

            // IMPORTANT: Re-enable username field to allow its value to be submitted
            usernameInput.readOnly = false;
        });

        // Image preview script
        document.getElementById('profilePicture').addEventListener('change', function(event) {
            const [file] = event.target.files;
            if (file) {
                const imagePreview = document.getElementById('imagePreview');
                imagePreview.src = URL.createObjectURL(file);
                imagePreview.onload = function() {
                    URL.revokeObjectURL(imagePreview.src); // free memory
                }
            }
        });
    });
</script>

</body>
</html>