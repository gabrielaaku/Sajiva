/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author dinda salma
 */
@WebServlet("/KritikSaranServlet")
public class KritikSaranServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nama = request.getParameter("nama");
        String pesan = request.getParameter("pesan");
        String cafe = request.getParameter("cafe");

        // Simpan ke DB
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sajiva", "root", "123");
            String sql = "INSERT INTO kritik_saran (cafe, nama, pesan) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cafe);
            ps.setString(2, nama);
            ps.setString(3, pesan);
            ps.executeUpdate();
            ps.close();
            conn.close();
            
            response.sendRedirect("DetailCafeServlet?nama=" + java.net.URLEncoder.encode(cafe, "UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Gagal menyimpan kritik dan saran: " + e.getMessage());
        }
    }
}
