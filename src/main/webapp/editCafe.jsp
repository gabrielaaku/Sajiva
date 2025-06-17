<%-- 
    Document   : editCafe
    Created on : 31 May 2025
    Author     : dinda salma
--%>

<%@ page import="java.sql.*, model.Cafe, dao.CafeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    CafeDAO cafeDAO = new CafeDAO();

    String nama = "", alamat = "", jam = "", menu = "", harga = "", fasilitas = "", suasana = "", lat = "", lon = "";
    boolean submitted = request.getParameter("submit") != null;

    if (submitted) {
        nama = request.getParameter("nama");
        alamat = request.getParameter("alamat");
        jam = request.getParameter("jam_operasional");
        menu = request.getParameter("menu");
        harga = request.getParameter("harga");
        fasilitas = request.getParameter("fasilitas");
        suasana = request.getParameter("suasana");
        lat = request.getParameter("latitude");
        lon = request.getParameter("longitude");

        Cafe updateCafe = new Cafe(id, nama, alamat, jam, menu, harga, fasilitas, suasana, lat, lon);
        boolean success = cafeDAO.updateCafeById(id, updateCafe);

        if (success) {
            response.sendRedirect("kelolaCafe.jsp");
            return;
        } else {
            out.println("Gagal update data");
        }

    } else {
        Cafe cafe = cafeDAO.getCafeById(id);
        if (cafe != null) {
            nama = cafe.getNama();
            alamat = cafe.getAlamat();
            jam = cafe.getJamOperasional();
            menu = cafe.getMenu();
            harga = cafe.getHarga();
            fasilitas = cafe.getFasilitas();
            suasana = cafe.getSuasana();
            lat = cafe.getLatitude();
            lon = cafe.getLongitude();
        }
    }
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Edit Data Café</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-gray-100 p-8">

<div class="max-w-2xl mx-auto bg-white p-6 rounded-lg shadow-lg">
    <h2 class="text-2xl font-semibold mb-6 text-[#155724] text-center">Edit Data Café</h2>

    <form method="post" class="space-y-4">
        <input type="hidden" name="nama_awal" value="<%= nama %>" />

        <div>
            <label class="block font-semibold text-gray-700 mb-1" for="nama">Nama Café</label>
            <input type="text" id="nama" name="nama" value="<%= nama %>" 
                class="w-full border border-gray-300 rounded px-3 py-2" required />
        </div>

        <div>
            <label class="block font-semibold text-gray-700 mb-1" for="alamat">Alamat</label>
            <input type="text" id="alamat" name="alamat" value="<%= alamat %>" 
                class="w-full border border-gray-300 rounded px-3 py-2" required />
        </div>

        <div>
            <label class="block font-semibold text-gray-700 mb-1" for="jam_operasional">Jam Operasional</label>
            <select id="jam_operasional" name="jam_operasional" 
                class="w-full border border-gray-300 rounded px-3 py-2" required>
                <option value="">Pilih Jam Operasional</option>
                <option value="10:00 - 22:00" <%= "10:00 - 22:00".equals(jam) ? "selected" : "" %>>10:00 - 22:00</option>
                <option value="09:00 - 00:00" <%= "09:00 - 00:00".equals(jam) ? "selected" : "" %>>09:00 - 00:00</option>
                <option value="24jam" <%= "24jam".equals(jam) ? "selected" : "" %>>24 Jam</option>
            </select>
        </div>

        <div>
            <label class="block font-semibold text-gray-700 mb-1" for="menu">Menu</label>
            <input type="text" id="menu" name="menu" value="<%= menu %>" 
                class="w-full border border-gray-300 rounded px-3 py-2" required />
        </div>

        <div>
            <label class="block font-semibold text-gray-700 mb-1" for="harga">Harga</label>
            <input type="text" id="harga" name="harga" value="<%= harga %>" 
                class="w-full border border-gray-300 rounded px-3 py-2" required />
        </div>

        <div>
            <label class="block font-semibold text-gray-700 mb-1" for="fasilitas">Fasilitas</label>
            <input type="text" id="fasilitas" name="fasilitas" value="<%= fasilitas %>" 
                class="w-full border border-gray-300 rounded px-3 py-2" />
        </div>

        <div>
            <label class="block font-semibold text-gray-700 mb-1" for="suasana">Suasana</label>
            <select id="suasana" name="suasana" 
                class="w-full border border-gray-300 rounded px-3 py-2" required>
                <option value="">Pilih Suasana</option>
                <option value="cozy" <%= "cozy".equalsIgnoreCase(suasana) ? "selected" : "" %>>Cozy</option>
                <option value="modern" <%= "modern".equalsIgnoreCase(suasana) ? "selected" : "" %>>Modern</option>
                <option value="outdoor" <%= "outdoor".equalsIgnoreCase(suasana) ? "selected" : "" %>>Outdoor</option>
            </select>
        </div>

        <div>
            <label class="block font-semibold text-gray-700 mb-1" for="latitude">Latitude</label>
            <input type="text" id="latitude" name="latitude" value="<%= lat %>" 
                class="w-full border border-gray-300 rounded px-3 py-2" required />
        </div>

        <div>
            <label class="block font-semibold text-gray-700 mb-1" for="longitude">Longitude</label>
            <input type="text" id="longitude" name="longitude" value="<%= lon %>" 
                class="w-full border border-gray-300 rounded px-3 py-2" required />
        </div>

        <button type="submit" name="submit" class="btn btn-success w-100">Simpan</button>

    </form>
</div>

</body>
</html>

