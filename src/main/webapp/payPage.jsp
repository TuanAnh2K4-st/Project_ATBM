<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="hcmuaf.edu.vn.fit.pj_web_hc.Model.Cart,
                 hcmuaf.edu.vn.fit.pj_web_hc.Model.CartItem,
                 java.util.List,
                 java.util.ArrayList" %>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    List<CartItem> cartItems = new ArrayList<>();
    if (cart != null) {
        cartItems.addAll(cart.getItems());
    }
    long total = 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Thanh toán</title>

    <!-- Font Awesome & Bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="css/header.css" />
    <link rel="stylesheet" href="css/footer.css" />
    <link rel="stylesheet" href="css/payPage.css" />
</head>
<body>
<jsp:include page="header.jsp" />

<div class="main container my-4">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 sidebar">
            <a href="Trang Khuyến mãi.jsp">
                <img src="img/Sale hóa chất.gif" alt="Khuyến mãi" class="img-fluid" />
            </a>
            <h2>Sự kiện mới</h2>
            <div class="hot-info">
                <div class="hot-item"><h3>Sản phẩm khuyến mãi</h3><p>Giảm giá đến 50% cho các sản phẩm mùa hè.</p></div>
                <div class="hot-item"><h3>Sản phẩm mới</h3><p>Đón chào loạt sản phẩm mới với nhiều tính năng hiện đại.</p></div>
                <div class="hot-item"><h3>Ưu đãi đặc biệt</h3><p>Nhận ngay ưu đãi cho khách hàng thân thiết!</p></div>
            </div>
        </div>

        <!-- Main content -->
        <div class="col-md-9">
            <form id="payment-form" method="post" action="process-payment">
                <h1>Hóa đơn</h1>

                <!-- Thông tin giao hàng -->
                <div class="mb-3">
                    <label for="full-name" class="form-label">Họ và tên:</label>
                    <input type="text" id="full-name" name="fullName" class="form-control" required />
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ giao hàng:</label>
                    <textarea id="address" name="address" rows="3" class="form-control" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại:</label>
                    <input type="tel" id="phone" name="phone" class="form-control" required />
                </div>

                <!-- Phương thức thanh toán -->
                <div class="mb-3">
                    <label for="payment-method" class="form-label">Phương thức thanh toán:</label>
                    <select id="payment-method" name="paymentMethod" class="form-select" required>
                        <option value="">Chọn phương thức thanh toán</option>
                        <option value="cod">Thanh toán khi nhận hàng (COD)</option>
                        <option value="card">Thanh toán bằng thẻ ngân hàng</option>
                        <option value="momo">Thanh toán qua MoMo</option>
                    </select>
                </div>

                <!-- Tóm tắt đơn hàng -->
                <div class="order-summary mb-3">
                    <h2>Chi tiết đơn hàng</h2>
                    <ul class="list-group">
                        <%
                            for (CartItem item : cartItems) {
                                String name = item.getProduct().getProductName();
                                long price = item.getProduct().getPriceSell();
                                int quantity = item.getQuantity();
                                long subtotal = price * quantity;
                                total += subtotal;
                        %>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <span><%= name %> x<%= quantity %></span>
                            <span><%= String.format("%,d", subtotal) %> VND</span>
                        </li>
                        <% } %>
                        <li class="list-group-item d-flex justify-content-between align-items-center fw-bold">
                            <span>Tổng cộng</span>
                            <span><%= String.format("%,d", total) %> VND</span>
                        </li>
                    </ul>
                </div>

                <!-- Nút xác nhận và thanh toán -->
                <button type="submit" class="btn btn-primary">Xác nhận</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
