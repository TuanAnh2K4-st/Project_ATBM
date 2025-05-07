<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="x-ua-compatible" content="IE-edge">
  <title>Sales</title>
  <title>Sales</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<style>
    html, body, ul {
      margin: 0;
      padding: 0;
      font-size: 16px;
      font-family: sans-serif;
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
/*body*/
    .box1 {
      height: 50px;
      width: 100%;
      background-color: #2693E0;
    }
    .main-section {
      display: flex;
      flex-wrap: wrap;
      flex-direction: column;
      align-items: center;
      justify-content: space-around;
      padding: 20px;
      gap: 10px; /* khoảng cách giữa các sản phẩm */
    }
    .product-card {
      height: 430px;
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 15px;
      text-align: center;
      width: 300px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .product-row{
      display: flex;
      justify-content: center;
      gap: 15px;
      margin: 15px;
    }
    .product-card img {
      max-width: 100%;
      height: 150px;
      margin-bottom: 15px ;
    }
    .discount {
      color: red;
      font-weight: bold;
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

  </style>
<body>
<!--Header-->
<div class="sticky">
<div class="container-flugin">
  <div class="row">
    <div class="col-3">
      <a ><img src="img/logo CAD_Xóa nền.png" class="logo" height="180" width="370"/></a>
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
<!--body-->
<div class="row3">
  <div class="col-12 d-flex justify-content-center align-items-center">
    <img src="img/Khuyến mãi 75%.png" height="325" width="100%"/>
  </div>
  <div class="box1">
  </div>
</div>
</div>
<div class="main-section">
  <div class="row product-row">
  <div class="product-card">
    <img src="https://hoachatthinghiem.org/wp-content/uploads/2021/08/Polymixine-B-sulphate-Duchefa.jpg" alt="Sản phẩm ">
    <h5>Polymixine B sulphate 6500 units/mg(Duchefa, Cas 1405-20-5)</h5>
    <p class="discount">Đặc biệt</p>
    <p>Giá gốc: 1.250.000 VND</p>
    <p><strong>Giá khuyến mãi: 1.001.000 VND</strong></p>
    <button class="btn btn-primary">Mua ngay</button>
  </div>

  <div class="product-card">
    <img src="https://hoachatthinghiem.org/wp-content/uploads/2018/07/Hoa-chat-DPPH-Sigma-768x768.jpg" alt="Sản phẩm 2">
    <h5>2,2-Diphenyl-1-picrylhydrazyl (DPPH)</h5>
    <p class="discount">Giảm giá 50%</p>
    <p>Giá gốc: 4.000.000 VND</p>
    <p><strong>Giá khuyến mãi: 2.000.000 VND</strong></p>
    <button class="btn btn-primary">Mua ngay</button>
  </div>

  <div class="product-card">
    <img src="https://hoachatthinghiem.org/wp-content/uploads/2019/05/2-Aminopurine-%E2%89%A599-Sigma-Aldrich-768x768.jpg" alt="Sản phẩm 3">
    <h5>2-Aminopurine ≥99% (Sigma, Cas 452-06-2)</h5>
    <p class="discount">Giảm giá 20%</p>
    <p>Giá gốc: 5.200.000 VND</p>
    <p><strong>Giá khuyến mãi: 4.160.000 VND</strong></p>
    <button class="btn btn-primary">Mua ngay</button>
  </div>
  <div class="product-card">
    <img src="https://hoachatthinghiem.org/wp-content/uploads/2018/12/NAA-Biobasic-SBC-768x768.jpg" alt="Sản phẩm 4">
  <h5>NAA (1-Naphthaleneacetic acid)</h5>
  <p class="discount">Giảm giá 15%</p>
  <p>Giá gốc: 1.450.000 VND</p>
    <p><strong>Giá khuyến mãi: 1.232.500 VND</strong></p>
  <button class="btn btn-primary">Mua ngay</button>
</div>
  </div>
  <div class="row product-row">
<div class="product-card">
  <img src="https://hoachatthinghiem.org/wp-content/uploads/2017/12/Indole-3-butyric-acid-IBA-768x768.jpg" alt="Sản phẩm 5">
  <h5>Indole-3-butyric acid</h5>
  <p class="discount">Giảm giá 25%</p>
  <p>Giá gốc: 1.900.000 VND</p>
  <p><strong>Giá khuyến mãi: 1.425.000 VND</strong></p>
  <button class="btn btn-primary">Mua ngay</button>
</div>

<div class="product-card">
  <img src="https://hoachatthinghiem.org/wp-content/uploads/2018/04/Boric-acid-99-Duchefa-Ha-Lan-768x768.jpg" alt="Sản phẩm 6">
  <h5>Boric acid (Duchefa, Chai 1KG, Cas 10043-35-3)</h5>
  <p class="discount">Giảm giá 40%</p>
  <p>Giá gốc: 1.000.000 VND</p>
  <p><strong>Giá khuyến mãi: 600.000 VND</strong></p>
  <button class="btn btn-primary">Mua ngay</button>
</div>
  <div class="product-card">
    <img src="https://hoachatthinghiem.org/wp-content/uploads/2022/04/TDZ-Thidiazuron-1G-BOSF-768x768.jpg" alt="Sản phẩm 7">
    <h5>Thidiazuron >98% (TDZ, Chai 1G, BOSF TQ, Cas 51707-55-2)</h5>
    <p class="discount">Giảm giá 75%</p>
    <p>Giá gốc: 750.000 VND</p>
    <p><strong>Giá khuyến mãi: 187.000 VND</strong></p>
    <button class="btn btn-primary">Mua ngay</button>
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
</body>
</html>
