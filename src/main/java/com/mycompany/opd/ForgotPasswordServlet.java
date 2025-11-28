package com.mycompany.opd;

import com.mycompany.opd.resources.DBUtil;
import com.mycompany.opd.resources.OtpService;
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
import java.sql.SQLException;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String contactNumber = request.getParameter("contactNumber");

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT user_id FROM users WHERE contact_number = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, contactNumber);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        int userId = rs.getInt("user_id");
                        
                        HttpSession session = request.getSession();
                        session.setAttribute("resetPasswordUserId", userId);
                        
                        OtpService.generateAndSendOtp(session, contactNumber);
                        
                        response.sendRedirect("reset_password.jsp");
                    } else {
                        response.sendRedirect("forgot_password.jsp?error=Contact number not found in our records.");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("forgot_password.jsp?error=A database error occurred. Please try again later.");
        }
    }
}