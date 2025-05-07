package hcmuaf.edu.vn.fit.pj_web_hc.Service;

import jakarta.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.AccountUsers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

public class AuthorService {

    // Đăng nhập
    public static AccountUsers checkLogin(String username, String password) {
        String sql = "SELECT * FROM AccountUsers WHERE userName=?";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedHashedPassword = rs.getString("passwordUser");
                String inputHashed = hashPassword(password);

                System.out.println(">> Password nhập: " + password);
                System.out.println(">> Password băm: " + inputHashed);
                System.out.println(">> Password DB:  " + storedHashedPassword);

                if (storedHashedPassword.equalsIgnoreCase(inputHashed)) {
                    int role = rs.getInt("role");
                    return new AccountUsers(
                            rs.getInt("userId"),
                            rs.getString("userName"),
                            storedHashedPassword,
                            rs.getString("email"),
                            role,
                            rs.getDate("createAt"),
                            rs.getString("avatarUrl")
                    );
                } else {
                    System.out.println("⚠ Mật khẩu không đúng.");
                }
            } else {
                System.out.println("⚠ Không tìm thấy tài khoản.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Đăng ký
    public boolean register(String usernameR, String email, String passwordR) {
        String hashed = hashPassword(passwordR);
        if (hashed == null) return false;

        String sql = "INSERT INTO AccountUsers (userName, email, passwordUser, role, createAt) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, usernameR);
            stmt.setString(2, email);
            stmt.setString(3, hashed);
            stmt.setInt(4, 0);
            stmt.setDate(5, new Date(System.currentTimeMillis()));

            int rows = stmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) sb.append(String.format("%02x", b));
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static boolean checkPassword(String oldPassword, String passwordUser) {
        return hashPassword(oldPassword).equals(passwordUser);
    }

    public static void updateUserAvatar(AccountUsers user) {
        String sql = "UPDATE AccountUsers SET avatarUrl = ? WHERE userId = ?";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getAvatarUrl());
            stmt.setInt(2, user.getUserId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean updateUserPassword(AccountUsers user) {
        String sql = "UPDATE AccountUsers SET passwordUser = ? WHERE userId = ?";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getPasswordUser());
            stmt.setInt(2, user.getUserId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int getRole(HttpSession session) {
        AccountUsers user = (AccountUsers) session.getAttribute("user");
        return (user != null) ? user.getRole() : -1;
    }
}
