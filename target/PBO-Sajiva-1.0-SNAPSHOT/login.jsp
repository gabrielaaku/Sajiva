<%-- 
    Document   : login
    Created on : 20 Apr 2025, 18.10.26
    Author     : dinda salma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>SAJIVA - Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
  />
</head>
<body class="bg-light">

  <div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow-sm" style="width: 350px;">
      <div class="card-body">
        <h3 class="card-title text-center mb-4">SAJIVA Login</h3>
        
        <!-- Error Message -->
        <% 
            String error = request.getParameter("error");
            if ("1".equals(error)) {
        %>
        <div class="alert alert-danger" role="alert">
            Username atau password salah. Silakan coba lagi.
        </div>
        <% } %>

        <form action="LoginServlet" method="post" id="loginForm">
          <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-user"></i></span>
              <input type="text" class="form-control" id="username" name="username" placeholder="username" required />
            </div>
          </div>

          <div class="mb-3">
            <label for="password" class="form-label">Kata Sandi</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-lock"></i></span>
              <input type="password" class="form-control" id="password" name="password" placeholder="••••••••" required />
            </div>
          </div>

          <button type="submit" class="btn btn-success w-100">
            <i class="fas fa-sign-in-alt me-2"></i>Masuk
          </button>
        </form>

        <p class="text-center mt-3 mb-0">
          Belum punya akun?
          <a href="register.jsp" class="link-success">Daftar di sini</a>
        </p>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

