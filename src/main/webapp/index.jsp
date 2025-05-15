<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Parking Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="card">
        <h1 class="mt-3">Welcome to Parking Management System</h1>
        <div class="d-flex flex-column align-items-center gap-2 mt-3">
            <a href="admin/users" class="btn btn-primary w-100">View All Users</a>
            <% if (session.getAttribute("user") == null) { %>
            <a href="Register.jsp" class="btn btn-primary w-100">Register</a>
            <a href="login.jsp" class="btn btn-primary w-100">Login</a>
            <% } else { %>
            <a href="profile.jsp" class="btn btn-primary w-100">Go to Profile</a>
            <form action="logout" method="post" class="w-100">
                <button type="submit" class="btn btn-secondary w-100">Logout</button>
            </form>
            <% } %>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>