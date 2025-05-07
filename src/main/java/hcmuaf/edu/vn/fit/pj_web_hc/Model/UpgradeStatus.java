package hcmuaf.edu.vn.fit.pj_web_hc.Model;

public enum UpgradeStatus {
   PENDING("pending"),
    APPROVED("approved"),
    REJECTED("rejected");

   private final String value;
    UpgradeStatus(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    //chuyển đổi chuỗi sang enum

    public static UpgradeStatus fromString(String value) {
        for (UpgradeStatus status : UpgradeStatus.values()) {
            if (status.getValue().equals(value)) {
                return status;
            }
        }
        throw new IllegalArgumentException();
    }
}
