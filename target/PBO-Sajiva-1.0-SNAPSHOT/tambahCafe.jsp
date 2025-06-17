<%-- 
    Document   : tambahCafe
    Created on : 21 May 2025, 19.18.04
    Author     : dinda salma
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <title>Tambah Café - SAJIVA</title>
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
                    <a href="tambahCafe.jsp" class="flex items-center px-4 py-3 text-sm text-white bg-success rounded-lg">
                        <i class="fas fa-plus mr-3"></i> Tambah Café
                    </a>
                    <a href="kelolaCafe.jsp" class="flex items-center px-4 py-3 text-sm text-white text-gray-300 hover:text-white hover:bg-stone-700 rounded-lg">
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
        <h2 class="text-2xl font-bold text-stone-800 mb-4">Tambah Café Baru</h2>
        <p class="text-gray-600 mb-6">Masukkan informasi café baru ke sistem.</p>

        <% String message = (String) request.getAttribute("message"); 
           if (message != null) { %>
            <div class="alert alert-info mb-4"><%= message %></div>
        <% } %>

        <form method="post" action="TambahCafeServlet" class="bg-white p-6 rounded-lg shadow-lg max-w-2xl" ">
            <div class="grid grid-cols-1 gap-4">
                <div>
                    <label class="block text-gray-700 font-semibold">Nama Café</label>
                    <input type="text" name="nama" class="w-full border p-2 rounded" placeholder="Cafe..." required />
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold">Alamat</label>
                    <input type="text" name="alamat" class="w-full border p-2 rounded" placeholder="Jl.xxxx" required />
                </div>
                
                <div>
                    <label class="block text-gray-700 font-semibold">Latitude</label>
                    <input type="text" name="latitude" class="w-full border p-2 rounded" placeholder="-6.972006" required />
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold">Longitude</label>
                    <input type="text" name="longitude" class="w-full border p-2 rounded" placeholder="107.636273" required />
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold">Jam Operasional</label>
                    <select name="jam_operasional" class="w-full border p-2 rounded" required>
                        <option value="">Pilih Jam Operasional</option>
                        <option value="10:00 - 22:00">10:00 - 22:00</option>
                        <option value="09:00 - 00:00">09:00 - 00:00</option>
                        <option value="24 jam">24 Jam</option>
                    </select>
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold">Menu (nama menu) </label>
                    <input type="text" name="menu" class="w-full border p-2 rounded" placeholder="Kopi, Roti" required />
                </div>

                <div>
                    <label class="block text-gray-700 font-semibold">Range Harga</label>
                    <input type="text" name="harga" class="w-full border p-2 rounded" placeholder="Contoh: 20.000 - 50.000"required />
                </div>
                
                <div>
                    <label class="block text-gray-700 font-semibold">Fasilitas</label>
                    <input type="text" name="fasilitas" class="w-full border p-2 rounded" placeholder="WiFi, Stop kontak, dll" />
                </div>
                
                <div>
                    <label class="block text-gray-700 font-semibold">Suasana</label>
                    <select name="suasana" class="w-full border p-2 rounded" required>
                        <option value="">Pilih suasana</option>
                        <option value="cozy">Cozy</option>
                        <option value="modern">Modern</option>
                        <option value="outdoor">Outdoor</option>
                    </select>
                </div>

                <div class="mt-4">
                    <button type="submit" class="w-full btn btn-success">Tambah Café</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>

