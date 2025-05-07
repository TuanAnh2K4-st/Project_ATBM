<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
        integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>

  <title>Thanh toán</title>

  <style>



    body {
      font-family: Tahoma, sans-serif;
      margin: 0;
      padding: 0;

    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      background-color: #fff;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    h1 {
      text-align: center;
      color: #333;
      margin-top: 25px;
      font-weight: bold;
    }

    ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    .main img{
      width: 210px;
      padding-bottom: 20px;

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

    /*sidebar*/
    .sidebar {
      width: 250px;
      background-color: #f4f4f4;
      padding: 20px;
      border-radius: 5px;
      margin-right: 40px;

    }

    .sidebar h2 {
      margin-bottom: 10px;
      font-size: 1.5rem;
    }

    .sidebar ul {
      list-style-type: none;
      padding-left: 0;
    }

    .sidebar ul li {
      margin-bottom: 10px;
    }

    .sidebar ul li a {
      color: #333;
      text-decoration: none;
      font-size: 1rem;
    }

    .sidebar ul li a:hover {
      text-decoration: underline;
    }

    .main {
      display: flex;
      margin: 10px;

    }
    .main form{
      width: 80%;
    }
    .main h1{
      color: #1E90FF;
    }


    /*Footer*/
    .footer {
      background-color: #398BC4;
      color: white;
      padding: 20px;
      font-family: Arial, sans-serif;
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

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    .form-group input,
    .form-group select,
    .form-group textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 16px;
    }

    .order-summary {
      border: 1px solid #ddd;
      padding: 20px;
      border-radius: 8px;
      margin-bottom: 20px;
    }

    .order-summary h2 {
      margin-bottom: 10px;
    }

    .order-summary ul {
      list-style: none;
      padding: 0;
    }

    .order-summary ul li {
      padding: 5px 0;
      border-bottom: 1px solid #eee;
      display: flex;
      justify-content: space-between;
    }

    .order-summary ul li:last-child {
      border-bottom: none;
    }

    .btn-pay {
      display: inline-block;
      width: 100%;
      padding: 12px 20px;
      font-size: 16px;
      color: #fff;
      background-color: #007bff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      text-align: center;
      transition: background-color 0.3s ease;
    }

    .btn-pay:hover {
      background-color: #0056b3;
    }
    /* Tổng thể layout */
    .hot-info {

      gap: 20px;
      padding: 20px 15px;
      background-color: #f7f7f7;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      margin: 30px 0;
    }

    /* Các item trong hot-info */
    .hot-item {
      margin-bottom: 20px;
      background-color: #fff;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    /* Đổi màu nền và hiệu ứng hover cho các hot-item */
    .hot-item:hover {
      transform: translateY(-10px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }

    /* Tiêu đề của hot-item */
    .hot-item h3 {
      font-size: 1.5rem;
      color: #333;
      margin-bottom: 10px;
      font-weight: bold;
      letter-spacing: 0.5px;
    }

    /* Nội dung mô tả trong hot-item */
    .hot-item p {
      font-size: 1rem;
      color: #666;
      line-height: 1.5;
    }

    /* Tiêu đề chính */
    h2 {
      font-size: 2rem;
      color: #333;
      text-align: center;
      margin-bottom: 20px;
      font-weight: bold;
    }

    /* Đảm bảo các item responsive với màn hình nhỏ */
    @media (max-width: 768px) {
      .hot-info {
        grid-template-columns: 1fr 1fr;
      }
    }

    @media (max-width: 480px) {
      .hot-info {
        grid-template-columns: 1fr;
      }
    }


  </style>
  <link rel="stylesheet" href="../css/detail.css">
</head>
<body>

<!--Header-->
<div class="sticky">
  <div class="container-flugin">
    <div class="row">
      <div class="col-3">
        <a><img src="img/logo CAD_Xóa nền.png" class="logo" height="150"
                width="auto"/></a>
      </div>
      <div class="col-6 d-flex justify-content-center align-items-center">
        <form class="d-flex" style="width: 750px; height: 40px;">
          <input class="form-control me-2" type="search" placeholder="Nhập tên hóa chất, mã CAS,...."
                 aria-label="Search" style="height: 100%; width: 90%;">
          <button class="btn btn-outline-success" type="submit"
                  style="height: 100%; width: 10%;font-weight: bold">Tìm
          </button>
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
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
              aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="Trang_chu.jsp"><i class="fa-solid fa-house"
                                            style=" font-size: 22px; color: white"></i> Trang chủ</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
               data-bs-toggle="dropdown" aria-expanded="false">
              Danh mục sản phẩm
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li>
                <a class="dropdown-item" href="#">Mới nhất</a>
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
</div>
<div class="main">
  <div class="sidebar">
    <a href="Trang Khuyến mãi.jsp"><img src="img/Sale hóa chất.gif" alt="">
    </a>
    <h2>Sự kiện mới</h2>
    <div class="hot-info">
      <div class="hot-item">
        <h3>Sản phẩm khuyến mãi</h3>
        <p>Giảm giá đến 50% cho các sản phẩm mùa hè.</p>
      </div>
      <div class="hot-item">
        <h3>Sản phẩm mới</h3>
        <p>Đón chào loạt sản phẩm mới với nhiều tính năng hiện đại.</p>
      </div>
      <div class="hot-item">
        <h3>Ưu đãi đặc biệt</h3>
        <p>Nhận ngay ưu đãi cho khách hàng thân thiết!</p>
      </div>
    </div>
  </div>
  <form>
    <h1>Hóa đơn</h1>
    <!-- Thông tin giao hàng -->
    <div class="form-group">
      <label for="full-name">Họ và tên:</label>
      <input type="text" id="full-name" placeholder="Nhập họ và tên của bạn" required>
    </div>
    <div class="form-group">
      <label for="address">Địa chỉ giao hàng:</label>
      <textarea id="address" rows="3" placeholder="Nhập địa chỉ giao hàng chi tiết" required></textarea>
    </div>
    <div class="form-group">
      <label for="phone">Số điện thoại:</label>
      <input type="tel" id="phone" placeholder="Nhập số điện thoại của bạn" required>
    </div>

    <!-- Phương thức thanh toán -->
    <div class="form-group">
      <label for="payment-method">Phương thức thanh toán:</label>
      <select id="payment-method" required>
        <option value="">Chọn phương thức thanh toán</option>
        <option value="cod">Thanh toán khi nhận hàng (COD)</option>
        <option value="card">Thanh toán bằng thẻ ngân hàng</option>
        <option value="momo">Thanh toán qua MoMo</option>
      </select>
    </div>

    <!-- Tóm tắt đơn hàng -->
    <div class="order-summary">
      <h2>Chi tiết đơn hàng</h2>
      <ul>
        <li>
          <span>Oleanolic acid ≥98% (Cool Chemistry, Cas 508-02-1)</span>
          <span>500.000 VND</span>
        </li>
        <li>
          <span>Phí vận chuyển</span>
          <span>50.000 VND</span>
        </li>
        <li>
          <strong>Tổng cộng</strong>
          <strong>550.000 VND</strong>
        </li>
      </ul>
    </div>

    <!-- Nút đặt hàng -->
    <button type="submit" class="btn-pay">Hoàn tất thanh toán</button>
  </form>
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
    <img src="https://images.dmca.com/Badges/dmca-badge-w150-5x1-04.png?ID=b40dd82e-be1f-42d1-8381-a52fa3324ef3"
         alt="Chứng nhận 1">
    <img src="https://hoachatthinghiem.org/wp-content/uploads/2022/10/Secured-connection-sbc-ssl.png"
         alt="Chứng nhận 2">
    <img src="https://tinnhiemmang.vn/handle_cert?id=hoachatthinghiem.org" alt="Chứng nhận 3">
    <img src="https://hoachatthinghiem.org/wp-content/uploads/2022/07/Bo-cong-thuong-logo.png"
         alt="Chứng nhận 4">
  </div>
</footer>

</div>
<script>
  // Giả lập dữ liệu người dùng đã đăng nhập
  const userData = {
    fullName: "Nguyễn Văn A",
    address: "123 Đường ABC, Quận 1, TP. Hồ Chí Minh",
    phone: "0123456789"
  };

  // Tự động điền thông tin
  document.getElementById("full-name").value = userData.fullName;
  document.getElementById("address").value = userData.address;
  document.getElementById("phone").value = userData.phone;


</script>

</body>
</html>
