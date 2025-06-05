package hcmuaf.edu.vn.fit.pj_web_hc.Model;

public class Orders {
    private int orderId;
    private String orderDate;
    private OrdersStatus statusOrder;
    private double totalAmount;
    private String paymentMethod;
    private String deliveryAddress;
    private String signature;
    private String hashData;
    private int userId;
    private int keyId;

    private AccountUsers user;
    private KeyAccount key;

    // Constructors
    public Orders() {
    }

    public Orders(int orderId, String orderDate, OrdersStatus statusOrder, double totalAmount,
                  String paymentMethod, String deliveryAddress, String signature, String hashData,
                  int userId, int keyId) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.statusOrder = statusOrder;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.deliveryAddress = deliveryAddress;
        this.signature = signature;
        this.hashData = hashData;
        this.userId = userId;
        this.keyId = keyId;
    }

    // Getters and Setters

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

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getHashData() {
        return hashData;
    }

    public void setHashData(String hashData) {
        this.hashData = hashData;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getKeyId() {
        return keyId;
    }

    public void setKeyId(int keyId) {
        this.keyId = keyId;
    }
    public AccountUsers getUser() {
        return user;
    }

    public void setUser(AccountUsers user) {
        this.user = user;
    }

    public KeyAccount getKey() {
        return key;
    }

    public void setKey(KeyAccount key) {
        this.key = key;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "orderId=" + orderId +
                ", orderDate='" + orderDate + '\'' +
                ", statusOrder=" + statusOrder +
                ", totalAmount=" + totalAmount +
                ", paymentMethod='" + paymentMethod + '\'' +
                ", deliveryAddress='" + deliveryAddress + '\'' +
                ", signature='" + signature + '\'' +
                ", hashData='" + hashData + '\'' +
                ", userId=" + userId +
                ", keyId=" + keyId +
                '}';
    }
}