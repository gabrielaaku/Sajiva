package servlet;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import model.Admin;
import model.Akun;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
/**
 *
 * @author dinda salma
 */
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nama = request.getParameter("nama");
        String no_hp = request.getParameter("no_hp");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role"); 

        Akun akun = null;

        if ("admin".equalsIgnoreCase(role)) {
            akun = new Admin(nama, no_hp, username, password);
        } else if ("user".equalsIgnoreCase(role)) {
            akun = new User(nama, no_hp, username, password);
        }

        if (akun != null) {
            akun.register();
            HttpSession session = request.getSession();
            session.setAttribute("notif", "Register berhasil! Silakan login.");
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Error: Role tidak valid.");
        }
    }
}
