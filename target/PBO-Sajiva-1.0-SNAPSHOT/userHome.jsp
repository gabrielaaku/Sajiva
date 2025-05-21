<%-- 
    Document   : home
    Created on : 21 Apr 2025, 09.52.16
    Author     : dinda salma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.Akun" %>
<%
    Akun loggedUser = (Akun) session.getAttribute("loggedUser");
    if (loggedUser == null || !"user".equalsIgnoreCase(loggedUser.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
</head>
<body>
    <h1>Selamat Datang, <%= loggedUser.getNama() %>!</h1>
    <p>Ini halaman khusus user.</p>
</body>
</html>
