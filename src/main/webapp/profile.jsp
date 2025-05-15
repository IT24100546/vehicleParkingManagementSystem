<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.parking.model.User" %>
<html>
<head>
    <title>Profile - Parking Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="card">
        <h2 class="mb-4">Profile</h2>
        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <% if (request.getAttribute("error") != null) { %>
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <%= request.getAttribute("error") %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% } %>
        <% if (request.getAttribute("message") != null) { %>
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <%= request.getAttribute("message") %>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <% } %>
        <form id="profileForm" action="profile" method="post" onsubmit="return validateForm('profileForm')">
            <input type="hidden" name="action" value="update">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" value="<%= user.getUsername() %>" required>
                <div class="invalid-feedback">Please enter a username.</div>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="<%= user.getPassword() %>" required>
                <div class="invalid-feedback">Please enter a password.</div>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" required>
                <div class="invalid-feedback">Please enter a valid email.</div>
            </div>
            <div class="mb-3">
                <label for="phoneNumber" class="form-label">Phone Number</label>
                <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" value="<%= user.getPhoneNumber() %>" required>
                <div class="invalid-feedback">Please enter a valid phone number.</div>
            </div>
            <div class="mb-3">
                <label for="vehicleName" class="form-label">Vehicle Name (e.g., Toyota Corolla)</label>
                <input type="text" class="form-control" id="vehicleName" name="vehicleName" value="<%= user.getVehicleName() %>" required>
                <div class="invalid-feedback">Please enter the vehicle name.</div>
            </div>
            <div class="mb-3">
                <label for="vehicleNumber" class="form-label">Vehicle Number (License Plate)</label>
                <input type="text" class="form-control" id="vehicleNumber" name="vehicleNumber" value="<%= user.getVehicleNumber() %>" required>
                <div class="invalid-feedback">Please enter the vehicle number.</div>
            </div>
            <button type="submit" class="btn btn-primary w-100">Update Profile</button>
        </form>
        <form action="profile" method="post" class="mt-3" onsubmit="return confirmDelete()">
            <input type="hidden" name="action" value="delete">
            <button type="submit" class="btn btn-danger w-100">Delete Account</button>
        </form>
        <form action="logout" method="post" class="mt-3">
            <button type="submit" class="btn btn-secondary w-100">Logout</button>
        </form>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>