package model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author dinda salma
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Admin extends Akun{

    public Admin(String nama, String noHp, String username, String password) {
        super(nama, noHp, username, password, "admin");
    }    
    
    @Override
    public void register() {
        try {
            Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO akun (nama, no_hp, username, password, role) VALUES (?, ?, ?, ?, ?)"
            );
            stmt.setString(1, nama);
            stmt.setString(2, noHp);
            stmt.setString(3, username);
            stmt.setString(4, password);
            stmt.setString(5, role);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Akun login(String username, String password) {
        try {
            Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM akun WHERE username = ? AND password = ? AND role = 'admin'"
            );
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Admin(
                    rs.getString("nama"),
                    rs.getString("no_hp"),
                    rs.getString("username"),
                    rs.getString("password")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean tambahCafe(String nama, String alamat, String jamOperasional,
                              String menu, int harga, String fasilitas, String suasana) {
        try {
            Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO cafe (nama, alamat, jam_operasional, menu, harga, fasilitas, suasana, latitude, longitude) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
            );
            stmt.setString(1, nama);
            stmt.setString(2, alamat);
            stmt.setString(3, jamOperasional);
            stmt.setString(4, menu);
            stmt.setInt(5, harga);
            stmt.setString(6, fasilitas);
            stmt.setString(7, suasana);

            int affectedRows = stmt.executeUpdate();
            return affectedRows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
