/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.CafeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author dinda salma
 */
public class HapusCafeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nama = request.getParameter("id");

        if (nama != null && !nama.trim().isEmpty()) {
            CafeDAO dao = new CafeDAO();
            dao.deleteByNama(nama);
        }

        response.sendRedirect("kelolaCafe.jsp"); // kembali ke halaman utama
    }
}
