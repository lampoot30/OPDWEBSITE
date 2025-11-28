<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // Security check: only allow Super Admin users to access this page.
    if (!"Super Admin".equals(session.getAttribute("userType"))) {
        response.sendRedirect(request.getContextPath() + "/login.jsp?error=Access Denied");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Backup & Restore - Super Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f4f7f6; }
        .card { border: none; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.08); }
        .card-header { font-weight: 600; color: white; border-top-left-radius: 15px; border-top-right-radius: 15px; }
        .header-backup { background-color: #198754; }
        .header-restore { background-color: #dc3545; }
        .btn-backup { background-color: #198754; border-color: #198754; color: white; }
        .btn-restore { background-color: #dc3545; border-color: #dc3545; color: white; }
    </style>
</head>
<body>

<c:import url="super_admin_navbar.jsp" />

<div class="main-content">
    <div class="container-fluid">
        <h1 class="h2 mb-4">Database Backup & Restore</h1>

        <!-- Display success or error messages -->
        <c:if test="${not empty param.success}">
            <div class="alert alert-success"><i class="fas fa-check-circle me-2"></i>${param.success}</div>
        </c:if>
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger"><i class="fas fa-exclamation-triangle me-2"></i>${param.error}</div>
        </c:if>

        <div class="row">
            <!-- Backup Section -->
            <div class="col-lg-6 mb-4">
                <div class="card">
                    <div class="card-header header-backup">
                        <h5 class="mb-0"><i class="fas fa-download me-2"></i>Backup Database</h5>
                    </div>
                    <div class="card-body p-4">
                        <p class="text-muted">Click the button below to create a full backup of the 'opd_db' database. The backup will be downloaded as a `.sql` file.</p>
                        <a href="<c:url value='/BackupServlet'/>" class="btn btn-backup fw-bold">
                            <i class="fas fa-database me-2"></i>Create and Download Backup
                        </a>
                    </div>
                </div>
            </div>

            <!-- Restore Section -->
            <div class="col-lg-6 mb-4">
                <div class="card">
                    <div class="card-header header-restore">
                        <h5 class="mb-0"><i class="fas fa-upload me-2"></i>Restore Database</h5>
                    </div>
                    <div class="card-body p-4">
                        <p class="text-danger fw-bold">Warning: Restoring from a backup file will completely overwrite the current database. This action cannot be undone.</p>
                        <form action="RestoreServlet" method="post" enctype="multipart/form-data" onsubmit="return confirm('Are you sure you want to overwrite the entire database with this backup? This action is irreversible.');">
                            <div class="mb-3">
                                <label for="backupFile" class="form-label">Select `.sql` Backup File</label>
                                <input class="form-control" type="file" id="backupFile" name="backupFile" accept=".sql" required>
                            </div>
                            <div class="text-end">
                                <button type="submit" class="btn btn-restore fw-bold">
                                    <i class="fas fa-exclamation-triangle me-2"></i>Restore Database
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>