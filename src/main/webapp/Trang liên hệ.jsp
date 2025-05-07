<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="x-ua-compatible" content="IE-edge">
  <title>Contact</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>
<style>
  html, body, ul {
    margin: 0;
    padding: 0;
    font-size: 16px;
    font-family: sans-serif;
  }
  /*header*/

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
  .container{
    max-width: 100%;
    width: 100%;
    margin: 0;
    padding: 15px 10px 5px;
    align-content: center;
    text-align: left;
    align-items: center;
    background-color: #b3d4fc;
  }
    .main-section{
      top: 0;
      align-items: center;
      display: flex;
      padding: 20px;
      gap: 20px;
    }.main-info{
    left: 100%;
    flex-direction: column;
    margin: 10px;
    gap: 10px;
    width: 40%;
         }
     .card {
       width: 500px;
       height: auto;
       margin-left: auto;
       margin-right: auto;
     }
    /*Footer*/
    .footer {
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
</div>
<!--body-->
<div class="container">
  <!-- Tiêu đề chính -->
  <h2>Liên hệ với chúng tôi</h2>
<div class="main-section">
  <div class="main-info">
    <!-- Thông tin liên hệ -->
      <h4>Thông tin liên hệ</h4>
      <ul class="list-unstyled">
        <li><strong>Giờ làm việc:</strong></li>
        <ul>
          <li>Thứ 2 - Thứ 6: 8:00 - 17:30</li>
          <li>Thứ 7: 8:00 - 12:00</li>
          <li>Chủ nhật: Nghỉ</li>
        </ul>
        <li><strong>Địa chỉ:</strong> P. Linh Trung, TP. Thủ Đức</li>
        <li><strong>Điện thoại:</strong><a href="tel:02838961713">028.3896.1713</a></li>
        <li><strong>Email:</strong> <a href="mailto:ttth@aic.hcmuaf.edu.vn">ttth@aic.hcmuaf.edu.vn</a></li>

      </ul>
    <div>
      <h4>Bản đồ</h4>
      <div>
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.220483632045!2d106.78897027480642!3d10.87082798928376!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752700665a002d%3A0xfc064824c164728b!2zS2hvYSBDw7RuZyBuZ2jhu4cgVGjDtG5nIHRpbiwgxJBIIE7DtG5nIEzDom0gVFAuIEhDTQ!5e0!3m2!1svi!2s!4v1733105643553!5m2!1svi!2s"
          width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
      </div>
    </div>


  </div>

    <!-- Form gửi yêu cầu -->
      <div class="card">
        <div class="card-body">
          <h4 class="card-title text-center mb-4">Gửi yêu cầu liên hệ</h4>
          <form>
            <div class="mb-3">
              <label for="name" class="form-label">Họ và tên</label>
              <input type="text" class="form-control" id="name" placeholder="Nhập họ và tên của bạn" required>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" class="form-control" id="email" placeholder="Nhập email của bạn" required>
            </div>
            <div class="mb-3">
              <label for="phone" class="form-label">Số điện thoại</label>
              <input type="tel" class="form-control" id="phone" placeholder="Nhập số điện thoại của bạn" required>
            </div>
            <div class="mb-3">
              <label for="message" class="form-label">Nội dung</label>
              <textarea class="form-control" id="message" rows="4" placeholder="Nhập nội dung liên hệ" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary w-100">Gửi liên hệ</button>
          </form>
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
</body>
</html>
