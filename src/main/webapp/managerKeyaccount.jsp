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
  <link rel="stylesheet" href="css/manageKeyaccount.css">
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
<div class="container">
  <h2 class="text-center">Quản lý Key Công khai</h2>
  <table>
    <thead>
    <tr>
      <th>#</th>
      <th>Tên tài khoản</th>
      <th>Public Key</th>
      <th>Thời gian tạo</th>
      <th>Trạng thái</th>
      <th>Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="key" items="${keyList}" varStatus="status">
      <tr>
        <td>${status.index + 1}</td>
        <td>${key.user.userName}</td>
        <td style="font-size: 13px; max-width: 200px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" title="${key.publicKey}">
            ${key.publicKey}
        </td>
        <td>${key.timeUp}</td>
        <td>
          <span class="status-badge ${key.status == 'active' ? 'active' : 'inactive'}">
              ${key.status}
          </span>
        </td>
        <td>
          <form action="admin-key" method="post" style="display:inline;">
            <input type="hidden" name="keyId" value="${key.keyId}" />
            <select name="newStatus" class="form-control" style="display:inline; width: auto;">
              <option value="active" ${key.status == 'active' ? 'selected' : ''}>Active</option>
              <option value="lost" ${key.status == 'lost' ? 'selected' : ''}>Lost</option>
              <option value="expired" ${key.status == 'expired' ? 'selected' : ''}>Expired</option>
            </select>
            <button type="submit" class="btn-edit">Cập nhật</button>
          </form>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
