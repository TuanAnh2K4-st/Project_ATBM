<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="x-ua-compatible" content="IE-edge">
  <title>News</title>
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
    .container {
      max-width: 1200px; /* Khung rộng hơn */
      margin: 40px auto;
      padding: 20px;
      background-color: #34495e; /* Nền khung */
      border-radius: 10px; /* Góc bo tròn */
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3); /* Hiệu ứng đổ bóng */
    }

    h1 {
      text-align: center;
      color: white; /* Màu xanh nổi bật */
      margin-bottom: 20px;
    }

    .news-item {
      display: flex;
      background: #ffffff; /* Nền trắng */
      margin-bottom: 20px;
      padding: 15px;
      border-radius: 8px; /* Góc bo tròn */
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2); /* Hiệu ứng đổ bóng */
    }

    .news-item img {
      width: 200px; /* Tăng chiều rộng hình ảnh */
      height: 120px; /* Tăng chiều cao hình ảnh */
      object-fit: cover;
      border-radius: 5px;
      margin-right: 20px;
    }

    .news-content {
      flex: 1;
    }

    .news-title {
      font-size: 20px; /* Tiêu đề lớn hơn */
      font-weight: bold; /* In đậm tiêu đề */
      color: #1abc9c; /* Màu xanh nổi bật */
      text-decoration: none; /* Bỏ gạch chân */
      margin-bottom: 10px;
      display: block;
      transition: color 0.3s ease, transform 0.3s ease; /* Hiệu ứng hover */
    }

    .news-title:hover {
      color: #16a085; /* Đổi màu khi hover */
      transform: scale(1.05); /* Phóng to nhẹ khi hover */
    }

    .news-description {
      font-size: 15px; /* Chữ mô tả to hơn */
      color: #7f8c8d; /* Màu xám nhẹ cho phần mô tả */
    }

    /* Hiệu ứng hover cho từng tin tức */
    .news-item:hover {
      transform: translateY(-5px); /* Nhấc nhẹ khi hover */
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3); /* Tăng bóng khi hover */
      transition: all 0.3s ease-in-out;
    }

    /* Phân trang */
    .pagination {
      display: flex; /* Dùng flexbox để căn giữa */
      justify-content: center; /* Căn giữa theo chiều ngang */
      align-items: center; /* Căn giữa theo chiều dọc */
      text-align: center; /* Căn giữa chữ */
      margin: 20px 0;
      gap: 10px; /* Khoảng cách giữa các trang */
    }

    .pagination a {
      display: inline-block;
      padding: 10px 15px;
      margin: 0 5px;
      color: #ecf0f1;
      background: #1abc9c;
      text-decoration: none;
      border-radius: 5px;
      transition: background 0.3s ease;
    }

    .pagination a:hover {
      background: #16a085;
    }

    .pagination a.active {
      background: #34495e;
      cursor: default;
    }

    .pagination a {
      min-width: 40px; /* Đảm bảo kích thước đồng đều */
      text-align: center;
    }
    /*Footer*/
    .footer {
      margin-top: 50px;
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
</head>
<body>
<!--Header-->
<div class="container-flugin">
  <div class="row">
    <div class="col-3">
      <a><img src="img/logo CAD_Xóa nền.png" class="logo" height="180" width="370"/></a>
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
<!--body-->
<div class="container">
  <h1>Tin tức nổi bật</h1>

  <!-- Danh sách 8 tin tức -->
  <div class="news-item">
    <img src="https://hpi.com.vn/wp-content/uploads/2022/06/an-toan-phong-thi-nghiem-3.jpg" alt="Hóa chất mới">
    <div class="news-content">
      <a href="Trang tin tức_chi tiết.jsp" class="news-title">Những quy tắc an toàn trong phòng thí nghiệm hóa học</a>
      <p class="news-description">An toàn phòng thí nghiệm là gì? Quy định chung tại phòng thí nghiệm cùng với nội quy của phòng thí nghiệm ra sao? Trách nhiệm của cán bộ, nhân viên như thế nào?  Khi làm việc tại phòng thí nghiệm và làm việc trực tiếp với hóa chất thì bạn phải lưu ý những điều gì để đảm bảo an toàn cho mình? Cuối cùng đó là cách sơ cứu những trường hợp chấn thương và ngộ độc trong phòng thí nghiệm ra sao? Tất cả sẽ có trong bài viết dưới đây của Hiệp Phát....</p>
    </div>
  </div>

  <div class="news-item">
    <img src="https://hoachatthinghiem.org/wp-content/uploads/2023/08/sbc-sigma.png" alt="Hóa chất mới">
    <div class="news-content">
      <a href="news-detail2.html" class="news-title">Tách chiết axit bazơ</a>
      <p class="news-description">Tách chiết axit bazơ là một quy trình tác chiết lỏng-lỏng nối tiếp nhau để tinh chiết axit và bazơ ra khỏi hỗn hợp dựa vào các tính chất hóa học của chúng...</p>
    </div>
  </div>

  <div class="news-item">
    <img src="https://uybangiaoduchdgm.net/wp-content/uploads/sermons/2023/02/gresized.jpeg" alt="Hóa chất mới">
    <div class="news-content">
      <a href="news-detail3.html" class="news-title">Sữa- chất độc trắng hay thức uống bổ dưỡng?</a>
      <p class="news-description">Trong thập kỷ qua, sữa đã trở thành một vấn đề dễ gây tranh cãi một chút. Một số người nói rằng đó là một thực phẩm cần thiết và bổ dưỡng, cần thiết cho xương chắc khỏe, nhưng những người khác nói rằng nó có thể gây ung thư và dẫn đến chết trẻ...</p>
    </div>
  </div>

  <div class="news-item">
    <img src="data:image/jpeg;base64,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" alt="Hóa chất mới">
    <div class="news-content">
      <a href="news-detail4.html" class="news-title">Ứng Dụng Hóa Chất trong Nông Nghiệp và Y Dược</a>
      <p class="news-description">Trong nông nghiệp, hóa chất được sử dụng để bảo vệ cây trồng khỏi sâu bệnh và cỏ dại. Cải thiện chất lượng nông sản: Phân bón: Hóa chất được sử dụng để sản xuất phân bón, cung cấp dưỡng chất cho cây trồng...</p>
    </div>
  </div>

  <div class="news-item">
    <img src="https://hoachatthinghiem.org/wp-content/uploads/2022/01/Acid-manh-nhat-The-gioi-acid.png" alt="Hóa chất mới">
    <div class="news-content">
      <a href="news-detail5.html" class="news-title">Acid mạnh nhất Thế giới (Fluoroantimonic acid)</a>
      <p class="news-description">Acid mạnh nhất Thế giới Fluoroantimonic acid ( hãng sản xuất: Sigma Aldrich), hãy cùng...</p>
    </div>
  </div>

  <div class="news-item">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKa8VUAnm2SbmFerLwPs0ZC11QEaJrNMPLqQ&s" alt="Hóa chất mới">
    <div class="news-content">
      <a href="news-detail1.html" class="news-title">Khám phá hóa chất mới trong ngành công nghiệp</a>
      <p class="news-description">Các nhà khoa học vừa phát hiện ra một hóa chất mới có thể thay đổi hoàn toàn cách sản xuất nhựa...</p>
    </div>
  </div>

  <div class="news-item">
    <img src="data:image/jpeg;base64,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" alt="Hóa chất mới">
    <div class="news-content">
      <a href="news-detail7.html" class="news-title">Các Dự Án Mới về Hóa Chất Xanh</a>
      <p class="news-description">Phát triển hóa chất từ sinh học: Các công ty hóa chất đang chuyển hướng sản xuất các sản phẩm hóa học xanh, sử dụng các quá trình sinh học thay vì hóa học truyền thống, giảm thiểu tác động tiêu cực đến môi trường...</p>
    </div>
  </div>

  <div class="news-item">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlwU_rwHxa8E7Ylu0f-jrkTYkqt3yVMdSOLQ&s" alt="Hóa chất mới">
    <div class="news-content">
      <a href="news-detail8.html" class="news-title">Cách Mạng Công Nghệ và Tự Động Hóa trong Ngành Hóa Chất</a>
      <p class="news-description">Tự động hóa trong sản xuất hóa chất: Công nghệ tự động hóa đang ngày càng trở nên quan trọng trong việc cải thiện hiệu quả sản xuất và giảm chi phí. Điều này bao gồm việc sử dụng robot, cảm biến và trí tuệ nhân tạo (AI) để giám sát và điều chỉnh các quy trình sản xuất hóa chất...</p>
    </div>
  </div>

  <!-- Phân trang -->
  <div class="pagination">
    <a href="#">&laquo;</a>
    <a href="page1.html">1</a>
    <a href="page2.html">2</a>
    <a href="page3.html">3</a>
    <a>...</a>
    <a href="#">&raquo;</a>
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
