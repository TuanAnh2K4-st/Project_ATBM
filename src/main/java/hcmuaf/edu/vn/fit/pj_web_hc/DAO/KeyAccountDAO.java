package hcmuaf.edu.vn.fit.pj_web_hc.DAO;

import hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.KeyAccount;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.KeyStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;

public class KeyAccountDAO {

    // Lấy key active theo userId, timeUp trả về dạng String yyyy-MM-dd
    public static KeyAccount getActiveKeyByUserId(int userId) {
        String sql = "SELECT * FROM keyaccount WHERE userId = ? AND status = ? LIMIT 1";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ps.setString(2, KeyStatus.active.name());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                KeyAccount key = new KeyAccount();
                key.setKeyId(rs.getInt("keyId"));
                key.setPublicKey(rs.getString("publicKey"));
                Date timeUpDate = rs.getDate("timeUp"); // kiểu java.sql.Date
                if (timeUpDate != null) {
                    key.setTimeUp(timeUpDate.toString()); // chuyển sang String yyyy-MM-dd
                } else {
                    key.setTimeUp(null);
                }
                key.setStatus(KeyStatus.valueOf(rs.getString("status")));
                key.setUserId(rs.getInt("userId"));
                return key;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; // Không có key active
    }

    // Thêm key mới, timeUp truyền vào dạng String yyyy-MM-dd
    public static boolean insertKey(KeyAccount key) {
        String sql = "INSERT INTO keyaccount (publicKey, timeUp, status, userId) VALUES (?, ?, ?, ?)";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, key.getPublicKey());
            // Chuyển String -> java.sql.Date
            if (key.getTimeUp() != null && !key.getTimeUp().isEmpty()) {
                ps.setDate(2, Date.valueOf(key.getTimeUp()));
            } else {
                ps.setDate(2, null);
            }
            ps.setString(3, key.getStatus().name());
            ps.setInt(4, key.getUserId());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // Đánh dấu khóa cũ là mất (lost) theo userId
    public static boolean markKeyAsLost(int userId) {
        String sql = "UPDATE keyaccount SET status = ? WHERE userId = ? AND status = ?";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, KeyStatus.lost.name());
            ps.setInt(2, userId);
            ps.setString(3, KeyStatus.active.name());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    // Lấy 1 KeyAccount theo keyId
    public static KeyAccount getKeyById(int keyId) {
        String sql = "SELECT * FROM keyaccount WHERE keyId = ?";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, keyId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                KeyAccount key = new KeyAccount();
                key.setKeyId(rs.getInt("keyId"));
                key.setPublicKey(rs.getString("publicKey"));
                Date timeUpDate = rs.getDate("timeUp");
                key.setTimeUp(timeUpDate != null ? timeUpDate.toString() : null);
                key.setStatus(KeyStatus.valueOf(rs.getString("status")));
                key.setUserId(rs.getInt("userId"));
                return key;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
