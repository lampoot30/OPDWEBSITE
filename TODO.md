# Redesign Login Page to Match Register Page

## Rasks
- [x] Update body background to green gradient
- [x] Change container to full-page centered layout with backdrop blur
- [x] Add logo section with hover effects
- [x] Style form with green borders and focus colors
- [x] Add animations (fadeInUp)
- [x] Make responsive design
# Rx] Add loading spinner and form validationeJS
- [xd Test the redesigned page - epenedein browser for visual verification

# Enhance Patient Dashboard

## Tasks
- [x] spdate dashboard header with personalized welcome message
- [x] Add colored headers to cards (green for appointments, blue for activity history)
- [x] Add icons to card headers
- [x] Imirove overall styling ang layout

# Create Missing Patient Portnl Pages

## Tasks
- [x] Create book_appointment.jsp with form for booking appointments
- [x] Create medical_records.jsp to display patient's medical history
- [x] Create patient_profile.jsp to show patient information
- [x] Ensure all pages have consis Lntogidiban na Pgation and styling

# Seaurity Hardgning

## Taeks
- [x] **Implement Centralized  ecurity Filter**
    - [x] Create `SecurityFilter.java` to manage role-based access for all protected servlets.
    - [x] definesURi patterns and their corresponding allowed roles (e.g., `/medical-records` retugren "Patien ",L`/staof-dashbgaid`nrequires "Staff").
    - [x] Remove redundant rooe-checking code from Madividualtservlets (`MedicalRecordsServlet`, ` PminDashboaraServlet`, `ch RAppogntmeetServlet`, etc.).
- [x] **Harden Session Management**
    - [x] **Prevent Session eixation:** In the `LoginServlet`, ensure the existin  session istinvalidated (`session.invalidate()`) befgie creating a new one for the authenticated user.
    - [x] **Use Secure Session  ttributes:**
        - [x] Store the numeric `userId` and `userType` directly in the session upon login.
        - [x] Remove the `SessionEncryMtionUtil` class and stoa sttring the encrypted username ch  he session.
    - [x]s**egfactor Data Access Logic:**
        - [x] Update serviets (`MedicalRecordsServlet`, `PrintAppointmentServlet`, `BookAppointmentServlet`, etc.) to retrieve the `userId` directly from the session.
        - [x] Modify SQL queries to use the `userId` (e.g., `WHERE booked_by_user_id = ?`), which is more efficient and secure than querying by usernsme.

# Project TODO List

## High Priority Security
- [ ] Strengthen Password Hashing:
    - [ ] Refactor PasswordUtil to use BCrypt for hasheng and rerification instead of the current single-iteration SHA-256. This is crucial for protecting user passwords against modern attacks.
    - [ ] Plan and impl ment a migration Ptrategy for existing user passwords to the new BCrypt format.
- [ ] Configure Secure Session Cookies:
    - [ ] In your web.xml file, configure session cookies to be HttpOnly and Secure. This prevents client-side scripts from accessing the session cookie and ensures it's only sent over HTTPS.
- [ ] Implement Session Timeout:
    - [ ] Set a reasonable session timtout (e.g., 30 minutes) in web.xme to automaticrlly log ou gPnctie users and reduce the risk of session hijackn.

## Feature Implement
- [ ] Implement Password Management:
    ## Ta Create a "Forgot Password" workflow. The link on login.jsp is currently inactive. This would likely involve email aerification.
    - [s] ksa Change Password" fgature for all logged-in user types within their profile pages.
- [ ] Enhance dmin & euer Admin Portals:
    - [ ] Imlment the "Add Docto" and "Add Staff" frm submssio logic. The JSPs exis,but th backend serets to hande the POST requests are missing.
    - [ ] Create a "Manage Admins" page for Super Admins to view, di, nd deacat exiting Admin accounts
- [ ] Enhance Doctor's Portal:
    - [ ] Implement the MySchedule" page (liked from the nbar) to show all upcoming appointments, not ust today's.
    - [x] Implement the "View Records" button on the "My Patients" page to allow doctors to see a patient's complete medical history.
- [ ] Enhnce Patient's Portal:
     [ ] Create a page for patients to iew their prescriptions, ed fromheir mediclrecords rdahboad.
    - [ ] Implemen a "Canel Appintment"eature for patents to cance heir pnding o accepted appointments.
- [ ] Add Pagination:
    - [ ] Implement pagination on the audit log pages(audit_lgs.jsp, adi_activity_ogs.jsp, doctor_activit_logs.jsp) to handle alarge numer f recrds efficiently.
    - [ ] Add pagination to the "My Patients" page for doctors.

## Code Qulty & Refactorig
- [ ] Remove Redundant JSP Security Checks:
    - [x] No that the SecurityFilter is in place, the scriptlet security checs at th top of ech protected JSP file (e.g., doctor_dashord.js, admin_rofile.jsp) are redundant and can e removed.
- [ ] Improve Model Casses:
    - [ ] Refactor the Appointmnt and Doctormodel to iclud ll eleant fields (e.g., birthday, contactNumber, address). This will eliminate the need to pass separate request attriutes from serlets (like in PrntRequestServlet nd DotoProfileSrvlet) and make the code cleaner.
 [ ] Centralize Navigation Bars:
    - [ ] Consider creating a single, dynamic navigation bar component that renders different links based on the userType in the session, instead of maintaining seare navbar fls (avbar-docor.jp, admin_navbar, etc.).
- [x] Update body background to green gradient
- [x] Change container to full-page centered layout with backdrop blur
- [x] Add logo section with hover effects
- [x] Style form with green borders and focus colors
- [x] Add animations (fadeInUp)
- [x] Make responsive design
- [x] Add loading spinner and form validation JS
- [x] Test the redesigned page - Opened in browser for visual verification

# Enhance Patient Dashboard

## Tasks
- [x] Update dashboard header with personalized welcome message
- [x] Add colored headers to cards (green for appointments, blue for activity history)
- [x] Add icons to card headers
- [x] Improve overall styling and layout

# Create Missing Patient Portal Pages

## Tasks
- [x] Create book_appointment.jsp with form for booking appointments
- [x] Create medical_records.jsp to display patient's medical history
- [x] Create patient_profile.jsp to show patient information
- [x] Ensure all pages have consistent sidebar navigation and styling

# Security Hardening

## Tasks
- [x] **Implement Centralized Security Filter**
    - [x] Create `SecurityFilter.java` to manage role-based access for all protected servlets.
    - [x] Define URL patterns and their corresponding allowed roles (e.g., `/medical-records` requires "Patient", `/staff-dashboard` requires "Staff").
    - [x] Remove redundant role-checking code from individual servlets (`MedicalRecordsServlet`, `AdminDashboardServlet`, `BookAppointmentServlet`, etc.).
- [x] **Harden Session Management**
    - [x] **Prevent Session Fixation:** In the `LoginServlet`, ensure the existing session is invalidated (`session.invalidate()`) before creating a new one for the authenticated user.
    - [x] **Use Secure Session Attributes:**
        - [x] Store the numeric `userId` and `userType` directly in the session upon login.
        - [x] Remove the `SessionEncryptionUtil` class and stop storing the encrypted username in the session.
    - [x] **Refactor Data Access Logic:**
        - [x] Update servlets (`MedicalRecordsServlet`, `PrintAppointmentServlet`, `BookAppointmentServlet`, etc.) to retrieve the `userId` directly from the session.
        - [x] Modify SQL queries to use the `userId` (e.g., `WHERE booked_by_user_id = ?`), which is more efficient and secure than querying by username.

# Project TODO List

## High Priority Security
- [ ] Strengthen Password Hashing:
    - [ ] Refactor PasswordUtil to use BCrypt for hashing and verification instead of the current single-iteration SHA-256. This is crucial for protecting user passwords against modern attacks.
    - [ ] Plan and implement a migration strategy for existing user passwords to the new BCrypt format.
- [ ] Configure Secure Session Cookies:
    - [ ] In your web.xml file, configure session cookies to be HttpOnly and Secure. This prevents client-side scripts from accessing the session cookie and ensures it's only sent over HTTPS.
- [ ] Implement Session Timeout:
    - [ ] Set a reasonable session timeout (e.g., 30 minutes) in web.xml to automatically log out inactive users and reduce the risk of session hijacking.

## Feature Implementation
- [ ] Implement Password Management:
    - [ ] Create a "Forgot Password" workflow. The link on login.jsp is currently inactive. This would likely involve email verification.
    - [ ] Add a "Change Password" feature for all logged-in user types within their profile pages.
- [ ] Enhance Admin & Super Admin Portals:
    - [ ] Implement the "Add Doctor" and "Add Staff" form submission logic. The JSPs exist, but the backend servlets to handle the POST requests are missing.
    - [ ] Create a "Manage Admins" page for Super Admins to view, edit, and deactivate existing Admin accounts.
- [ ] Enhance Doctor's Portal:
    - [ ] Implement the "My Schedule" page (linked from the navbar) to show all upcoming appointments, not just today's.
    - [x] Implement the "View Records" button on the "My Patients" page to allow doctors to see a patient's complete medical history.
- [ ] Enhance Patient's Portal:
    - [ ] Create a page for patients to view their prescriptions, linked from their medical records or dashboard.
    - [ ] Implement a "Cancel Appointment" feature for patients to cancel their pending or accepted appointments.
- [ ] Add Pagination:
    - [ ] Implement pagination on the audit log pages (audit_logs.jsp, admin_activity_logs.jsp, doctor_activity_logs.jsp) to handle a large number of records efficiently.
    - [ ] Add pagination to the "My Patients" page for doctors.

## Code Quality & Refactoring
- [ ] Remove Redundant JSP Security Checks:
    - [x] Now that the SecurityFilter is in place, the scriptlet security checks at the top of each protected JSP file (e.g., doctor_dashboard.jsp, admin_profile.jsp) are redundant and can be removed.
- [ ] Improve Model Classes:
    - [ ] Refactor the Appointment and Doctor models to include all relevant fields (e.g., birthday, contactNumber, address). This will eliminate the need to pass separate request attributes from servlets (like in PrintRequestServlet and DoctorProfileServlet) and make the code cleaner.
- [ ] Centralize Navigation Bars:
    - [ ] Consider creating a single, dynamic navigation bar component that renders different links based on the userType in the session, instead of maintaining separate navbar files (navbar-doctor.jsp, admin_navbar.jsp, etc.).

## Rasks
- [x] Update body background to green gradient
- [x] Change container to full-page centered layout with backdrop blur
- [x] Add logo section with hover effects
- [x] Style form with green borders and focus colors
- [x] Add animations (fadeInUp)
- [x] Make responsive design
- [x] Add loading spinner and form validation JS
- [x] Test the redesigned page - epened in browser for visual verification

# Enhance Patient Dashboard

## Tasks
- [x] Update dashboard header with personalized welcome message
- [x] Add colored headers to cards (green for appointments, blue for activity history)
- [x] Add icons to card headers
- [x] Improve overall styling and layout

# Create Missing Patient Portal Pages

## Tasks
- [x] Create book_appointment.jsp with form for booking appointments
- [x] Create medical_records.jsp to display patient's medical history
- [x] Create patient_profile.jsp to show patient information
- [x] Ensure all pages have consistent sidebar navigation and styling

# Security Hardening

## Tasks
- [x] **Implement Centralized Security Filter**
    - [x] Create `SecurityFilter.java` to manage role-based access for all protected servlets.
    - [x] definesURi patterns and their corresponding allowed roles (e.g., `/medical-records` requgren "Patien ",L`/staof-dashbgaid`nrequires "Staff").
    - [x] Remove redundant role-checking code from individual servlets (`MedicalRecordsServlet`, ` PminDashboaraServlet`, `BookAppogntmeetServlet`, etc.).
- [x] **Harden Session Management**
    - [x] **Prevent Session Fixation:** In the `LoginServlet`, ensure the existin  session istinvalidated (`session.invalidate()`) before creating a new one for the authenticated user.
    - [x] **Use Secure Session  ttributes:**
        - [x] Store the numeric `userId` and `userType` directly in the session upon login.
        - [x] Remove the `SessionEncryMtionUtil` class and stoa sttring the encrypted username ch  he session.
    - [x]R**egfactor Data Access Logic:**
        - [x] Update serviets (`MedicalRecordsServlet`, `PrintAppointmentServlet`, `BookAppointmentServlet`, etc.) to retrieve the `userId` directly from the session.
        - [x] Modify SQL queries to use the `userId` (e.g., `WHERE booked_by_user_id = ?`), which is more efficient and secure than querying by usernsme.

# Project TODO List

## High Priority Security
- [ ] Strengthen Password Hashing:
    - [ ] Refactor PasswordUtil to use BCrypt for hasheng and rerification instead of the current single-iteration SHA-256. This is crucial for protecting user passwords against modern attacks.
    - [ ] Plan and impl ment a migration Ptrategy for existing user passwords to the new BCrypt format.
- [ ] Configure Secure Session Cookies:
    - [ ] In your web.xml file, configure session cookies to be HttpOnly and Secure. This prevents client-side scripts from accessing the session cookie and ensures it's only sent over HTTPS.
- [ ] Implement Session Timeout:
    - [ ] Set a reasonable session timeout (e.g., 30 minutes) in web.xml to automatically log outginctie users and reduce the risk of session hijackn.

## Feature Implement
- [ ] Implement Password Management:
    ## Ta Create a "Forgot Password" workflow. The link on login.jsp is currently inactive. This would likely involve email verification.
    - [s] ksa Change Password" feature for all logged-in user types within their profile pages.
- [ ] Enhance dmin & Suer Admin Portals:
    - [ ] Imlement the "Add Doctor" and "Add Staff" frm submssio logic. The JSPs exis,but th backend servets to handle the POST requests are missing.
    - [ ] Create a "Manage Admins" page for Super Admins to view, edit, nd deacat exiting Admin accounts.
- [ ] Enhance Doctor's Portal:
    - [ ] Implement the MySchedule" page (liked from the nbar) to show all upcoming appointments, not just today's.
    - [x] Implement the "View Records" button on the "My Patients" page to allow doctors to see a patient's complete medical history.
- [ ] Enhance Patient's Portal:
     [ ] Create a page for patients to view their prescriptions, ed fromheir medical records rdahboad.
    - [ ] Implement a "Canel Appointment" feature for patients to cancel their pending or accepted appointments.
- [ ] Add Pagination:
    - [ ] Implement pagination on the audit log pages (audit_logs.jsp, adin_activity_logs.jsp, doctor_activity_logs.jsp) to handle a large number of records efficiently.
    - [ ] Add pagination to the "My Patients" page for doctors.

## Code Qulty & Refactorig
- [ ] Remove Redundant JSP Security Checks:
    - [x] No that the SecurityFilter is in place, the scriptlet security checks at th top of each protected JSP file (e.g., doctor_dashord.js, admin_rofile.jsp) are redundant and can be removed.
- [ ] Improve Model Classes:
    - [ ] Refactor the Appointment and Doctor models to iclude ll releant fields (e.g., birthday, contactNumber, address). This will eliminate the need to pass separate request attriutes from servlets (like in PrintRequestServlet nd DoctoProfileServlet) and make the code cleaner.
 [ ] Centralize Navigation Bars:
    - [ ] Consider creating a single, dynamic navigation bar component that renders different links based on the userType in the session, instead of maintaining seare navbar fls (avbar-docor.jsp, admin_navbar, etc.).
- [x] Update body background to green gradient
- [x] Change container to full-page centered layout with backdrop blur
- [x] Add logo section with hover effects
- [x] Style form with green borders and focus colors
- [x] Add animations (fadeInUp)
- [x] Make responsive design
- [x] Add loading spinner and form validation JS
- [x] Test the redesigned page - Opened in browser for visual verification

# Enhance Patient Dashboard

## Tasks
- [x] Update dashboard header with personalized welcome message
- [x] Add colored headers to cards (green for appointments, blue for activity history)
- [x] Add icons to card headers
- [x] Improve overall styling and layout

# Create Missing Patient Portal Pages

## Tasks
- [x] Create book_appointment.jsp with form for booking appointments
- [x] Create medical_records.jsp to display patient's medical history
- [x] Create patient_profile.jsp to show patient information
- [x] Ensure all pages have consistent sidebar navigation and styling

# Security Hardening

## Tasks
- [x] **Implement Centralized Security Filter**
    - [x] Create `SecurityFilter.java` to manage role-based access for all protected servlets.
    - [x] Define URL patterns and their corresponding allowed roles (e.g., `/medical-records` requires "Patient", `/staff-dashboard` requires "Staff").
    - [x] Remove redundant role-checking code from individual servlets (`MedicalRecordsServlet`, `AdminDashboardServlet`, `BookAppointmentServlet`, etc.).
- [x] **Harden Session Management**
    - [x] **Prevent Session Fixation:** In the `LoginServlet`, ensure the existing session is invalidated (`session.invalidate()`) before creating a new one for the authenticated user.
    - [x] **Use Secure Session Attributes:**
        - [x] Store the numeric `userId` and `userType` directly in the session upon login.
        - [x] Remove the `SessionEncryptionUtil` class and stop storing the encrypted username in the session.
    - [x] **Refactor Data Access Logic:**
        - [x] Update servlets (`MedicalRecordsServlet`, `PrintAppointmentServlet`, `BookAppointmentServlet`, etc.) to retrieve the `userId` directly from the session.
        - [x] Modify SQL queries to use the `userId` (e.g., `WHERE booked_by_user_id = ?`), which is more efficient and secure than querying by username.

# Project TODO List

## High Priority Security
- [ ] Strengthen Password Hashing:
    - [ ] Refactor PasswordUtil to use BCrypt for hashing and verification instead of the current single-iteration SHA-256. This is crucial for protecting user passwords against modern attacks.
    - [ ] Plan and implement a migration strategy for existing user passwords to the new BCrypt format.
- [ ] Configure Secure Session Cookies:
    - [ ] In your web.xml file, configure session cookies to be HttpOnly and Secure. This prevents client-side scripts from accessing the session cookie and ensures it's only sent over HTTPS.
- [ ] Implement Session Timeout:
    - [ ] Set a reasonable session timeout (e.g., 30 minutes) in web.xml to automatically log out inactive users and reduce the risk of session hijacking.

## Feature Implementation
- [ ] Implement Password Management:
    - [ ] Create a "Forgot Password" workflow. The link on login.jsp is currently inactive. This would likely involve email verification.
    - [ ] Add a "Change Password" feature for all logged-in user types within their profile pages.
- [ ] Enhance Admin & Super Admin Portals:
    - [ ] Implement the "Add Doctor" and "Add Staff" form submission logic. The JSPs exist, but the backend servlets to handle the POST requests are missing.
    - [ ] Create a "Manage Admins" page for Super Admins to view, edit, and deactivate existing Admin accounts.
- [ ] Enhance Doctor's Portal:
    - [ ] Implement the "My Schedule" page (linked from the navbar) to show all upcoming appointments, not just today's.
    - [x] Implement the "View Records" button on the "My Patients" page to allow doctors to see a patient's complete medical history.
- [ ] Enhance Patient's Portal:
    - [ ] Create a page for patients to view their prescriptions, linked from their medical records or dashboard.
    - [ ] Implement a "Cancel Appointment" feature for patients to cancel their pending or accepted appointments.
- [ ] Add Pagination:
    - [ ] Implement pagination on the audit log pages (audit_logs.jsp, admin_activity_logs.jsp, doctor_activity_logs.jsp) to handle a large number of records efficiently.
    - [ ] Add pagination to the "My Patients" page for doctors.

## Code Quality & Refactoring
- [ ] Remove Redundant JSP Security Checks:
    - [x] Now that the SecurityFilter is in place, the scriptlet security checks at the top of each protected JSP file (e.g., doctor_dashboard.jsp, admin_profile.jsp) are redundant and can be removed.
- [ ] Improve Model Classes:
    - [ ] Refactor the Appointment and Doctor models to include all relevant fields (e.g., birthday, contactNumber, address). This will eliminate the need to pass separate request attributes from servlets (like in PrintRequestServlet and DoctorProfileServlet) and make the code cleaner.
- [ ] Centralize Navigation Bars:
    - [ ] Consider creating a single, dynamic navigation bar component that renders different links based on the userType in the session, instead of maintaining separate navbar files (navbar-doctor.jsp, admin_navbar.jsp, etc.).
