/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.CafeDAO;
import model.Cafe;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author dinda salma
 */
public class KelolaCafeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CafeDAO dao = new CafeDAO();
        List<Cafe> cafes = dao.getAllCafe();

        request.setAttribute("cafes", cafes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("kelolaCafe.jsp");
        dispatcher.forward(request, response);
    }
}
