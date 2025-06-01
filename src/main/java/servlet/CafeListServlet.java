/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.CafeDAO;
import model.Cafe;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author dinda salma
 */
@WebServlet("/cafe-list")
public class CafeListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CafeDAO dao = new CafeDAO();
        List<Cafe> cafes = dao.getAllCafe(); // Sesuai method kamu
        request.setAttribute("cafes", cafes);
        request.getRequestDispatcher("/cariCafe.jsp").forward(request, response);
    }
}
