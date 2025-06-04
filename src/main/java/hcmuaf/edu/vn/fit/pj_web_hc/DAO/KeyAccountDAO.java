package hcmuaf.edu.vn.fit.pj_web_hc.DAO;

import hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.KeyAccount;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.KeyStatus;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class KeyAccountDAO {
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
                key.setTimeUp(rs.getString("timeUp"));
                key.setStatus(KeyStatus.active);
                key.setUserId(rs.getInt("userId"));
                return key;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // Không có key active
    }
}
