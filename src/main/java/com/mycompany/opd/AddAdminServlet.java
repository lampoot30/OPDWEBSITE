package com.mycompany.opd;

import com.mycompany.opd.resources.AuditLogger;
import com.mycompany.opd.resources.DBUtil;
import com.mycompany.opd.resources.PasswordUtil;
import com.mycompany.opd.resources.SmsService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/AddAdminServlet")
@MultipartConfig
public class AddAdminServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads" + File.separator + "profile_pictures";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("add_admin.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        int superAdminId = (int) session.getAttribute("userId");
        String superAdminUsername = (String) session.getAttribute("username");

        String username = request.getParameter("username");
        String contactNumber = request.getParameter("contactNumber");
        String generatedPassword = PasswordUtil.generateRandomPassword(10); // Auto-generate a 10-character password
        String hashedPassword = PasswordUtil.hashPassword(generatedPassword);
        String profilePicPath = null;

        // --- Handle File Upload ---
        Part filePart = request.getPart("profile_picture");
        String fileName = filePart.getSubmittedFileName();

        if (fileName != null && !fileName.isEmpty()) {
            String applicationPath = request.getServletContext().getRealPath("");
            String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

            File uploadDir = new File(uploadFilePath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            String uniqueFileName = username + "_" + System.currentTimeMillis() + "_" + fileName;
            filePart.write(uploadFilePath + File.separator + uniqueFileName);
            profilePicPath = (UPLOAD_DIR + File.separator + uniqueFileName).replace(File.separator, "/");
        }

        try (Connection conn = DBUtil.getConnection()) {
            conn.setAutoCommit(false);

            // 1. Insert into users table
            String userSql = "INSERT INTO users (username, password, contact_number, user_type, status) VALUES (?, ?, ?, ?, ?)";
            int newAdminId = -1;
            try (PreparedStatement userPs = conn.prepareStatement(userSql, Statement.RETURN_GENERATED_KEYS)) {
                userPs.setString(1, username);
                userPs.setString(2, hashedPassword); // Save the hashed generated password
                userPs.setString(3, contactNumber);
                userPs.setString(4, "Admin");
                userPs.setString(5, "active"); // Set the status to active
                userPs.executeUpdate();

                try (ResultSet generatedKeys = userPs.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        newAdminId = generatedKeys.getInt(1);
                    } else {
                        throw new SQLException("Creating admin user failed, no ID obtained.");
                    }
                }
            }

            // 2. Insert into user_profiles table
            String profileSql = "INSERT INTO user_profiles (user_id, surname, given_name, middle_name, date_of_birth, gender, permanent_address, profile_picture_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement profilePs = conn.prepareStatement(profileSql)) {
                profilePs.setInt(1, newAdminId);
                profilePs.setString(2, request.getParameter("surname"));
                profilePs.setString(3, request.getParameter("givenName"));
                profilePs.setString(4, request.getParameter("middleName"));
                profilePs.setDate(5, Date.valueOf(request.getParameter("dateOfBirth")));
                profilePs.setString(6, request.getParameter("gender"));
                profilePs.setString(7, request.getParameter("address"));
                
                if (profilePicPath != null) {
                    profilePs.setString(8, profilePicPath);
                } else {
                    profilePs.setNull(8, java.sql.Types.VARCHAR);
                }
                profilePs.executeUpdate();
            }

            conn.commit();

            // 3. Send SMS notification to the new admin
            try {
                String message = "You have been registered as an Admin in the AMH OPD System. Your username is: " + username + " and your temporary password is: " + generatedPassword;
                SmsService.sendSms(contactNumber, message);
            } catch (Exception e) {
                // Log the error but don't fail the whole operation
                System.err.println("SMS notification failed for new admin " + username + ": " + e.getMessage());
                response.sendRedirect("AddAdminServlet?success=Admin created, but SMS notification failed.&error=" + e.getMessage());
                return;
            }

            AuditLogger.log(superAdminId, superAdminUsername, "Super Admin", "Created new admin account: " + username);
            response.sendRedirect("AddAdminServlet?success=New admin account created successfully and notification sent.");

        } catch (SQLException e) {
            e.printStackTrace();
            if (e.getSQLState().equals("23000")) { // Duplicate entry
                response.sendRedirect("AddAdminServlet?error=Username or contact number already exists.");
            } else {
                response.sendRedirect("AddAdminServlet?error=Database error during admin creation.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AddAdminServlet?error=An unexpected error occurred: " + e.getMessage());
        }
    }
}