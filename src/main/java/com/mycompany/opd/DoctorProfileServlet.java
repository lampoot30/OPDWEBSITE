package com.mycompany.opd;

import com.mycompany.opd.models.Doctor;
import com.mycompany.opd.models.User;
import com.mycompany.opd.resources.DBUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/doctor-profile")
public class DoctorProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Security check: Ensure a valid doctor session exists.
        if (session == null || !"Doctor".equals(session.getAttribute("userType"))) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Access Denied");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        Doctor doctor = new Doctor();
        User user = new User();

        try {
            String sql = "SELECT * FROM users u JOIN user_profiles up ON u.user_id = up.user_id WHERE u.user_id = ? AND u.user_type = 'Doctor'";
            try (Connection conn = DBUtil.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, userId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        // Populate the doctor bean from users table
                        user.setUserId(rs.getInt("user_id"));
                        user.setUsername(rs.getString("username"));
                        user.setContactNumber(rs.getString("contact_number"));

                        // Populate from doctors table
                        doctor.setDoctorId(rs.getInt("profile_id"));
                        doctor.setSurname(rs.getString("surname"));
                        doctor.setGivenName(rs.getString("given_name"));
                        doctor.setSpecialization(rs.getString("specialization"));
                        doctor.setMiddleName(rs.getString("middle_name"));
                        doctor.setDateOfBirth(rs.getDate("date_of_birth"));
                        // Calculate age from date of birth
                        java.sql.Date dob = rs.getDate("date_of_birth");
                        java.time.LocalDate birthDate = dob.toLocalDate();
                        java.time.LocalDate currentDate = java.time.LocalDate.now();
                        int age = java.time.Period.between(birthDate, currentDate).getYears();
                        doctor.setAge(age);
                        doctor.setGender(rs.getString("gender"));
                        doctor.setAddress(rs.getString("permanent_address"));
                        doctor.setProfilePicturePath(rs.getString("profile_picture_path"));
                        doctor.setLicenseNumber(rs.getString("license_number"));
                        doctor.setLicenseExpiryDate(rs.getDate("license_expiry_date"));
                        
                    } else {
                        throw new ServletException("Doctor profile not found for user ID: " + userId);
                    }
                }
            }

            // Set the doctor bean as a request attribute
            request.setAttribute("user", user);
            request.setAttribute("doctor", doctor);

            // Forward to the JSP for display
            RequestDispatcher dispatcher = request.getRequestDispatcher("/doctor_profile.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions, maybe forward to an error page
            response.sendRedirect(request.getContextPath() + "/doctor-dashboard?error=Could not load profile.");
        }
    }
}