package hcmuaf.edu.vn.fit.pj_web_hc.Model;

import hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

public class AccountUpgrades {
    private int upgradeId ;
    private UpgradeStatus upgradeStatus ;
    private String requestReason ;
    private Timestamp requestedAt ;
    private Timestamp respondAt  ;
    private String imageUp;
    private int userId;

    public int getUpgradeId() {
        return upgradeId;
    }

    public void setUpgradeId(int upgradeId) {
        this.upgradeId = upgradeId;
    }

    public UpgradeStatus getUpgradeStatus() {
        return upgradeStatus;
    }

    public void setUpgradeStatus(UpgradeStatus upgradeStatus) {
        this.upgradeStatus = upgradeStatus;
    }

    public void setUpgradeStatus(String upgradeStatus) {
        this.upgradeStatus = UpgradeStatus.fromString(upgradeStatus);
    }

    public String getRequestReason() {
        return requestReason;
    }

    public void setRequestReason(String requestReason) {
        this.requestReason = requestReason;
    }

    public Timestamp getRequestedAt() {
        return requestedAt;
    }

    public void setRequestedAt(Timestamp requestedAt) {
        this.requestedAt = requestedAt;
    }

    public Timestamp getRespondAt() {
        return respondAt;
    }

    public void setRespondAt(Timestamp respondAt) {
        this.respondAt = respondAt;
    }

    public String getImageUp() {return imageUp;}

    public void setImageUp(String imageUp) {this.imageUp = imageUp;}

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "AccountUpgrades{" +
                "upgradeId=" + upgradeId +
                ", upgradeStatus='" + upgradeStatus + '\'' +
                ", requestReason='" + requestReason + '\'' +
                ", requestedAt='" + requestedAt + '\'' +
                ", respondAt='" + respondAt + '\'' +
                ", imageUp='" + imageUp + '\'' +
                ", userId=" + userId +
                '}';
    }

    public boolean upgrade(AccountUpgrades upgrade) {
        String sql="INSERT INTO accountUpgrades(upgradeId, upgradeStatus, requestReason, requestedAt, respondAt, imageUp, userId) VALUES(?,?,?,?,?,?,?)";
   try (Connection conn = new DBConnect().getConnection();
        PreparedStatement stmt = conn.prepareStatement(sql)) {
       stmt.setInt(1, upgrade.getUpgradeId());
       stmt.setString(2, upgrade.getUpgradeStatus().getValue()); //chuyển đổi enum sang chuỗi
       stmt.setString(3, upgrade.getRequestReason());
       stmt.setTimestamp(4, upgrade.getRequestedAt());

       if (upgrade.getRespondAt() != null) {
           stmt.setTimestamp(5, upgrade.getRespondAt());
       } else {
           stmt.setNull(5, java.sql.Types.TIMESTAMP);
       }

       stmt.setString(6, upgrade.getImageUp());
       stmt.setInt(7, upgrade.getUserId());

       int rowsAffect = stmt.executeUpdate();
       return rowsAffect > 0;
   }catch (SQLException e) {
       e.printStackTrace();
       return false;
     }
    }
}
