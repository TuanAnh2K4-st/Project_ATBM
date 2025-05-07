package hcmuaf.edu.vn.fit.pj_web_hc.Model;

public enum OrdersStatus {
    CONFIRMATIONING("confirmationing"),
    DELIVERING("delivering"),
    PAID("paid");

    private final String value;
    OrdersStatus(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    //chuyển đổi chuỗi sang enum
    public static OrdersStatus fromString(String value) {
        for (OrdersStatus status : OrdersStatus.values()) {
            if (status.getValue().equals(value)) {
                return status;
            }
        }
        throw new IllegalArgumentException();
    }

}
