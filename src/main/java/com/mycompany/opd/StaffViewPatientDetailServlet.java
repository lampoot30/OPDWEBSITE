package com.mycompany.opd;

import com.mycompany.opd.models.Appointment;
import com.mycompany.opd.models.Patient;
import com.mycompany.opd.resources.DBUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/staff-view-patient-detail")
public class StaffViewPatientDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String patientIdStr = request.getParameter("patientId");
        if (patientIdStr == null || patientIdStr.isEmpty()) {
            response.sendRedirect("staff-patient-records?error=No patient selected.");
            return;
        }

        try {
            int patientId = Integer.parseInt(patientIdStr);
            Patient patient = null;
            List<Appointment> medicalRecords = new ArrayList<>();

            try (Connection conn = DBUtil.getConnection()) {
                // 1. Fetch patient profile details
                String profileSql = "SELECT * FROM user_profiles up JOIN users u ON up.user_id = u.user_id WHERE up.user_id = ?";
                try (PreparedStatement ps = conn.prepareStatement(profileSql)) {
                    ps.setInt(1, patientId);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            patient = new Patient();
                            patient.setUserId(patientId);
                            patient.setGivenName(rs.getString("given_name"));
                            patient.setSurname(rs.getString("surname"));
                            patient.setMiddleName(rs.getString("middle_name"));
                            patient.setDateOfBirth(rs.getDate("date_of_birth"));
                            patient.setGender(rs.getString("gender"));
                            patient.setContactNumber(rs.getString("contact_number"));
                            patient.setPermanentAddress(rs.getString("permanent_address"));
                            patient.setProfilePicturePath(rs.getString("profile_picture_path"));
                        }
                    }
                }

                if (patient == null) {
                    response.sendRedirect("staff-patient-records?error=Patient not found.");
                    return;
                }

                // 2. Fetch patient's appointment history
                String recordsSql = "SELECT a.*, up.given_name AS doc_given_name, up.surname AS doc_surname FROM appointments a LEFT JOIN user_profiles up ON a.assigned_doctor_id = up.user_id WHERE a.booked_by_user_id = ? ORDER BY a.preferred_date DESC";
                try (PreparedStatement ps = conn.prepareStatement(recordsSql)) {
                    ps.setInt(1, patientId);
                    try (ResultSet rs = ps.executeQuery()) {
                        while (rs.next()) {
                            Appointment record = new Appointment();
                            record.setAppointmentId(rs.getInt("appointment_id"));
                            record.setPreferredDate(rs.getDate("preferred_date"));
                            record.setReasonForVisit(rs.getString("reason_for_visit"));
                            record.setStatus(rs.getString("status"));
                            record.setGivenName(rs.getString("doc_given_name"));
                            record.setLastName(rs.getString("doc_surname"));
                            medicalRecords.add(record);
                        }
                    }
                }
            }

            request.setAttribute("patient", patient);
            request.setAttribute("medicalRecords", medicalRecords);
            request.getRequestDispatcher("/staff_view_patient_detail.jsp").forward(request, response);

        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("staff-patient-records?error=An error occurred while fetching patient records.");
        }
    }
}