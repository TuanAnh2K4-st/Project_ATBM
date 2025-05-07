package hcmuaf.edu.vn.fit.pj_web_hc.Model;

public class OrderDetails {
    private int orderDetailId ;
    private double unitPrice ;
    private int quantity;
    private OrderDetailsStatus statusDetail ;
    private int productId ;
    private int orderId ;



    // Constructor không tham số
    public OrderDetails() {
    }

    // Constructor có tham số
    public OrderDetails(int orderDetailId, double unitPrice, int quantity, OrderDetailsStatus statusDetail, int productId, int orderId) {
        this.orderDetailId = orderDetailId;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.statusDetail = statusDetail;
        this.productId = productId;
        this.orderId = orderId;
    }

    // Getter và Setter
    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public OrderDetailsStatus getStatusDetail() {
        return statusDetail;
    }

    public void setStatusDetail(OrderDetailsStatus statusDetail) {
        this.statusDetail = statusDetail;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    // Phương thức toString() để debug dễ dàng
    @Override
    public String toString() {
        return "OrderDetails{" +
                "orderDetailId=" + orderDetailId +
                ", unitPrice=" + unitPrice +
                ", quantity=" + quantity +
                ", statusDetail=" + statusDetail +
                ", productId=" + productId +
                ", orderId=" + orderId +
                '}';
    }
}
