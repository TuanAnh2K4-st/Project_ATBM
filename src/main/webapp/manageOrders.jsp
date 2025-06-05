<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8"/>
  <title>Quản lý Đơn hàng</title>
  <link href="css/bootstrap.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link rel="stylesheet" href="css/manageOrders.css">
</head>
<body>
<div class="sidebar">

  <!-- Sidebar -->
  <h3>Trang chủ Admin</h3>
  <div class="avatar">
    <div class="avatar img">
      <img src="img/avatar.jpg" alt="Admin Avatar">
      <span>Admin CAD</span> <!-- Thay tên admin -->

    </div>
    <nav>
      <ul>
        <li><a href="#dashboard" onclick="showSection('dashboard')"><i class="fa fa-chart-line"></i> Bảng điều
          khiển</a></li>
        <li><a href="#products" onclick="showSection('products')"><i class="fa fa-box"></i> Quản lý Sản phẩm</a>
        </li>
        <li><a href="admin-orders" onclick="showSection('orders')"><i class="fa fa-shopping-cart"></i> Quản lý Đơn
          hàng</a></li>
        <li><a href="#customers" onclick="showSection('customers')"><i class="fa fa-users"></i> Quản lý Khách
          hàng</a></li>
        <li><a href="#inventory" onclick="showSection('inventory')"><i class="fa fa-warehouse"></i> Quản lý Kho</a>
        </li>
        <li><a href="#discount" onclick="showSection('discount')"><i class="fa-sharp fa-solid fa-file"></i> Quản lý mã giảm giá</a></li>
        <li><a href="#settings" onclick="showSection('settings')"><i class="fa fa-cogs"></i> Cài Đặt</a></li>
        <li><a href="#users" onclick="showSection('users')"><i class="fa-solid fa-user"></i> Tài khoản người dùng</a></li>

      </ul>
    </nav>
  </div>
</div>
<div class="container mt-4">
  <h2>Quản lý Đơn hàng</h2>
  <table class="table table-bordered table-hover">
    <thead>
    <tr>
      <th>#</th>
      <th>Mã đơn</th>
      <th>Người dùng</th>
      <th>Ngày đặt</th>
      <th>Địa chỉ giao hàng</th>
      <th>Tổng tiền</th>
      <th>Hash</th>
      <th>Chữ ký</th>
      <th>Trạng thái chữ ký</th>
      <th>Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="order" items="${listOrders}" varStatus="loop">
      <tr>
        <td>${loop.index + 1}</td>
        <td>DH${order.orderId}</td>
        <td>${order.user.userName}</td>
        <td>${order.orderDate}</td>
        <td>${order.deliveryAddress}</td>
        <td><fmt:formatNumber value="${order.totalAmount}" type="number" groupingUsed="true" maxFractionDigits="0" /> VNĐ</td>
        <td style="max-width: 300px; max-height: 60px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${order.hashData}</td>
        <td style="max-width: 300px; max-height: 60px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${order.signature}</td>
        <td>
          <c:choose>
            <c:when test="${verifications[loop.index]}">
              <span class="badge bg-success">Hợp lệ</span>
            </c:when>
            <c:otherwise>
              <span class="badge bg-danger">Không hợp lệ</span>
            </c:otherwise>
          </c:choose>
        </td>
        <td>
          <a href="order-detail?orderId=${order.orderId}" class="btn btn-sm btn-info">Chi tiết</a>
          <a href="edit-order?orderId=${order.orderId}" class="btn btn-sm btn-primary">Sửa</a>
          <a href="delete-order?orderId=${order.orderId}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc muốn xóa đơn hàng này?')">Xóa</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
