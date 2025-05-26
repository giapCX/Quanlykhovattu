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

    public List<User> getAllUsersWithRoles() throws SQLException {
        List<User> users = new ArrayList<>();
        String sql = "SELECT u.*, r.role_id, r.role_name "
                + "FROM Users u "
                + "JOIN UserRoles ur ON u.user_id = ur.user_id "
                + "JOIN Roles r ON ur.role_id = r.role_id";

        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setFullName(rs.getString("full_name"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone_number"));
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

    public void updateUserRoleAndStatus(int userId, int roleId, String status) throws SQLException {
        // Cập nhật status
        String updateUserSql = "UPDATE Users SET status = ? WHERE user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(updateUserSql)) {
            stmt.setString(1, status);
            stmt.setInt(2, userId);
            stmt.executeUpdate();
        }

        // Cập nhật role (có thể dùng cách đơn giản: xóa rồi thêm)
        String deleteRoleSql = "DELETE FROM UserRoles WHERE user_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(deleteRoleSql)) {
            stmt.setInt(1, userId);
            stmt.executeUpdate();
        }

        String insertRoleSql = "INSERT INTO UserRoles(user_id, role_id) VALUES (?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(insertRoleSql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, roleId);
            stmt.executeUpdate();
        }
    }

    public User getUserById(int userId) throws SQLException {
        String sql = "SELECT u.*, r.role_id, r.role_name FROM Users u "
                + "JOIN UserRoles ur ON u.user_id = ur.user_id "
                + "JOIN Roles r ON ur.role_id = r.role_id WHERE u.user_id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setUserId(rs.getInt("user_id"));
                    user.setUsername(rs.getString("username"));
                    user.setFullName(rs.getString("full_name"));
                    user.setAddress(rs.getString("address"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone_number"));
                    user.setStatus(rs.getString("status"));

                    Role role = new Role();
                    role.setRoleId(rs.getInt("role_id"));
                    role.setRoleName(rs.getString("role_name"));
                    user.setRole(role);

                    return user;
                }
            }
        }
        return null;
    }

    public void insertUserWithRole(User user, int roleId) throws SQLException {
        String insertUserSql = "INSERT INTO Users (username, password_hash, full_name, address, email, phone_number, date_of_birth, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(insertUserSql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getFullName());
            stmt.setString(4, user.getAddress());
            stmt.setString(5, user.getEmail());
            stmt.setString(6, user.getPhone());
            if (user.getDateOfBirth() != null && !user.getDateOfBirth().isEmpty()) {
                stmt.setDate(7, java.sql.Date.valueOf(user.getDateOfBirth()));
            } else {
                stmt.setNull(7, java.sql.Types.DATE);
            }
            stmt.setString(8, user.getStatus());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int newUserId = generatedKeys.getInt(1);

                    // Gán role cho user mới
                    String insertRoleSql = "INSERT INTO UserRoles (user_id, role_id) VALUES (?, ?)";
                    try (PreparedStatement stmtRole = conn.prepareStatement(insertRoleSql)) {
                        stmtRole.setInt(1, newUserId);
                        stmtRole.setInt(2, roleId);
                        stmtRole.executeUpdate();
                    }
                } else {
                    throw new SQLException("Creating user failed, no ID obtained.");
                }
            }
        }
    }
}
