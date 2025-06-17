<%-- 
    Document   : editCafe
    Created on : 31 May 2025
    Author     : dinda salma
--%>

<%@ page import="java.sql.*, model.DatabaseConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String namaAwal = request.getParameter("nama_awal");
    String nama = "", alamat = "", jam = "", menu = "", harga = "", fasilitas = "", suasana = "", lat = "", lon = "";
    boolean submitted = request.getParameter("submit") != null;

    if (submitted) {
        namaAwal = request.getParameter("nama_awal");
        nama = request.getParameter("nama");
        alamat = request.getParameter("alamat");
        jam = request.getParameter("jam_operasional");
        menu = request.getParameter("menu");
        harga = request.getParameter("harga");
        fasilitas = request.getParameter("fasilitas");
        suasana = request.getParameter("suasana");
        lat = request.getParameter("latitude");
        lon = request.getParameter("longitude");

        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "UPDATE cafe SET nama=?, alamat=?, jam_operasional=?, menu=?, harga=?, fasilitas=?, suasana=?, latitude=?, longitude=? WHERE nama=?"
            );
            stmt.setString(1, nama);
            stmt.setString(2, alamat);
            stmt.setString(3, jam);
            stmt.setString(4, menu);
            stmt.setString(5, harga);
            stmt.setString(6, fasilitas);
            stmt.setString(7, suasana);
            stmt.setString(8, lat);
            stmt.setString(9, lon);
            stmt.setString(10, namaAwal);

            stmt.executeUpdate();
            stmt.close();
            conn.close();

            response.sendRedirect("kelolaCafe.jsp");
            return;
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (conn != null) conn.close();
        }
    } else {
        // Ambil data cafe pertama (karena cuma satu)
        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM cafe LIMIT 1"); // hanya ambil satu
            if (rs.next()) {
                nama = rs.getString("nama");
                alamat = rs.getString("alamat");
                jam = rs.getString("jam_operasional");
                menu = rs.getString("menu");
                harga = rs.getString("harga");
                fasilitas = rs.getString("fasilitas");
                suasana = rs.getString("suasana");
                lat = rs.getString("latitude");
                lon = rs.getString("longitude");
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("Error loading data: " + e.getMessage());
        } finally {
            if (conn != null) conn.close();
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
        <!-- simpan nama awal (sebagai identifier saat update) -->
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
            <input type="text" id="jam_operasional" name="jam_operasional" value="<%= jam %>" 
                class="w-full border border-gray-300 rounded px-3 py-2" required />
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
            <input type="text" id="suasana" name="suasana" value="<%= suasana %>" 
                class="w-full border border-gray-300 rounded px-3 py-2" required />
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

