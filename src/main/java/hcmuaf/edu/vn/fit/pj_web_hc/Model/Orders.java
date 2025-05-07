package hcmuaf.edu.vn.fit.pj_web_hc.Model;

public class Orders {
    private int orderId ;
    private String orderDate;
    private OrdersStatus  statusOrder ;
    private String  updateAt ;
    private double totalAmount ;
    private String paymentMethod ;
    private int userId ;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public OrdersStatus getStatusOrder() {
        return statusOrder;
    }

    public void setStatusOrder(OrdersStatus statusOrder) {
        this.statusOrder = statusOrder;
    }

    public String getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(String updateAt) {
        this.updateAt = updateAt;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderId=" + orderId +
                ", orderDate='" + orderDate + '\'' +
                ", statusOrder='" + statusOrder + '\'' +
                ", updateAt='" + updateAt + '\'' +
                ", totalAmount=" + totalAmount +
                ", paymentMethod='" + paymentMethod + '\'' +
                ", userId=" + userId +
                '}';
    }
}
