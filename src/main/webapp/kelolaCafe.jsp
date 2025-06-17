<%-- 
    Document   : kelolaCafe
    Created on : 21 May 2025, 21.27.02
    Author     : dinda salma
--%>

<%@ page import="java.util.*, model.Cafe, dao.CafeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Kelola Café - SAJIVA</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <!-- Sidebar -->
    <div class="hidden md:flex md:flex-shrink-0">
        <div class="flex flex-col w-64 bg-stone-800">
            <div class="flex items-center justify-center h-16 bg-stone-900">
                <h1 class="text-white font-bold text-xl">SAJIVA ADMIN</h1>
            </div>
            <div class="px-4 py-4">
                <nav class="space-y-2">
                    <a href="tambahCafe.jsp" class="flex items-center px-4 py-3 text-sm text-gray-300 hover:text-white hover:bg-stone-700 rounded-lg">
                        <i class="fas fa-plus mr-3"></i> Tambah Café
                    </a>
                    <a href="kelolaCafe.jsp" class="flex items-center px-4 py-3 text-sm text-white bg-success rounded-lg">
                        <i class="fas fa-coffee mr-3"></i> Kelola Café
                    </a>
                    
                    <a href="LogoutServlet" class="flex items-center px-4 py-3 text-sm text-red-400 hover:text-white hover:bg-red-600 rounded-lg">
                        <i class="fas fa-sign-out-alt mr-3"></i> Keluar
                    </a>
                </nav>
            </div>
        </div>
    </div>

    <div class="flex-1 p-8 overflow-y-auto">
        <h2 class="text-2xl font-bold text-stone-800 mb-4">Daftar Café</h2>

        <%
            CafeDAO cafeDAO = new CafeDAO();
            List<Cafe> daftarCafe = cafeDAO.getAllCafe();
        %>

        <table class="table table-bordered table-striped bg-white rounded shadow">
            <thead class="table-success">
                <tr>
                    <th>Nama</th>
                    <th>Alamat</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                    <th>Jam Operasional</th>
                    <th>Menu</th>
                    <th>Range Harga</th>
                    <th>Fasilitas</th>
                    <th>Suasana</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Cafe c : daftarCafe) {
                    String lat = c.getLatitude() != null ? c.getLatitude() : "0";
                    String lng = c.getLongitude() != null ? c.getLongitude() : "0";
                %>
                <tr>
                    <td><%= c.getNama() %></td>
                    <td>
                        <div style="max-width: 300px; word-wrap: break-word;">
                            <%= c.getAlamat() %>
                        </div>
                        <% if (c.getLatitude() != null && c.getLongitude() != null) { %>
                            <iframe
                                width="250"
                                height="150"
                                style="border:0;"
                                loading="lazy"
                                allowfullscreen
                                referrerpolicy="no-referrer-when-downgrade"
                                accesskey="" src="https://maps.google.com/maps?q=<%= c.getLatitude() %>,<%= c.getLongitude() %>&z=15&output=embed">
                            </iframe>
                        <% } else { %>
                            <span class="text-danger">Koordinat tidak tersedia</span>
                        <% } %>
                    </td>
                    <td><%= lat %></td>
                    <td><%= lng %></td>
                    <td><%= c.getJamOperasional() %></td>
                    <td><%= c.getMenu() %></td>
                    <td>Rp <%= c.getHarga() %></td>
                    <td><%= c.getFasilitas() %></td>
                    <td><%= c.getSuasana() %></td>
                    
                    <td>
                        <a href="editCafe.jsp?id=<%= c.getId() %>" class="btn btn-warning btn-sm">Edit</a>

                        <a href="HapusCafeServlet?id=<%= c.getNama() %>" class="btn btn-danger btn-sm" onclick="return confirm('Yakin hapus café ini?')">Hapus</a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

