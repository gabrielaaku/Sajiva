package dao;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import model.DatabaseConnection;
import model.Admin;
import model.Akun;
import model.User;
import java.sql.*;
/**
 *
 * @author dinda salma
 */
public class AkunDAO {
    public void save(Akun akun) {
        String sql = "INSERT INTO akun (nama, no_hp, username, password, role) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, akun.getNama());
            stmt.setString(2, akun.getNoHp());
            stmt.setString(3, akun.getUsername());
            stmt.setString(4, akun.getPassword());
            stmt.setString(5, akun.getRole());

            // Eksekusi query
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Akun getByUsername(String username) {
        String sql = "SELECT * FROM akun WHERE username = ?";
        Akun akun = null;

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String nama = rs.getString("nama");
                String noHp = rs.getString("no_hp");
                String password = rs.getString("password");
                String role = rs.getString("role");

                if ("admin".equals(role)) {
                    akun = new Admin(nama, noHp, username, password);
                } else {
                    akun = new User(nama, noHp, username, password);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return akun;
    }
}
