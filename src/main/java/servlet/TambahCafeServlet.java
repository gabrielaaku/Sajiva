/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.CafeDAO;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cafe;

/**
 *
 * @author dinda salma
 */
public class TambahCafeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        

        String nama = request.getParameter("nama");
        String alamat = request.getParameter("alamat");
        String jamOperasional = request.getParameter("jam_operasional");
        String menu = request.getParameter("menu");
        String harga = request.getParameter("harga");
        String fasilitas = request.getParameter("fasilitas");
        String suasana = request.getParameter("suasana");
        String latitude = request.getParameter("latitude");
        String longitude = request.getParameter("longitude");
        
        HttpSession session = request.getSession();
        Object loggedUser = session.getAttribute("loggedUser");

        Cafe cafe = new Cafe(nama, alamat, jamOperasional, menu, harga, fasilitas, suasana, latitude, longitude);
        CafeDAO dao = new CafeDAO();
        dao.save(cafe);

        request.setAttribute("message", "Café berhasil ditambahkan!");
        request.getRequestDispatcher("tambahCafe.jsp").forward(request, response);
    }

}
