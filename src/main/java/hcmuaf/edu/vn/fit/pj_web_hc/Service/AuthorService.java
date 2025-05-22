
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

    //Đăng nhập
    public static AccountUsers checkLogin(String username, String password) {
        String sql = "select * from AccountUsers where userName=?";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) { //tránh SQL Injection
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            // stmt.setString(2, password);

            //ResultSet rs = stmt.executeQuery(); //Thực thi câu sql
            if (rs.next()) { //trả về thông tin người dùng
                String HashedPassword = rs.getString("passwordUser");
                if (HashedPassword.equals(hashPassword(password))) {
                    int role = rs.getInt("role"); //Lấy role từ csdl
                    return new AccountUsers(rs.getInt("userId"), rs.getString("userName"), HashedPassword, rs.getString("email"), role, rs.getDate("createAt"), rs.getString("avatarUrl"));
                } else {
                    System.out.println("Mật khẩu không đúng.");
                }
            } else {
                System.out.println("Không tìm thấy tài khoản đã nhập.");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // SỬA ĐỔI issuse1: Thêm kiểm tra username/email đã tồn tại
    public boolean isUsernameOrEmailExist(String username, String email) {
        String sql = "SELECT * FROM AccountUsers WHERE userName = ? OR email = ?";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, email);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return true;
        }
    }

    //Đổi avatar
    public static void updateUserAvatar(AccountUsers user) {
        String sql = "UPDATE accountusers SET avatarUrl = ? WHERE userId = ?";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getAvatarUrl());
            stmt.setInt(2, user.getUserId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //Kiểm tra mật khẩu nhập vào với mật khẩu gốc đã mã hóa
    public static boolean checkPassword(String oldPassword, String passwordUser) {
        return hashPassword(oldPassword).equals(passwordUser);
    }

    public static boolean updateUserPassword(AccountUsers user) {
        String sql = "UPDATE accountusers SET passwordUser = ? WHERE userId = ?";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getPasswordUser());
            stmt.setInt(2, user.getUserId());

            int rowsAffect = stmt.executeUpdate();
            return rowsAffect > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //Đăng ký
    public boolean register(String usernameR, String email, String passwordR) {
        String HPassword = hashPassword(passwordR); // Mã hóa mật khẩu
        if (HPassword == null) {
            return false; // Nếu mã hóa không thành công, trả về false
        }
        // SỬA ĐỔI: kiểm tra tồn tại
        if (isUsernameOrEmailExist(usernameR, email)) {
            return false;
        }

        String sql = "insert into AccountUsers (userName, email, passwordUser, role, createAt) values (?,?,?,?,?)";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, usernameR);
            stmt.setString(2, email);
            stmt.setString(3, HPassword);//Lưu mật khẩu đã mã hóa
            stmt.setInt(4, 0);

            Date currentTime = new Date(System.currentTimeMillis());
            stmt.setDate(5, currentTime);

            //lệnh update thêm ng dùng vào
            int rowsAffect = stmt.executeUpdate();  //insert trả về số lượng bản ghi đã cập nhật

            return rowsAffect > 0;//Kiểm tra bản ghi được chèn
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return false;
    }

    //Phương thức mã hóa mật khẩu băm bằng md5
    public static String hashPassword(String passwordR) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");

            byte[] hashedBytes = md.digest(passwordR.getBytes());

            // Chuyển đổi byte array thành chuỗi hexa
            StringBuffer sb = new StringBuffer();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));//Mỗi byte (b) được chuyển thành một cặp số hex (%02x đảm bảo luôn có 2 chữ số).
            }
            return sb.toString();  //Kết quả cuối cùng là một chuỗi 32 ký tự biểu diễn giá trị băm MD5.
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }


    public int getRole(HttpSession session) {
        AccountUsers user = (AccountUsers) session.getAttribute("user");
        if (user != null) {
            return user.getRole(); // Lấy vai trò từ đối tượng người dùng trong phiên
        }
        return -1;
    }
    public AccountUsers getUserByUsername(String username) {
        String sql = "SELECT * FROM AccountUsers WHERE userName=?";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new AccountUsers(
                        rs.getInt("userId"),
                        rs.getString("userName"),
                        rs.getString("passwordUser"),
                        rs.getString("email"),
                        rs.getInt("role"),
                        rs.getDate("createAt"),
                        rs.getString("avatarUrl")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}


