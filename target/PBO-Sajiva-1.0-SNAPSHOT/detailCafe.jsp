<%-- 
    Document   : detailCafe
    Created on : 31 May 2025, 12.45.24
    Author     : dinda salma
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Cafe" %>
<%
    Cafe cafe = (Cafe) request.getAttribute("cafe");
    if (cafe == null) {
        out.println("Data cafe tidak tersedia.");
        return;
    }
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Detail Café - SAJIVA</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f7fafc;
        }
        .btn-back {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
            border-radius: 8px;
        }
        .btn-back:hover {
            background-color: #c3e6cb;
            color: #0b2e13;
        }
        h1, h5 {
            color: #155724;
        }
        .detail-label {
            font-weight: 600;
            color: #155724;
        }
        iframe {
            border-radius: 8px;
            border: none;
        }
    </style>
</head>
<body class="p-4">

<div class="container shadow-sm bg-white rounded p-4">
    <h1 class="mb-4 fw-bold" style="font-size: 2rem; color: #155724;">
        <%= cafe.getNama() %>
    </h1>


    <div class="row mb-3">
        <div class="col-md-4 detail-label">Alamat:</div>
        <div class="col-md-8">
            <div word-wrap: break-word;">
                <%= cafe.getAlamat() %>
            </div>

            <% if (cafe.getLatitude() != null && cafe.getLongitude() != null) { %>
                <iframe
                    width="100%"
                    height="300"
                    loading="lazy"
                    allowfullscreen
                    referrerpolicy="no-referrer-when-downgrade"
                    src="https://maps.google.com/maps?q=<%= cafe.getLatitude() %>,<%= cafe.getLongitude() %>&z=15&output=embed">
                </iframe>
            <% } else { %>
                <span class="text-danger">Koordinat tidak tersedia</span>
            <% } %>
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-md-4 detail-label">Jam Operasional:</div>
        <div class="col-md-8"><%= cafe.getJamOperasional() %></div>
    </div>

    <div class="row mb-3">
        <div class="col-md-4 detail-label">Menu:</div>
        <div class="col-md-8"><%= cafe.getMenu() %></div>
    </div>

    <div class="row mb-3">
        <div class="col-md-4 detail-label">Range Harga:</div>
        <div class="col-md-8"><%= cafe.getHarga() %></div>
    </div>

    <div class="row mb-3">
        <div class="col-md-4 detail-label">Fasilitas:</div>
        <div class="col-md-8"><%= cafe.getFasilitas() %></div>
    </div>

    <div class="row mb-3">
        <div class="col-md-4 detail-label">Suasana:</div>
        <div class="col-md-8"><%= cafe.getSuasana() %></div>
    </div>
    
<hr class="my-5">

<!-- Form Ulasan -->
<div class="kritik-saran-form p-3 bg-light rounded shadow-sm">
    <h3 class="mb-3" style="color: #155724;">Kirim Ulasan untuk <%= cafe.getNama() %></h3>

    <form method="post" action="UlasanServlet">
        <input type="hidden" name="cafe" value="<%= cafe.getNama() %>" />
        <div class="mb-3">
            <label for="nama" class="form-label detail-label">Nama Anda:</label>
            <input type="text" id="nama" name="nama" class="form-control" required />
        </div>
        <div class="mb-3">
            <label for="pesan" class="form-label detail-label">Ulasan:</label>
            <textarea id="pesan" name="pesan" class="form-control" rows="4" required></textarea>
        </div>
        <button type="submit" class="btn btn-back mt-4">Kirim</button>
    </form>
</div>

<hr class="my-5">

<div class="daftar-kritik-saran">
    <h4 style="color: #155724;">Ulasan Sebelumnya</h4>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection conn = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/sajiva", "root", "123");
            String sql = "SELECT nama, pesan FROM kritik_saran WHERE cafe = ?";
            java.sql.PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cafe.getNama());
            java.sql.ResultSet rs = ps.executeQuery();

            boolean adaData = false;
            while (rs.next()) {
                adaData = true;
    %>
                <div class="mb-3 p-3 border rounded">
                    <strong><%= rs.getString("nama") %></strong><br/>
                    <p><%= rs.getString("pesan") %></p>
                </div>
                
    <%
            }
            if (!adaData) {
    %>
            <p class="text-muted">Belum ada ulasan untuk café ini.</p>
    <%
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error mengambil ulasan: " + e.getMessage() + "</p>");
        }
    %>
</div>

<a href="CariCafeServlet" class="btn btn-back mt-4">Kembali ke Cari Café</a>

</div>

</body>
</html>
