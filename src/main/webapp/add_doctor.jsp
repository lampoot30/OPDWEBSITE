<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Security check - although SecurityFilter should handle this.
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
    <title>Add New Doctor - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        .card-header {
            background-color: #0d6efd;
            color: white;
            font-weight: 600;
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
    <c:import url="admin_navbar.jsp" />

    <div class="main-content">
        <div class="container-fluid">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="h2"><i class="fas fa-user-plus me-2"></i>Add New Doctor</h1>
                <a href="<c:url value='/analytics-overview'/>" class="btn btn-secondary">Back to Dashboard</a>
            </div>
    
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger" role="alert">
                <c:out value="${param.error}"/>
            </div>
        </c:if>
        <c:if test="${not empty param.success}">
            <div class="alert alert-success" role="alert">
                <c:out value="${param.success}"/>
            </div>
        </c:if>
    
        <div class="card">
            <div class="card-body p-4">
                <form id="addDoctorForm" action="AddDoctorServlet" method="post" enctype="multipart/form-data">

                    <h5 class="form-section-title">Personal Information</h5>
                    <div class="row">
                        <div class="col-md-4 mb-3"><label for="surname" class="form-label">Surname</label><input type="text" class="form-control" id="surname" name="surname" required></div>
                        <div class="col-md-4 mb-3"><label for="givenName" class="form-label">Given Name</label><input type="text" class="form-control" id="givenName" name="givenName" required></div>
                        <div class="col-md-4 mb-3"><label for="middleName" class="form-label">Middle Name</label><input type="text" class="form-control" id="middleName" name="middleName"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 mb-3"><label for="dateOfBirth" class="form-label">Date of Birth</label><input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required></div>
                        <div class="col-md-2 mb-3"><label for="age" class="form-label">Age</label><input type="text" class="form-control" id="age" name="age" readonly></div>
                        <div class="col-md-6 mb-3">
                            <label for="gender" class="form-label">Gender</label>
                            <select class="form-select" id="gender" name="gender" required>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="permanent_address" class="form-label">Permanent Address</label>
                        <textarea class="form-control" id="permanent_address" name="permanent_address" rows="2" required></textarea>
                    </div>

                    <hr class="my-4">
                    <h5 class="form-section-title">Professional & Account Details</h5>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="specialization" class="form-label">Primary Specialization</label>
                            <select class="form-select" id="specialization" name="specialization" required>
                                <option value="" disabled selected>Select a specialization...</option>
                                <c:forEach var="s" items="${specializations}">
                                    <option value="${s.specializationName}"><c:out value="${s.specializationName}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="specialization2" class="form-label">Secondary Specialization (Optional)</label>
                            <select class="form-select" id="specialization2" name="specialization2">
                                <option value="" selected>No secondary specialization</option>
                                <c:forEach var="s" items="${specializations}">
                                    <option value="${s.specializationName}"><c:out value="${s.specializationName}"/></option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="licenseNumber" class="form-label">License Number</label>
                            <input type="text" class="form-control" id="licenseNumber" name="licenseNumber" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="licenseExpiryDate" class="form-label">License Expiry Date</label>
                            <input type="date" class="form-control" id="licenseExpiryDate" name="licenseExpiryDate" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label for="contactNumber" class="form-label">Contact Number</label>
                            <input type="tel" class="form-control" id="contactNumber" name="contactNumber" value="+63" required pattern="^(09|\+639)\d{9}$" title="Enter a valid Philippine number (e.g., +639... or 09...).">
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required readonly>
                            <div class="form-text">Username is auto-generated from the name fields.</div>
                        </div>
                    </div>

                    <hr class="my-4">
                    <h5 class="form-section-title">Profile Picture</h5>
                    <div class="mb-3">
                        <label for="profilePicture" class="form-label">Upload Picture (Optional)</label>
                        <input class="form-control" type="file" id="profilePicture" name="profile_picture" accept="image/*">
                    </div>

                    <div class="d-grid gap-2 mt-4">
                        <button type="submit" class="btn btn-primary btn-lg">Add Doctor</button>
                    </div>
                </form>
            </div>
        </div>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
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

    document.addEventListener('DOMContentLoaded', function() {
        // Auto-generate username from name fields
        function generateUsername() {
            const surname = document.getElementById('surname').value.trim().toLowerCase();
            const givenName = document.getElementById('givenName').value.trim().toLowerCase();
            if (surname && givenName) {
                document.getElementById('username').value = surname + '.' + givenName;
            }
        }
        document.getElementById('surname').addEventListener('input', generateUsername);
        document.getElementById('givenName').addEventListener('input', generateUsername);

        // Calculate and display age from date of birth
        function calculateAge() {
            const dobInput = document.getElementById('dateOfBirth');
            const ageInput = document.getElementById('age');
            const dob = new Date(dobInput.value);
            if (!dobInput.value) {
                ageInput.value = '';
                return;
            }
            const today = new Date();
            let age = today.getFullYear() - dob.getFullYear();
            const monthDifference = today.getMonth() - dob.getMonth();
            if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < dob.getDate())) {
                age--;
            }
            ageInput.value = age;
        }
        document.getElementById('dateOfBirth').addEventListener('input', calculateAge);

        // Form validation
        const form = document.getElementById('addDoctorForm');
        form.addEventListener('submit', function(e) {
            // Normalize contact number before submission
            const contactNumberInput = document.getElementById('contactNumber');
            let contactNumber = contactNumberInput.value.trim();
            if (contactNumber.startsWith('09') && contactNumber.length === 11) {
                contactNumberInput.value = '+63' + contactNumber.substring(1);
            }

            // Age validation (Doctor must be 25 years or older)
            const dobInput = document.getElementById('dateOfBirth');
            const dob = new Date(dobInput.value);
            if (!dobInput.value) return; 

            const today = new Date();
            let age = today.getFullYear() - dob.getFullYear();
            const monthDifference = today.getMonth() - dob.getMonth();
            if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < dob.getDate())) {
                age--;
            }

            if (age < 25) {
                e.preventDefault();
                alert('Doctor must be 25 years of age or older to register.');
                dobInput.focus();
                return;
            }
            
            // Re-enable username field before submission
            document.getElementById('username').readOnly = false;
        });
    });
</script>
</body>
</html>