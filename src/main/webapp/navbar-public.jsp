<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-light-custom sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center" href="<c:url value='/'/>">
            <img src="<c:url value='/AMHLOGO.png'/>" alt="AMH Logo" class="me-2" height="40">
            <img src="<c:url value='/AURORA.png'/>" alt="Aurora Logo" class="me-3" height="40">
            <span class="fw-bold">Aurora Memorial Hospital OPD</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#publicNavbar" aria-controls="publicNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="publicNavbar">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/'/>">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/login.jsp'/>">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value='/register.jsp'/>">Register</a>
                </li>
            </ul>
        </div>
    </div>
</nav>