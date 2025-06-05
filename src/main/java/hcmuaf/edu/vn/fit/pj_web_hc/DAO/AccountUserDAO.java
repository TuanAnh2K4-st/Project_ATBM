package hcmuaf.edu.vn.fit.pj_web_hc.DAO;

import hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.AccountUsers;

import java.sql.*;
import java.util.*;

public class AccountUserDAO {

    // Lấy user theo ID
    public static AccountUsers getUserById(int id) {
        String sql = "SELECT * FROM accountusers WHERE userId = ?";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                AccountUsers user = new AccountUsers();
                user.setUserId(rs.getInt("userId"));
                user.setUserName(rs.getString("userName"));
                user.setEmail(rs.getString("email"));
                // Thêm các trường khác nếu cần
                return user;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Lấy nhiều user theo danh sách ID
    public static Map<Integer, AccountUsers> getUsersByIds(Set<Integer> userIds) {
        Map<Integer, AccountUsers> result = new HashMap<>();

        if (userIds == null || userIds.isEmpty()) return result;

        String placeholders = String.join(",", Collections.nCopies(userIds.size(), "?"));
        String sql = "SELECT * FROM accountusers WHERE userId IN (" + placeholders + ")";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            int index = 1;
            for (Integer id : userIds) {
                ps.setInt(index++, id);
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountUsers user = new AccountUsers();
                user.setUserId(rs.getInt("userId"));
                user.setUserName(rs.getString("userName"));
                user.setEmail(rs.getString("email"));
                // Thêm các trường khác nếu có
                result.put(user.getUserId(), user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
