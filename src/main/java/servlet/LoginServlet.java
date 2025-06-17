package servlet;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import dao.AkunDAO;
import model.Akun;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
/**
 *
 * @author dinda salma
 */
public class LoginServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AkunDAO akunDAO = new AkunDAO();
        Akun akun = akunDAO.getByUsername(username);
        
        if (akun != null && akun.getPassword().equals(password)) {
            request.getSession().setAttribute("loggedUser", akun);
            if ("admin".equalsIgnoreCase(akun.getRole())) {
                response.sendRedirect("tambahCafe.jsp");
            } else {
                response.sendRedirect("cariCafe.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
