<%-- 
    Document   : cariCafe
    Created on : 22 May 2025, 14.11.17
    Author     : dinda salma
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Cafe" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Cari Café - SAJIVA</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f7fafc;
        }
        .form-select, .form-control {
            border-radius: 8px;
        }
        .btn-green {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
        .btn-green:hover {
            color: #0b2e13;
            background-color: #c3e6cb;
            border-color: #b1dfbb;
        }
        h1, h5 {
            color: #155724;
        }
    </style>
</head>
<body class="p-4">

<%
    String keyword = request.getParameter("keyword");
    String harga = request.getParameter("harga");
    String suasana = request.getParameter("suasana");
    
    
    boolean sudahCari = (keyword != null && !keyword.isEmpty()) || 
                        (harga != null && !harga.isEmpty()) || 
                        (suasana != null && !suasana.isEmpty());

    List<Cafe> daftarCafe = (List<Cafe>) request.getAttribute("daftarCafe");
%>

<!-- Header Pencarian -->
<section class="py-5 rounded mb-5 shadow-sm bg-white">
    <div class="container text-center">
        <h1 class="text-4xl font-semibold mb-3 tracking-wide">Temukan Café Favoritmu</h1>
        <p class="text-md mb-4">Cari berdasarkan nama, harga, atau suasana</p>

        <form method="get" action="CariCafeServlet" class="row g-3 justify-content-center">
            <div class="col-md-4">
                <input type="text" name="keyword" class="form-control" placeholder="Nama cafe..."
                       value="<%= keyword != null ? keyword : "" %>" />
            </div>

            <div class="col-md-2">
                <select name="harga" class="form-select">
                    <option value="">Harga</option>
                    <option value="murah" <%= "murah".equals(harga) ? "selected" : "" %>>Murah</option>
                    <option value="sedang" <%= "sedang".equals(harga) ? "selected" : "" %>>Sedang</option>
                    <option value="mahal" <%= "mahal".equals(harga) ? "selected" : "" %>>Mahal</option>
                </select>
            </div>
            <div class="col-md-2">
                <select name="suasana" class="form-select">
                    <option value="">Suasana</option>
                    <option value="cozy" <%= "cozy".equals(suasana) ? "selected" : "" %>>Cozy</option>
                    <option value="modern" <%= "modern".equals(suasana) ? "selected" : "" %>>Modern</option>
                    <option value="outdoor" <%= "outdoor".equals(suasana) ? "selected" : "" %>>Outdoor</option>
                </select>
            </div>

            <div class="col-auto">
                <button type="submit" class="btn btn-green">Cari</button>
            </div>
        </form>
    </div>
</section>

<!-- Hasil Pencarian -->
<div class="container">
<%
    if (daftarCafe == null || daftarCafe.isEmpty()) {
        if (sudahCari) {
%>
    <div class="text-center text-muted mt-4">
        <p>🙁 Tidak ada hasil yang ditemukan. Coba kata kunci lain.</p>
    </div>
<%
        } else {
%>
    <div class="text-center text-muted mt-4">
        <p>Silahkan cari cafe sesuai keinginan.</p>
    </div>
<%
        }
    } else {
%>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <% for (Cafe cafe : daftarCafe) { %>
        <div class="col">
            <div class="card h-100 shadow-sm">
                <div class="card-body">
                    <h5 class="cext-4xl font-semibold mb-3 tracking-wide""><%= cafe.getNama() %></h5>
                    <p class="card-text text-muted" style="font-size: 0.95rem;">
                        <strong>Alamat:</strong> <%= cafe.getAlamat() %><br/>
                        <strong>Harga:</strong> <%= cafe.getHarga() %><br/>
                        <strong>Suasana:</strong> <%= cafe.getSuasana() %><br/>
                        <strong>Jam Buka:</strong> <%= cafe.getJamOperasional() %>
                    </p>
                </div>
            </div>
        </div>
        <% } %>
    </div>
<% } %>
</div>

</body>
</html>







