<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Patient Registration - AMH Hospital</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e8f5e9, #c8e6c9);
        }
        .registration-container {
            max-width: 800px;
            margin: 50px auto;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .registration-header {
            background-color: #28a745;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .form-section-title {
            font-weight: 600;
            color: #28a745;
            border-bottom: 2px solid #28a745;
            padding-bottom: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="registration-container">
        <div class="registration-header">
            <img src="<c:url value='/AMHLOGO.png'/>" alt="Logo" height="50" class="mb-2">
            <h2>Patient Registration</h2>
        </div>
        <div class="p-4 p-md-5">
            <form action="RegisterServlet" method="post" enctype="multipart/form-data">

                <h5 class="form-section-title">Personal Information</h5>
                <div class="row">
                    <div class="col-md-4 mb-3"><label for="surname" class="form-label">Surname</label><input type="text" class="form-control" id="surname" name="surname" required></div>
                    <div class="col-md-4 mb-3"><label for="givenName" class="form-label">Given Name</label><input type="text" class="form-control" id="givenName" name="givenName" required></div>
                    <div class="col-md-4 mb-3"><label for="middleName" class="form-label">Middle Name</label><input type="text" class="form-control" id="middleName" name="middleName"></div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="dateOfBirth" class="form-label">Date of Birth</label>
                        <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="age" class="form-label">Age</label>
                        <input type="text" class="form-control" id="age" name="age" readonly placeholder="Age will be calculated">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="gender" class="form-label">Gender</label>
                        <select class="form-select" id="gender" name="gender" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="religion" class="form-label">Religion</label>
                        <input type="text" class="form-control" id="religion" name="religion" placeholder="e.g., Roman Catholic">
                    </div>
                </div>

                <hr class="my-4">
                <h5 class="form-section-title">Address Information</h5>
                <div class="mb-3">
                    <label for="permanentAddress" class="form-label">Permanent Address</label>
                    <textarea class="form-control" id="permanentAddress" name="permanentAddress" rows="2" required placeholder="e.g., House No., Street, Barangay"></textarea>
                </div>
                <div class="form-check mb-3">
                    <input class="form-check-input" type="checkbox" id="sameAsPermanent">
                    <label class="form-check-label" for="sameAsPermanent">
                        My current address is the same as my permanent address.
                    </label>
                </div>
                <div class="mb-3">
                    <label for="currentAddress" class="form-label">Current Address</label>
                    <textarea class="form-control" id="currentAddress" name="currentAddress" rows="2" required placeholder="e.g., House No., Street, Barangay"></textarea>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="city" class="form-label">City/Town (Aurora)</label>
                        <select class="form-select" id="city" name="city" required>
                            <option value="" selected disabled>Select a municipality...</option>
                            <option value="Baler" data-zip="3200">Baler</option>
                            <option value="Casiguran" data-zip="3204">Casiguran</option>
                            <option value="Dilasag" data-zip="3205">Dilasag</option>
                            <option value="Dinalungan" data-zip="3206">Dinalungan</option>
                            <option value="Dingalan" data-zip="3207">Dingalan</option>
                            <option value="Dipaculao" data-zip="3202">Dipaculao</option>
                            <option value="Maria Aurora" data-zip="3203">Maria Aurora</option>
                            <option value="San Luis" data-zip="3201">San Luis</option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3"><label for="postalCode" class="form-label">Postal/ZIP Code</label><input type="text" class="form-control" id="postalCode" name="postalCode" required readonly></div>
                </div>

                <hr class="my-4">
                <h5 class="form-section-title">Account & Contact</h5>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="contactNumber" class="form-label">Contact Number</label>
                        <input type="tel" class="form-control" id="contactNumber" name="contactNumber" value="+63" required pattern="^(09|\+639)\d{9}$" title="Enter a valid Philippine number (e.g., +639... or 09...).">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    </div>
                </div>

                <hr class="my-4">
                <h5 class="form-section-title">Profile Picture</h5>
                <div class="mb-3">
                    <label for="profilePicture" class="form-label">Upload Picture (Optional)</label>
                    <input class="form-control" type="file" id="profilePicture" name="profile_picture" accept="image/*">
                </div>

                <div class="d-grid gap-2 mt-4">
                    <button type="submit" class="btn btn-success btn-lg">Register</button>
                </div>
                <div class="text-center mt-3">
                    <p>Already have an account? <a href="<c:url value='/login.jsp'/>">Login here</a></p>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Error Modal -->
<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="border-radius: 15px; border-left: 5px solid #dc3545;">
            <div class="modal-header" style="border-bottom: none;">
                <h5 class="modal-title text-danger" id="errorModalLabel"><i class="fas fa-times-circle me-2 text-danger"></i>Error</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="errorModalBody">
                <p class="text-muted">An error occurred.</p>
            </div>
            <div class="modal-footer" style="border-top: none;">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const sameAsPermanentCheckbox = document.getElementById('sameAsPermanent');
        const permanentAddress = document.getElementById('permanentAddress');
        const currentAddress = document.getElementById('currentAddress');

        sameAsPermanentCheckbox.addEventListener('change', function() {
            if (this.checked) {
                // Copy value from permanent to current and make it readonly
                currentAddress.value = permanentAddress.value;
                currentAddress.setAttribute('readonly', true);
            } else {
                // Clear current address and make it editable again
                currentAddress.value = '';
                currentAddress.removeAttribute('readonly');
            }
        });

        // Also update if the permanent address is changed while the box is checked
        permanentAddress.addEventListener('input', function() {
            if (sameAsPermanentCheckbox.checked) {
                currentAddress.value = this.value;
            }
        });

        // Auto-populate ZIP code based on city selection
        const cityDropdown = document.getElementById('city');
        const postalCodeInput = document.getElementById('postalCode');
        cityDropdown.addEventListener('change', function() {
            const selectedOption = this.options[this.selectedIndex];
            postalCodeInput.value = selectedOption.getAttribute('data-zip') || '';
        });

        // Age calculation from Date of Birth
        const dobInput = document.getElementById('dateOfBirth');
        dobInput.addEventListener('change', function() {
            const ageInput = document.getElementById('age');
            if (this.value) {
                const birthDate = new Date(this.value);
                const today = new Date();
                let age = today.getFullYear() - birthDate.getFullYear();
                const m = today.getMonth() - birthDate.getMonth();
                if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                    age--;
                }
                ageInput.value = age >= 0 ? age : 0;
            }
        });

        // Auto-generate username from name fields
        function generateUsername() {
            const surname = document.getElementById('surname').value.trim().toLowerCase();
            const givenName = document.getElementById('givenName').value.trim().toLowerCase();
            const middleName = document.getElementById('middleName').value.trim().toLowerCase();

            if (surname && givenName) {
                let username = surname + '.' + givenName;
                if (middleName) {
                    username += '.' + middleName.charAt(0);
                }
                document.getElementById('username').value = username;
            }
        }
        document.getElementById('surname').addEventListener('input', generateUsername);
        document.getElementById('givenName').addEventListener('input', generateUsername);
        document.getElementById('middleName').addEventListener('input', generateUsername);

        // Password confirmation validation
        const form = document.querySelector('form');
        const password = document.getElementById('password');
        const confirmPassword = document.getElementById('confirmPassword');

        form.addEventListener('submit', function(e) {
            // Normalize contact number before submission
            const contactNumberInput = document.getElementById('contactNumber');
            let contactNumber = contactNumberInput.value.trim();
            if (contactNumber.startsWith('09') && contactNumber.length === 11) {
                contactNumberInput.value = '+63' + contactNumber.substring(1);
            }

            if (password.value !== confirmPassword.value) {
                e.preventDefault();
                alert('Passwords do not match. Please re-enter your password.');
                confirmPassword.focus();
                return;
            }

            // Age validation
            const dobInput = document.getElementById('dateOfBirth');
            const dob = new Date(dobInput.value);
            if (!dobInput.value) return; // Let 'required' attribute handle empty field

            const today = new Date();
            let age = today.getFullYear() - dob.getFullYear();
            const monthDifference = today.getMonth() - dob.getMonth();
            if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < dob.getDate())) {
                age--;
            }

            if (age < 18) {
                e.preventDefault();
                alert('You must be 18 years of age or older to register.');
                dobInput.focus();
                return;
            }

            // Re-enable the username field just before submission so its value is sent
            document.getElementById('username').readOnly = false;
        });

        // Handle contact number input field logic
        const contactInput = document.getElementById('contactNumber');
        contactInput.addEventListener('focus', function() {
            if (this.value === '') {
                this.value = '+63';
            }
        });
        contactInput.addEventListener('blur', function() {
            // If the user clicks away and the field only contains "+63", clear it
            // so the 'required' validation can catch it if they try to submit.
            if (this.value === '+63') {
                this.value = '';
            }
        });
    });

    // Display error modal if error parameter is present in URL
    const urlParams = new URLSearchParams(window.location.search);
    const errorMessage = urlParams.get('error');
    if (errorMessage) {
        const errorModal = new bootstrap.Modal(document.getElementById('errorModal'));
        document.getElementById('errorModalBody').textContent = decodeURIComponent(errorMessage);
        errorModal.show();
        // Optionally, remove the error parameter from the URL after displaying
        history.replaceState(null, '', window.location.pathname);
    }
</script>
</body>
</html>