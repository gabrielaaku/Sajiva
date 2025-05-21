<%-- 
    Document   : adminHome
    Created on : 21 May 2025, 17.46.52
    Author     : dinda salma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Akun" %>
<%
    // Pastikan hanya admin yang bisa akses halaman ini
    Akun loggedUser = (Akun) session.getAttribute("loggedUser");
    if (loggedUser == null || !"admin".equalsIgnoreCase(loggedUser.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
</head>
<body>
    <h1>Selamat Datang, Admin <%= loggedUser.getNama() %>!</h1>
    <p>Ini halaman khusus admin.</p>
</body>
</html>