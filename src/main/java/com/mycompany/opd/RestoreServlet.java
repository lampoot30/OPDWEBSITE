package com.mycompany.opd;

import com.mycompany.opd.resources.AuditLogger;
import com.mycompany.opd.resources.ConfigUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@WebServlet("/RestoreServlet")
@MultipartConfig
public class RestoreServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"Super Admin".equals(session.getAttribute("userType"))) {
            response.sendRedirect("login.jsp?error=Unauthorized access.");
            return;
        }

        Part filePart = request.getPart("backupFile");
        if (filePart == null || filePart.getSize() == 0) {
            response.sendRedirect("backup_restore.jsp?error=No backup file was uploaded.");
            return;
        }

        // Database credentials
        String dbName = ConfigUtil.getProperty("db.name");
        String dbUser = ConfigUtil.getProperty("db.user");
        String dbPassword = ConfigUtil.getProperty("db.password");
        
        String mysqlBinPath = ConfigUtil.getProperty("mysql.bin.path");
        if (mysqlBinPath == null || mysqlBinPath.trim().isEmpty()) {
            throw new IOException("mysql.bin.path is not configured in config.properties. Restore cannot proceed.");
        }

        try {
            // Prepare the mysql command
            String restoreCommand = mysqlBinPath + "mysql";
            String command;
            if (dbPassword == null || dbPassword.isEmpty()) {
                command = String.format("\"%s\" -u %s %s", restoreCommand, dbUser, dbName);
            } else {
                command = String.format("\"%s\" -u %s -p%s %s", restoreCommand, dbUser, dbName);
            }

            // Execute the command
            Process process = Runtime.getRuntime().exec(command);

            // Read the error stream in a separate thread to prevent blocking
            // This must be started BEFORE writing to the process's output stream
            StringBuilder errorOutput = new StringBuilder();
            Thread errorGobbler = new Thread(() -> {
                try (BufferedReader reader = new BufferedReader(new java.io.InputStreamReader(process.getErrorStream()))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        errorOutput.append(line).append("\n");
                    }
                } catch (IOException e) {
                    // This can happen if the process closes, it's usually safe to ignore
                }
            });
            errorGobbler.start();

            // Stream the uploaded file content to the mysql process
            try (InputStream fileInputStream = filePart.getInputStream();
                 OutputStream processOutputStream = process.getOutputStream()) {

                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                    processOutputStream.write(buffer, 0, bytesRead);
                }
            }

            int processComplete = process.waitFor();
            errorGobbler.join(); // Wait for the error-reading thread to finish

            if (processComplete == 0) {
                // Log the successful restore action
                int superAdminId = (int) session.getAttribute("userId");
                String superAdminUsername = (String) session.getAttribute("displayUsername");
                String action = "Restored database from file: " + filePart.getSubmittedFileName();
                AuditLogger.log(superAdminId, superAdminUsername, "Super Admin", action);

                response.sendRedirect("backup_restore.jsp?success=Database restored successfully!");
            } else {
                // If the process failed, throw an exception with the captured error message
                throw new IOException("Restore process failed with error code " + processComplete + ". Details: " + errorOutput.toString());
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("backup_restore.jsp?error=Restore failed: " + e.getMessage());
        }
    }
}