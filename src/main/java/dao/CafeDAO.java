/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author dinda salma
 */

import model.Cafe;
import model.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CafeDAO {
    public void save(Cafe cafe) {
        String sql = "INSERT INTO cafe (nama, alamat, jam_operasional, menu, harga, fasilitas, suasana, latitude, longitude) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, cafe.getNama());
            stmt.setString(2, cafe.getAlamat());
            stmt.setString(3, cafe.getJamOperasional());
            stmt.setString(4, cafe.getMenu());
            stmt.setString(5, cafe.getHarga());
            stmt.setString(6, cafe.getFasilitas());
            stmt.setString(7, cafe.getSuasana());
            stmt.setString(8, cafe.getLatitude()); 
            stmt.setString(9, cafe.getLongitude());

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Cafe> getAllCafe() {
        List<Cafe> cafes = new ArrayList<>();
        try {
            Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM cafe ORDER BY nama");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Cafe cafe = new Cafe(
                    rs.getString("nama"),
                    rs.getString("alamat"),
                    rs.getString("jam_operasional"),
                    rs.getString("menu"),
                    rs.getString("harga"),
                    rs.getString("fasilitas"),
                    rs.getString("suasana"),
                    rs.getString("latitude"),
                    rs.getString("longitude")
                       
                );
                cafes.add(cafe);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cafes;
    }
    
    public void deleteByNama(String nama) {
        String sql = "DELETE FROM cafe WHERE nama = ?";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, nama);
            stmt.executeUpdate();
            System.out.println("Berhasil menghapus café: " + nama);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Cafe> searchCafe(String keyword, String filterJam, String filterSuasana) {
        List<Cafe> cafes = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM cafe WHERE 1=1 ");
        boolean hasKeyword = keyword != null && !keyword.trim().isEmpty();
        boolean hasJam = filterJam != null && !filterJam.trim().isEmpty();
        boolean hasSuasana = filterSuasana != null && !filterSuasana.trim().isEmpty();

        if (hasKeyword) {
            sql.append("AND (nama LIKE ? OR alamat LIKE ? OR menu LIKE ?) ");
        }
        if (hasJam) {
            sql.append("AND jam_operasional = ? ");
        }
        if (hasSuasana) {
            sql.append("AND suasana = ? ");
        }

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            int idx = 1;
            if (hasKeyword) {
                String kw = "%" + keyword.trim() + "%";
                ps.setString(idx++, kw);
                ps.setString(idx++, kw);
                ps.setString(idx++, kw);
            }
            if (hasJam) {
                ps.setString(idx++, filterJam);
            }
            if (hasSuasana) {
                ps.setString(idx++, filterSuasana);
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Cafe c = new Cafe(
                        rs.getString("nama"),
                        rs.getString("alamat"),
                        rs.getString("jam_operasional"),
                        rs.getString("menu"),
                        rs.getString("harga"),
                        rs.getString("fasilitas"),
                        rs.getString("suasana"),
                        rs.getString("latitude"),
                        rs.getString("longitude")
                    );
                    cafes.add(c);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cafes;
    }
    
    public boolean updateCafe(String oldNama, Cafe updateCafe) {
        String sql = "UPDATE cafe SET nama=?, alamat=?, jam_operasional=?, menu=?, harga=?, fasilitas=?, suasana=?, latitude=?, longitude=? WHERE nama=?";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, updateCafe.getNama());
            stmt.setString(2, updateCafe.getAlamat());
            stmt.setString(3, updateCafe.getJamOperasional());
            stmt.setString(4, updateCafe.getMenu());
            stmt.setString(5, updateCafe.getHarga());
            stmt.setString(6, updateCafe.getFasilitas());
            stmt.setString(7, updateCafe.getSuasana());
            stmt.setString(8, updateCafe.getLatitude());
            stmt.setString(9, updateCafe.getLongitude());
            stmt.setString(10, oldNama);

            int updateRows = stmt.executeUpdate();
            return updateRows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public Cafe getCafeByNama(String nama) {
    String sql = "SELECT * FROM cafe WHERE nama = ?";
    try (Connection conn = DatabaseConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, nama);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return new Cafe(
                rs.getString("nama"),
                rs.getString("alamat"),
                rs.getString("jam_operasional"),
                rs.getString("menu"),
                rs.getString("harga"),
                rs.getString("fasilitas"),
                rs.getString("suasana"),
                rs.getString("latitude"),
                rs.getString("longitude")
            );
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null; // kalau tidak ketemu
}

    public boolean updateCafe(Cafe cafe) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }


}