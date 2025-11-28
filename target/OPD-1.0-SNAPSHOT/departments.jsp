<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Departments - AMH Hospital</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <link rel="icon" href="<c:url value='/AMHLOGO.png'/>" type="image/png">
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f4f7f6; }
        .department-card { 
            border: none; 
            border-radius: 15px; 
            box-shadow: 0 5px 20px rgba(0,0,0,0.08); 
            margin-bottom: 20px; 
            background-color: #fff;
        }
        .department-card-header { 
            font-weight: 600; 
            background-color: #f8f9fa; 
            border-bottom: 1px solid #e9ecef; 
            color: #28a745; /* Primary Green */
            padding: 1rem; 
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .department-card-body { 
            padding: 1.5rem; 
        }
        .department-card-body p {
            margin-bottom: 0.5rem;
            white-space: pre-line; /* This will respect the newlines from the database */
        }
    </style>
</head>
<body>

<!-- Public Navigation Bar -->
<c:import url="navbar-public.jsp" />

<div class="container mt-5">
    <h1 class="mb-4">Departments & Units</h1>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <c:forEach var="dept" items="${departmentList}">
        <div class="department-card">
            <div class="department-card-header">${dept.serviceName}</div>
            <div class="department-card-body">
                <p>${dept.notes}</p>
            </div>
        </div>
    </c:forEach>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>