<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--Chúng ta có thể đặt các tệp JSP ở bất kỳ vị trí nào trong tệp WAR, tuy nhiên nếu chúng ta đặt nó bên trong thư mục WEB-INF,
chúng ta sẽ không thể truy cập trực tiếp từ máy khách. Chúng ta có thể cấu hình JSP giống như servlet trong web.xml,
ví dụ nếu tôi có một trang ví dụ JSP như bên dưới bên trong thư mục WEB-INF: `test.jsp`

```-->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <link rel="stylesheet" href="css/adminPage.css">
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
        <li><a href="admin-orders" onclick="showSection('orders')"><i class="fa fa-shopping-cart"></i> Quản lý Đơn
          hàng</a></li>
        <li><a href="admin-customers" onclick="showSection('customers')"><i class="fa fa-users"></i> Quản lý Khách
          hàng</a></li>
        <li><a href="admin-inventory" onclick="showSection('inventory')"><i class="fa fa-warehouse"></i> Quản lý Kho</a>
        </li>
        <li><a href="admin-discount" onclick="showSection('discount')"><i class="fa-sharp fa-solid fa-file"></i> Quản lý mã giảm giá</a></li>
        <li><a href="admin-settings" onclick="showSection('settings')"><i class="fa fa-cogs"></i> Cài Đặt</a></li>
        <li><a href="admin-users" onclick="showSection('users')"><i class="fa-solid fa-user"></i> Tài khoản người dùng</a></li>

      </ul>
    </nav>
  </div>
</div>
<!-- Main Content -->
<main class="content">
  <section id="settings">
    <h2>Cài đặt</h2>
    <!-- Thông tin cá nhân -->

    <h4>⁜ Thông tin cá nhân</h4>
    <div class="settings-info">

      <form>
        <label for="avatar">Ảnh đại diện:</label>
        <input type="file" id="avatar" name="avatar" accept="avatar.jpg">

        <label for="display-name">Tên hiển thị:</label>
        <input type="text" id="display-name" name="display-name" placeholder="Admin CAD">

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="ttth@aic.hcmuaf.edu.vn">

        <label for="phone">Số điện thoại:</label>
        <input type="tel" id="phone" name="phone" placeholder="028.3896.1713">

        <button type="submit">Lưu thay đổi</button>
      </form>
    </div>


    <!-- Thay đổi mật khẩu -->
    <h4> ⁜ Thay đổi mật khẩu</h4>
    <div class="settings-info">
      <form>
        <label for="old-password">Mật khẩu cũ:</label>
        <input type="password" id="old-password" name="old-password" placeholder="Nhập mật khẩu cũ">

        <label for="new-password">Mật khẩu mới:</label>
        <input type="password" id="new-password" name="new-password" placeholder="Nhập mật khẩu mới">

        <label for="confirm-password">Xác nhận mật khẩu:</label>
        <input type="password" id="confirm-password" name="confirm-password" placeholder="Nhập lại mật khẩu mới">

        <button type="submit">Cập nhật mật khẩu</button>
      </form>
    </div>

    <!-- Cài đặt giao diện -->
    <h4>⁜ Cài đặt giao diện</h4>
    <div class="settings-info">
      <form>
        <label for="theme">Chủ đề:</label>
        <select id="theme" name="theme">
          <option value="light">Sáng</option>
          <option value="dark">Tối</option>
        </select>

        <label for="font-size">Kích thước phông chữ:</label>
        <select id="font-size" name="font-size">
          <option value="small">Nhỏ</option>
          <option value="medium">Vừa</option>
          <option value="large">Lớn</option>
        </select>

        <button type="submit">Lưu cài đặt</button>
      </form>
    </div>

    <!-- Cài đặt thông báo -->
    <h4>⁜ Cài đặt thông báo</h4>
    <div class="settings-info">
      <form>
        <label>
          <input type="checkbox" name="email-notifications"> Thông báo qua email
        </label>
        <label>
          <input type="checkbox" name="app-notifications"> Thông báo trên ứng dụng
        </label>
        <label>
          <input type="checkbox" name="sound-notifications"> Âm thanh thông báo
        </label>

        <label for="notification-frequency">Tần suất thông báo:</label>
        <select id="notification-frequency" name="notification-frequency">
          <option value="immediate">Ngay lập tức</option>
          <option value="daily">Hàng ngày</option>
          <option value="weekly">Hàng tuần</option>
        </select>

        <button type="submit">Lưu cài đặt</button>
      </form>
    </div>
    <!-- Điều khoản sử dụng & Chính sách bảo mật -->
    <h4>⁜ Điều khoản sử dụng & Chính sách bảo mật</h4>
    <div class="settings-info">

      <h5>Tải lên và xem tệp:</h5>
      <form id="fileUploadForm-DK">
        <p><a href="/terms" target="_blank">Xem điều khoản sử dụng</a></p>
        <label for="fileInput1">Chọn tệp:</label>
        <input type="file" id="fileInput1" accept=".txt, .pdf, .doc, .docx, .json" required>
        <button type="button" onclick="uploadAndDisplayFile()">Tải lên</button>
      </form>
      <form id="fileUploadForm-CS">
        <p><a href="/privacy-policy" target="_blank">Xem chính sách bảo mật</a></p>
        <label for="fileInput2">Chọn tệp:</label>
        <input type="file" id="fileInput2" accept=".txt, .pdf, .doc, .docx, .json" required>
        <button type="button" onclick="uploadAndDisplayFile()">Tải lên</button>
      </form>

      <div id="fileContent" style="margin-top: 20px; border: 1px solid #ccc; padding: 10px; background-color: #2693E0; display: none;">
        <h5>Nội dung tệp:</h5>
        <pre id="fileText" style="white-space: pre-wrap; word-wrap: break-word;"></pre>
      </div>
    </div>
  </section>
</main>
</body>
</html>