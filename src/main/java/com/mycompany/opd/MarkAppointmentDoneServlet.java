package com.mycompany.opd;

import com.mycompany.opd.resources.DBUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/mark-appointment-done")
public class MarkAppointmentDoneServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        // Security check: Only Doctors can perform this action.
        if (session == null || !"Doctor".equals(session.getAttribute("userType"))) {
            response.sendRedirect("login.jsp?error=Access Denied.");
            return;
        }

        int appointmentId;
        try {
            appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
        } catch (NumberFormatException e) {
            response.sendRedirect("doctor-dashboard?error=Invalid appointment ID.");
            return;
        }

        int doctorId = (int) session.getAttribute("userId");

        // Update the appointment status to 'Completed'
        // The WHERE clause ensures a doctor can only complete their own assigned appointments.
        String sql = "UPDATE appointments SET status = 'Completed' WHERE appointment_id = ? AND assigned_doctor_id = ? AND status IN ('Accepted', 'Assigned')";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, appointmentId);
            ps.setInt(2, doctorId);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("doctor-dashboard?success=Appointment #" + appointmentId + " marked as completed.");
            } else {
                // This can happen if the appointment doesn't exist or isn't assigned to this doctor.
                response.sendRedirect("doctor-dashboard?error=Could not complete appointment. It may not be assigned to you or is already completed.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("doctor-dashboard?error=Database error occurred while updating the appointment.");
        }
    }
}