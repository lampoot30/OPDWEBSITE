package com.mycompany.opd;

import com.mycompany.opd.resources.OtpService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/resend-otp")
public class ResendOtpServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        response.setContentType("application/json");

        if (session == null || session.getAttribute("newContactNumber") == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"success\": false, \"message\": \"Your session is invalid. Please start over.\"}");
            return;
        }

        try {
            String newContactNumber = (String) session.getAttribute("newContactNumber");
            OtpService.generateAndSendOtp(session, newContactNumber);
            response.getWriter().write("{\"success\": true, \"message\": \"A new OTP has been sent.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"success\": false, \"message\": \"An error occurred while sending the OTP.\"}");
        }
    }
}