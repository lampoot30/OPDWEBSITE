package com.mycompany.opd;

import com.mycompany.opd.resources.ConfigUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/BackupServlet")
public class BackupServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || !"Super Admin".equals(session.getAttribute("userType"))) {
            response.sendRedirect("login.jsp?error=Unauthorized access.");
            return;
        }

        // Database credentials - these should match your DBUtil.java
        String dbName = ConfigUtil.getProperty("db.name");
        String dbUser = ConfigUtil.getProperty("db.user");
        String dbPassword = ConfigUtil.getProperty("db.password");
        
        String mysqlBinPath = ConfigUtil.getProperty("mysql.bin.path");
        if (mysqlBinPath == null || mysqlBinPath.trim().isEmpty()) {
            throw new IOException("mysql.bin.path is not configured in config.properties. Backup cannot proceed.");
        }

        try {
            // Prepare the mysqldump command
            String dumpCommand = mysqlBinPath + "mysqldump";
            String command;
            if (dbPassword == null || dbPassword.isEmpty()) {
                // If there is no password, do not include the -p flag
                command = String.format("\"%s\" -u %s %s", dumpCommand, dbUser, dbName);
            } else {
                command = String.format("\"%s\" -u %s -p%s %s", dumpCommand, dbUser, dbPassword, dbName);
            }

            // Execute the command as a process
            Process process = Runtime.getRuntime().exec(command);

            // Set response headers for file download
            String timestamp = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss").format(new Date());
            String fileName = "opd_db_backup_" + timestamp + ".sql";
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

            // Stream the output of the command directly to the response
            try (InputStream inputStream = process.getInputStream();
                 OutputStream outputStream = response.getOutputStream()) {

                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
            }

            int processComplete = process.waitFor();
            if (processComplete != 0) {
                // Capture and display the error stream for better debugging
                try (InputStream errorStream = process.getErrorStream()) {
                    String errorOutput = new String(errorStream.readAllBytes());
                    if (errorOutput.isEmpty()) {
                         throw new IOException("mysqldump process exited with error code: " + processComplete);
                    } else {
                         throw new IOException("mysqldump error: " + errorOutput);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("backup_restore.jsp?error=Backup failed: " + e.getMessage());
        }
    }
}