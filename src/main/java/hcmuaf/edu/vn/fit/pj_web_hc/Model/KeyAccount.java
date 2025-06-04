package hcmuaf.edu.vn.fit.pj_web_hc.Model;

public class KeyAccount {
    private int keyId;
    private String publicKey;
    private String timeUp;
    private KeyStatus status; // Enum đại diện cho trạng thái
    private int userId;

    // Getter & Setter

    public int getKeyId() {
        return keyId;
    }

    public void setKeyId(int keyId) {
        this.keyId = keyId;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public String getTimeUp() {
        return timeUp;
    }

    public void setTimeUp(String timeUp) {
        this.timeUp = timeUp;
    }

    public KeyStatus getStatus() {
        return status;
    }

    public void setStatus(KeyStatus status) {
        this.status = status;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "KeyAccount{" +
                "keyId=" + keyId +
                ", publicKey='" + publicKey + '\'' +
                ", timeUp='" + timeUp + '\'' +
                ", status=" + status +
                ", userId=" + userId +
                '}';
    }
}
