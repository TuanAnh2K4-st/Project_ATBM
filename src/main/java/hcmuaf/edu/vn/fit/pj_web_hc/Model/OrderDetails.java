package hcmuaf.edu.vn.fit.pj_web_hc.Model;

public class OrderDetails {
    private int orderDetailId ;
    private int unitPrice ;
    private int quantity;
    private OrderDetailsStatus statusDetail ;
    private String productName ;
    private int productId ;
    private int orderId ;



    // Constructor không tham số
    public OrderDetails() {
    }

    // Constructor có tham số
    public OrderDetails(int orderDetailId, int unitPrice, int quantity, OrderDetailsStatus statusDetail, String productName, int productId, int orderId) {
        this.orderDetailId = orderDetailId;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.statusDetail = statusDetail;
        this.productName = productName;
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

    public void setUnitPrice(int unitPrice) {
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

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
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
