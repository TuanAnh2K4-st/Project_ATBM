<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.AccountUsers" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

  AccountUsers currentUser  = (AccountUsers) session.getAttribute("user");
  // Lấy thông tin người dùng từ session (Khi dùng Map lưu session xài này)
  /*Map<String, String> profileInfo = (Map<String, String>) sessionUser.getAttribute("profileInfo");*/%>
  <%
    Integer userIdInt = (Integer) session.getAttribute("userId");
    String userId = userIdInt != null ? userIdInt.toString() : null;

    //String userId = String.valueOf(session.getAttribute("userId"));
    if (userId == null) {
    response.sendRedirect("Trangdangnhap_dangky.jsp"); // Nếu chưa đăng nhập, chuyển về trang login
    return;
  }

  Cookie[] cookies = request.getCookies();
  Map<String, String> profileInfo = new HashMap<>();

  if (cookies != null) {
    for (Cookie cookie : cookies) {
      if (cookie.getName().endsWith("_" + userId)) { // Chỉ lấy Cookie của user hiện tại
        String key = cookie.getName().replace("_" + userId, ""); // Bỏ phần userId
        String decodedValue = URLDecoder.decode(cookie.getValue(), "UTF-8"); // Giải mã
        profileInfo.put(key, decodedValue);
      }
    }
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="x-ua-compatible" content="IE-edge">
  <title>User Info</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    html, body, ul {
      margin: 0;
      padding: 0;
      font-size: 18px;
      font-family: sans-serif, Tahoma;
    }

    /*header*/
    .sticky {
      background-color: white;
      position: sticky;
      top: 0;
      z-index: 1;
    }

    .container-flugin {
      height: 100px; /* Giới hạn chiều cao của header */
      display: flex;
      align-items: center; /* Căn giữa nội dung theo chiều dọc */
    }

    .navbar-custom {

      background-color: #2693E0;
      height: 50px;
      z-index: 1030;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Hiệu ứng đổ bóng */
    }

    .navbar-custom .navbar-nav .nav-link {
      color: white;
    }

    .navbar-custom .navbar-nav .nav-link:hover {
      color: #f0ad4e; /* Màu vàng khi hover */
    }

    .dropdown-submenu {
      position: relative;
    }

    .dropdown-submenu .dropdown-menu {
      top: 0;
      left: 100%;
      margin-top: -60px;
      display: none;
    }

    .dropdown-submenu:hover .dropdown-menu {
      display: block;

    }

    .dropdown-submenu li a:hover {
      background-color: #1E90FF;
      color: #fff;
    }

    .dropdown-menu {
      padding: 0;
    }

    .d-flex {
      margin: 0;
    }
    /*  Body*/
    /* Tùy chỉnh cho các nút trong nhóm nút */
    .btn-group-vertical .btn {
      font-size: 16px; /* Kích thước chữ */
      padding: 12px 20px; /* Khoảng cách xung quanh chữ */
      border-radius: 5px; /* Bo góc cho nút */
      transition: all 0.3s ease; /* Hiệu ứng chuyển động khi hover */
      width: 100%; /* Đảm bảo các nút rộng vừa vặn với cột */
    }

    /* Nút ban đầu */
    .btn-outline-secondary {
      border-color: #2693E0; /* Màu viền */
      color: #2693E0; /* Màu chữ */
      background-color: white; /* Màu nền ban đầu */
    }

    .btn-outline-secondary:hover {
      background-color: #2693E0; /* Màu nền khi hover */
      color: white; /* Màu chữ khi hover */
      border-color: #1f7cc5; /* Màu viền khi hover */
    }

    .mb-2 {
      margin-bottom: 10px; /* Khoảng cách dưới cho nút "Đổi mật khẩu" */
    }


    .profile-header {
      text-align: center;
      margin-bottom: 20px;
    }

    .profile-header img {
      border-radius: 50%;
      width: 150px;
      height: 150px;
    }

    .btn-group-vertical .btn {
      margin-bottom: 10px;
    }

    .info-box, .order-box {
      border: 1px solid #ddd;
      padding: 20px;
      border-radius: 8px;
      margin-bottom: 15px;
    }

    .btn-custom {
      width: 45%;
    }

    .nav-tabs  {
      font-size: 1.1rem;
      font-weight: bold;
    }

    .tab-pane {
      margin-top: 20px;
    }

    .btn-group .btn {
      flex: 1;
      margin: 0 2px;
    }

    .order-box {
      background-color: #f9f9f9;
    }
    /* Tùy chỉnh thanh trạng thái đơn hàng */
    .custom-status-tabs .nav-link {
      color: black; /* Chữ màu đen */
      font-size: 1rem;
      font-weight: bold;
      transition: background-color 0.3s ease, color 0.3s ease;
    }
    .nav-pills {
      background-color: #2693E0;
    }

    .custom-status-tabs .nav-link.active {
      background-color: #5EBEF6;
      color: white;
    }

    .custom-status-tabs .nav-link:hover {
      color: white;
    }

    /* Đồng nhất kiểu hiển thị thông báo */
    .info-box {
      border: 1px solid #ddd;
      padding: 20px;
      text-align: center;
      background-color: #f9f9f9; /* Nền nhạt cho phần thông báo */
      font-size: 1.1rem;
    }
    .infox-box {
      height: 180px;
      border: 1px solid #ddd;
      padding: 20px;
      text-align: center;
      background-color: #f9f9f9; /* Nền nhạt cho phần thông báo */
      font-size: 1.1rem;
    }
    .center-text {
      display: flex;
      justify-content: center; /* Căn giữa theo chiều ngang */
      align-items: center;     /* Căn giữa theo chiều dọc */
      height: 100px; /* Cần thiết nếu phần tử có chiều cao */
    }

    /* Ẩn trang để hiển thị form */
    /* Overlay modal */
    .modal-overlay {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      background: rgba(0, 0, 0, 0.6);
      /* Sử dụng backdrop-filter để tạo hiệu ứng mờ cho nền */
      backdrop-filter: blur(5px);
      display: none;  /* Ẩn modal ban đầu */
      align-items: center;
      justify-content: center;
      z-index: 1200;
    }

    /* Nội dung modal */
    .modal-content {
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      width: 90%;
      max-width: 500px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.2);
    }

    .modal-buttons {
      margin-top: 15px;
      text-align: right;
    }

    .modal-buttons button {
      margin-left: 10px;
    }
    /*Footer*/
    .footer {
      margin-top: 50px;
      background-color: #398BC4;
      color: white;
      padding: 20px;
      font-family: sans-serif;
    }

    .footer-container {
      display: flex;
      justify-content: space-between;
      gap: 30px;
    }

    .footer-section {
      flex: 1;
      padding-left: 70px;
    }

    .footer-section h3 {
      font-size: 1.4rem;
      margin-bottom: 15px;
      font-weight: bold;
    }

    .footer-section ul {
      list-style: none;
      padding: 0;
    }

    .footer-section ul li {
      margin-bottom: 10px;
    }

    .footer-section ul li a {
      color: white;
      text-decoration: none;
      font-size: 1rem;
      transition: color 0.3s ease;
    }

    .footer-section ul li a:hover {
      color: #f1f1f1;
    }

    /* Liên kết mạng xã hội */
    .social-links {
      display: flex;
      gap: 15px;
    }

    .social-links li a {
      width: 35px;
      height: 35px;
      border-radius: 50%;
      background-color: #398BC4;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: background-color 0.3s ease;
    }

    .social-links li a:hover {
      background-color: #f1f1f1;
    }

    /* Phần Footer */
    .footer-bottom {
      text-align: center;
      margin-top: 30px;
      font-size: 1rem;
      background-color: #156DAD;
      padding: 15px 0;
    }

    .certification-images {
      display: flex; /* Sắp xếp hình ảnh theo hàng ngang */
      justify-content: center; /* Căn giữa hình ảnh */
      align-items: center;
      gap: 15px; /* Khoảng cách giữa các hình */
      margin-top: 15px;
    }

    .certification-images img {
      width: 80px; /* Chiều rộng mỗi hình ảnh */
      height: auto; /* Tự động điều chỉnh chiều cao để giữ tỷ lệ */
      border-radius: 5px; /* Bo góc nhẹ */
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Hiệu ứng nổi */
      transition: transform 0.3s ease;
    }

    .certification-images img:hover {
      transform: scale(1.1); /* Phóng to hình ảnh khi hover */
    }

    .footer-bottom p {
      margin: 0;
      color: #bbb;
    }

  </style>
</head>
<body>
<!--Header-->
<div class="container-flugin">
  <div class="row">
    <div class="col-3">
      <img src="img/logo CAD_Xóa nền.png" class="logo" height="150" width="auto"/>
    </div>
    <div class="col-6 d-flex justify-content-center align-items-center">
      <form class="d-flex" style="width: 750px; height: 40px;">
        <input class="form-control me-2" type="search" placeholder="Nhập tên hóa chất, mã CAS,...." aria-label="Search" style="height: 100%; width: 90%;">
        <button class="btn btn-outline-success" type="submit" style="height: 100%; width: 10%;font-weight: bold">Tìm</button>
      </form>
    </div>

    <div class="col-3 d-flex justify-content-end align-items-center">
      <a href="Trang giỏ hàng.jsp"><i class="fa-solid fa-cart-plus" style="color: #2693E0; font-size: 30px; margin: 30px"></i></a>
      <a href="Trang_thong_tin_user.jsp"> <i class="fas fa-user" id="user" style="color: #2693E0; font-size: 30px; margin: 30px;"></i></a>
    </div>
  </div>
</div>
<div class="navbar navbar-expand-lg navbar-custom">
  <div class="container-fluid">
    <!--            <a class="navbar-brand text-white" href="#">Brand</a>-->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="Trang_chu.jsp"><i class="fa-solid fa-house" style=" font-size: 22px; color: white"></i> Trang chủ</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Danh sách sản phẩm
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li>
              <a class="dropdown-item" href="Trang sản phẩm mới.jsp">Mới nhất</a>
            </li>
            <li>
              <a class="dropdown-item" href="#">Nổi bật</a>
            </li>
            <li class="dropdown-submenu">
              <a class="dropdown-item dropdown-toggle" href="#">Phân loại</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="Trang HCCB.jsp">Hóa Chất Cơ Bản</a></li>
                <li><a class="dropdown-item" href="#">Dung Môi</a></li>
                <li><a class="dropdown-item" href="#">Chất Chuẩn Phân Tích</a></li>
                <li><a class="dropdown-item" href="#">Hóa Chất Vô Cơ</a></li>
                <li><a class="dropdown-item" href="#">Dung Dịch Chuẩn</a></li>
                <li><a class="dropdown-item" href="#">Chất Chỉ Thị Màu</a></li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Thông tin web</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Trang tin tức.jsp">Tin tức</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Trang liên hệ.jsp">Liên hệ</a>
        </li>
      </ul>
    </div>
  </div>
</div>
<!--body-->
<div class="container mt-5">
  <div class="row">
    <!-- Cột bên trái (3) -->
    <div class="col-md-3 border rounded">
      <form action="UserInfo" method="POST" enctype="multipart/form-data">
      <div class="profile-header">
        <img src="${pageContext.request.contextPath}/${user.avatarUrl != null && user.avatarUrl != '' ? user.avatarUrl : 'img/avatar-default.jpg'}" alt="Avatar" style="margin-top: 10px ;width:150px">
        <h4 class="mt-3"><%= currentUser  != null ? currentUser.getUserName() : "Root" %></h4>
        <h6>Role: <%= currentUser != null ? (currentUser .getRole()): "Khách" %></h6>
        <button type="button" class="btn btn-outline-primary mt-2" onclick="toggleUploadForm()">Đổi ảnh đại diện</button>

        <!-- Tạo form đổi avatar -->
        <div id="uploadForm" style="display: none; margin-top: 10px;">
            <input type="file" name="avatar" accept="image/*" required>
            <input type="hidden" name="action" value="uploadAvatar">
            <button type="submit" class="btn btn-primary mt-2" style="font-size: 17px">Tải lên</button>
            <button type="button" class="btn btn-secondary mt-2" onclick="toggleUploadForm()">Hủy</button>
        </div>
      </div>
      </form>
      <div class="btn-group-vertical w-100">

        <button type="button" class="btn btn-outline-secondary mb-2" onclick="showModal()">Đổi mật khẩu</button>

        <!-- Modal overlay chứa form đổi mật khẩu -->
        <div id="modalOverlay" class="modal-overlay">
          <div class="modal-content">
            <h3>Đổi mật khẩu</h3>
            <form action="UserInfo" method="POST">
              <!-- Gửi action đổi mật khẩu -->
              <input type="hidden" name="action" value="changePassword">
              <div class="form-group">
                <label for="oldPassword">Mật khẩu cũ:</label>
                <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
              </div>
              <div class="form-group">
                <label for="newPassword">Mật khẩu mới:</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
              </div>
              <div class="form-group">
                <label for="confirmPassword">Xác nhận mật khẩu mới:</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
              </div>
              <div class="modal-buttons">
                <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
                <button type="button" class="btn btn-secondary" onclick="hideModal()">Hủy</button>
              </div>
            </form>
          </div>
        </div>

        <form action="UserInfo" method="POST">
          <button type="submit" class="btn btn-outline-secondary mb-2" name="action" value="logout" style="width: 300px">Đăng xuất</button>
        </form>
      </div>
    </div>

    <!-- Cột bên phải (9) -->
    <div class="col-md-9 border rounded">
      <ul class="nav nav-tabs">
        <li class="nav-item">
          <a class="nav-link active" id="personal-tab" data-bs-toggle="tab" href="#personal-info">Thông Tin Cá Nhân</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" id="orders-tab" data-bs-toggle="tab" href="#order-management">Quản Lý Đơn Hàng</a>
        </li>
      </ul>
      <div class="tab-content">
        <!-- Tab Thông Tin Cá Nhân -->
        <div class="tab-pane fade show active" id="personal-info">
          <!--          <h3>Thông Tin Cá Nhân</h3>-->
          <form action="UserInfo" method="POST">
            <input type="hidden" name="action" value="updateProfile">
          <div class="info-box">
            <div class="form-group">
              <label for="fullName">Họ và tên</label>
              <input type="text" class="form-control" id="fullName" name="fullName" value="<%= profileInfo.getOrDefault("fullName", "") %>">
            </div>
            <div class="form-group">
              <label for="email">Email</label>
              <input type="email" class="form-control" id="email" name="email" value="<%= profileInfo.getOrDefault("email", "") %>">
            </div>
            <div class="form-group">
              <label for="dob">Ngày sinh</label>
              <input type="date" class="form-control" id="dob" name="dob" value="<%= profileInfo.getOrDefault("dob", "2004-01-01") %>">
            </div>
            <div class="form-group">
              <label for="address">Địa chỉ</label>
              <input type="text" class="form-control" id="address" name="address" placeholder="Số nhà, Quận, Thành phố" value="<%= profileInfo.getOrDefault("address", "") %>">
              <div class="mt-2">
                <select class="form-select" id="city" name="city">
                  <option value="Hanoi" <%="Hanoi".equals(profileInfo.get("city")) ? "selected" : "" %>>Hà Nội</option>
                  <option value="HCM" <%="HCM".equals(profileInfo.get("city")) ? "selected" : ""%>>Hồ Chí Minh</option>
                  <option value="DN" <%="DN".equals(profileInfo.get("city")) ? "selected" : ""%>>Đà Nẵng</option>
                  <option value="Hue" <%="Hue".equals(profileInfo.get("city")) ? "selected" : ""%>>Huế</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label for="occupation">Nghề nghiệp</label>
              <input type="text" class="form-control" id="occupation" name="occupation"
                     value="<%= profileInfo.getOrDefault("occupation", "") %>">
            </div>
            <div class="form-group">
              <label for="company">Cơ quan</label>
              <input type="text" class="form-control" id="company" name="company"
                     value="<%= profileInfo.getOrDefault("company", "") %>">
            </div>
            <div class="form-group">
              <label for="phone">SĐT</label>
              <input type="tel" class="form-control" id="phone" name="phone"
                     value="<%= profileInfo.getOrDefault("phone", "") %>">
            </div>
          </div>
          <div class="upload-box">
            <label for="fileUpload">Tải lên tài liệu</label>
            <input type="file" class="form-control" id="fileUpload">
          </div>
          <div class="mt-3">
            <button class="btn btn-primary btn-custom">Cập nhật</button>

            <%
             Integer role = (Integer) session.getAttribute("role");
              if (role == null) role = 0; // Nếu role chưa có, mặc định là user bình thường
            %>

            <% if (role == 0) { %>
            <button type="button" class="btn-success btn-custom float-end" onclick="showUpgradeModal()">Nâng cấp</button>
          </div>
          </form>
        </div>
        <!-- Modal overlay chứa form nâng cấp -->
        <div id="upgradeModal" class="modal-overlay">
          <div class="modal-content">
            <h3>Nâng cấp tài khoản</h3>
            <p>Vui lòng điền lý do và tải lên tài liệu chứng minh để nâng cấp.</p>
            <form action="UserInfo" method="POST" enctype="multipart/form-data">
              <!-- Input ẩn để gửi action "upgrade" -->
              <input type="hidden" name="action" value="upgrade">
              <!-- Nếu cần, input ẩn chứa upgradeId hoặc userId (nếu bạn đã có upgradeId) -->
              <div class="form-group">
                <label for="requestReason">Lý do nâng cấp:</label>
                <textarea class="form-control" id="requestReason" name="requestReason" rows="4" required></textarea>
              </div>
              <div class="form-group">
                <label for="imageUp">Tải lên tài liệu chứng minh:</label>
                <input type="file" class="form-control" id="imageUp" name="imageUp" accept="image/*,application/pdf" required>
              </div>
              <div class="modal-buttons">
                <button type="submit" class="btn btn-primary">Gửi yêu cầu</button>
                <button type="button" class="btn btn-secondary" onclick="hideUpgradeModal()">Hủy</button>
              </div>
            </form>
          </div>
        </div>

        <% } %>
        <!-- Tab Quản Lý Đơn Hàng -->
        <div class="tab-pane fade" id="order-management">
          <!-- Thanh điều hướng trạng thái đơn hàng -->
          <ul class="nav nav-pills custom-status-tabs mb-3">
            <li class="nav-item">
              <a class="nav-link active" id="pending-tab" data-bs-toggle="tab" href="#pending-orders">Chờ Xác Nhận</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="shipping-tab" data-bs-toggle="tab" href="#shipping-orders">Đang Vận Chuyển</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="delivered-tab" data-bs-toggle="tab" href="#delivered-orders">Đã Giao</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" id="returned-tab" data-bs-toggle="tab" href="#returned-orders">Trả Hàng</a>
            </li>
          </ul>

          <!-- Nội dung từng trạng thái đơn hàng -->
          <div class="tab-content">
            <div class="tab-pane fade show active" id="pending-orders">
              <div class="infox-box">
                <p class="center-text">Bạn chưa có đơn hàng nào đang chờ xác nhận.</p>
              </div>
            </div>
            <div class="tab-pane fade" id="shipping-orders">
              <div class="infox-box">
                <p class="center-text">Bạn chưa có đơn hàng nào đang vận chuyển.</p>
              </div>
            </div>
            <div class="tab-pane fade" id="delivered-orders">
              <div class="infox-box">
                <p class="center-text">Bạn chưa có đơn hàng nào đã giao.</p>
              </div>
            </div>
            <div class="tab-pane fade" id="returned-orders">
              <div class="infox-box">
                <p class="center-text">Bạn chưa có đơn hàng nào được trả.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--Footer-->
<footer class="footer">
  <div class="footer-container">
    <div class="footer-section">
      <h3>Liên hệ</h3>
      <ul>
        <li><a href="mailto:info@example.com">ttth@aic.hcmuaf.edu.vn</a></li>
        <li><a href="tel">028.3896.1713</a></li>
        <li><a href="#">Địa chỉ: P.Linh Trung, TP.Thủ Đức</a></li>
      </ul>
    </div>

    <div class="footer-section">
      <h3>Chính sách</h3>
      <ul>
        <li><a href="#">Chính sách bảo mật</a></li>
        <li><a href="#">Chính sách bảo hành</a></li>
        <li><a href="#">Chính sách hoàn trả</a></li>
        <li><a href="#">Chính sách vận chuyển</a></li>
        <li><a href="#">Cách đặt hàng & thanh toán</a></li>
      </ul>
    </div>

    <div class="footer-section">
      <h3>Mạng xã hội</h3>
      <ul class="social-links">
        <li><a href="#"><i class="fa-brands fa-facebook"></i> </a></li>
        <li><a href="#"><i class="fa-brands fa-twitter"></i> </a></li>
        <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
        <li><a href="#"><i class="fa-brands fa-linkedin"></i></a></li>
      </ul>
    </div>
  </div>
  <div class="footer-bottom">
    <h3>CERTIFICATION</h3>
  </div>
  <div class="certification-images">
    <img src="https://images.dmca.com/Badges/dmca-badge-w150-5x1-04.png?ID=b40dd82e-be1f-42d1-8381-a52fa3324ef3" alt="Chứng nhận 1">
    <img src="https://hoachatthinghiem.org/wp-content/uploads/2022/10/Secured-connection-sbc-ssl.png" alt="Chứng nhận 2">
    <img src="https://tinnhiemmang.vn/handle_cert?id=hoachatthinghiem.org" alt="Chứng nhận 3">
    <img src="https://hoachatthinghiem.org/wp-content/uploads/2022/07/Bo-cong-thuong-logo.png" alt="Chứng nhận 4">
  </div>
</footer>

<script>
  function toggleUploadForm() {
    var form = document.getElementById("uploadForm");
    if (form.style.display === "none") {
      form.style.display = "block"; // Hiển thị form
    } else {
      form.style.display = "none"; // Ẩn form
    }
  }
  function showModal(){
    document.getElementById("modalOverlay").style.display='flex';
  }
  function hideModal(){
    document.getElementById("modalOverlay").style.display='none';
  }
  function showUpgradeModal(){
    document.getElementById("upgradeModal").style.display = "flex";
  }
  function hideUpgradeModal(){
    document.getElementById("upgradeModal").style.display = "none";
  }
</script>
</body>
</html>
