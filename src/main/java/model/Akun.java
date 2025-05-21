package model;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author dinda salma
 */
public abstract class Akun {
    protected String nama;
    protected String noHp;
    protected String username;
    protected String password;
    protected String role;
    
    public Akun(String nama, String noHp, String username, String password, String role) {
        this.nama = nama;
        this.noHp = noHp;
        this.username = username;
        this.password = password;
        this.role = role;
    }
    
    public abstract void register();
    public abstract Akun login(String username, String password);

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getNoHp() {
        return noHp;
    }

    public void setNoHp(String noHp) {
        this.noHp = noHp;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
