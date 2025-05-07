package hcmuaf.edu.vn.fit.pj_web_hc.Model;

public enum OrderDetailsStatus {
    PENDING("pending"), PACKED("packed"), SHIPPED("shipped"), DELIVERED("delivered");

    private final String value;
    OrderDetailsStatus(String value) {
        this.value = value;
    }
    public String getValue() {
        return value;
    }

    //chuyển đổi chuỗi sang enum
    public static OrderDetailsStatus fromString(String value) {
        for (OrderDetailsStatus status : OrderDetailsStatus.values()) {
            if (status.getValue().equals(value)) {
                return status;
            }
        }
        throw new IllegalArgumentException();
    }
}
