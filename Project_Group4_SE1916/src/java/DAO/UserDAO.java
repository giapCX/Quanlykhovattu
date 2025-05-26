/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Role;
import Model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Userdao {
    private Connection conn;

    public Userdao() {
    }

    
    public Userdao(Connection conn) {
        this.conn = conn;
    }

    public List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "SELECT u.user_id, u.username, u.password, u.full_name, u.email, u.phone, u.status, r.role_id, r.role_name " +
                     "FROM users u " +
                     "JOIN roles r ON u.role_id = r.role_id";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setStatus(rs.getString("status"));

                Role role = new Role();
                role.setRoleId(rs.getInt("role_id"));
                role.setRoleName(rs.getString("role_name"));
                user.setRole(role);

                users.add(user);
            }
        }
        return users;
    }
    
    public User getUserByUsername(String username) {
        User user = new User();
        String sql = "SELECT * FROM [User] WHERE username = ?";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setStatus(rs.getString("status"));
                user.setUsername(username);
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Userdao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
