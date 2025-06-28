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
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        <li><a href="admin-products" onclick="showSection('products')"><i class="fa fa-box"></i> Quản lý Sản phẩm</a>
        </li>
        <li><a href="admin-orders"><i class="fa fa-shopping-cart"></i> Quản lý Đơn
          hàng</a></li>
        <li><a href="#customers" onclick="showSection('customers')"><i class="fa fa-users"></i> Quản lý Khách
          hàng</a></li>
        <li><a href="#inventory" onclick="showSection('inventory')"><i class="fa fa-warehouse"></i> Quản lý Kho</a>
        </li>
        <li><a href="#discount" onclick="showSection('discount')"><i class="fa-sharp fa-solid fa-file"></i> Quản lý mã giảm giá</a></li>
        <li><a href="admin-key"><i class="fa fa-cogs"></i> Quản lý keyaccount</a></li>
        <li><a href="admin-users" onclick="showSection('users')"><i class="fa-solid fa-user"></i> Tài khoản người dùng</a></li>
        <li><a href="logout" onclick="showSection('settings')"><i class="fa fa-cogs"></i> Logout</a></li>
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
        <td style="max-width: 300px; max-height: 60px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${order.hashvalue}</td>
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
          <!-- Nút Chi tiết -->
          <button class="btn btn-sm btn-info" data-toggle="modal" data-target="#detailModal${order.orderId}">
            Chi tiết
          </button>

          <!-- Nút Sửa -->
          <button class="btn btn-sm btn-primary" data-toggle="modal" data-target="#editModal${order.orderId}">
            Sửa
          </button>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<!-- Modal Chi tiết cho từng đơn hàng -->
<c:forEach var="order" items="${listOrders}">
  <div class="modal fade" id="detailModal${order.orderId}" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Chi tiết đơn hàng DH${order.orderId}</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Đóng">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p><strong>Người dùng:</strong> ${order.user.userName}</p>
          <p><strong>Ngày đặt:</strong> ${order.orderDate}</p>
          <p><strong>Địa chỉ giao hàng:</strong> ${order.deliveryAddress}</p>
          <p><strong>Tổng tiền:</strong>
            <fmt:formatNumber value="${order.totalAmount}" type="number" groupingUsed="true"/> VNĐ
          </p>
          <p><strong>Hash:</strong><br/> <textarea readonly class="form-control" rows="2">${order.hashvalue}</textarea></p>
          <p><strong>Chữ ký:</strong><br/> <textarea readonly class="form-control" rows="2">${order.signature}</textarea></p>

          <!-- Nếu bạn muốn thêm danh sách sản phẩm chi tiết -->
          <c:if test="${not empty order.orderDetails}">
            <h5>Sản phẩm trong đơn:</h5>
            <table class="table table-bordered">
              <thead>
              <tr>
                <th>Tên sản phẩm</th>
                <th>Số lượng</th>
                <th>Đơn giá</th>
                <th>Thành tiền</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="detail" items="${order.orderDetails}">
                <tr>
                  <td>${detail.productName}</td>
                  <td>${detail.quantity}</td>
                  <td><fmt:formatNumber value="${detail.unitPrice}" type="number" groupingUsed="true"/> VNĐ</td>
                  <td><fmt:formatNumber value="${detail.unitPrice * detail.quantity}" type="number" groupingUsed="true"/> VNĐ</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </c:if>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
        </div>
      </div>
    </div>
  </div>
</c:forEach>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
