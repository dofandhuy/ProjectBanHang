/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;


public class Account {
    private int id;
    private String user_name;
    private String email;
    private String password;
    private String isAdmin;

    public Account() {
    }

    public Account(int id, String user_name, String email, String password, String isAdmin) {
        this.id = id;
        this.user_name = user_name;
        this.email = email;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    public Account(String user_name) {
        this.user_name=user_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(String isAdmin) {
        this.isAdmin = isAdmin;
    }
    
}
