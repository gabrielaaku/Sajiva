<%-- 
    Document   : register
    Created on : 20 Apr 2025, 18.10.07
    Author     : dinda salma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Registrasi SAJIVA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 bg-white p-4 rounded shadow">
            <h3 class="mb-4 text-center">Form Registrasi SAJIVA</h3>
            <form action="register" method="post">
                <!-- Nama -->
                <div class="mb-3">
                    <label for="nama" class="form-label">Nama:</label>
                    <input type="text" id="nama" name="nama" class="form-control" required placeholder="Nama" />
                </div>
                <!-- Nomor HP -->
                <div class="mb-3">
                    <label for="nohp" class="form-label">Nomor HP:</label>
                    <input type="tel" id="nohp" name="nohp" class="form-control" pattern="[0-9]+" required placeholder="08xxxxxxxxxx"/>
                </div>
                <!-- Username -->
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" id="username" name="username" class="form-control" required placeholder="username123" />
                </div>
                <!-- Password -->
                <div class="mb-3">
                    <label for="password" class="form-label">Kata Sandi:</label>
                    <input type="password" id="password" name="password" class="form-control" required placeholder="••••••••" />
                </div>
                <!-- Role -->
                <div class="mb-3">
                    <label for="role" class="form-label">Pilih Role:</label>
                    <select id="role" name="role" class="form-select" required>
                        <option value="user" selected>User</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-success w-100">Daftar</button>
                <div class="mt-3 text-center">
                    <a href="login.jsp">Sudah punya akun? Masuk di sini</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>



