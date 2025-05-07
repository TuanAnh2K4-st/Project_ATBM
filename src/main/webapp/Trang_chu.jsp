<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.Products" %>
<!DOCTYPE html>
<html lang="vi" xmlns="http://www.w3.org/1999/html">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="x-ua-compatible" content="IE-edge">
  <title>Home page</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    html, body, ul {
      margin: 0;
      padding: 0;
      font-size: 16px;
      font-family: Tahoma, sans-serif;

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

    .box1 {
      height: 50px;
      width: 100%;
      background-color: #2693E0;
    }
    .main-section{
      display: flex;
      align-items: flex-start;
      padding: 20px;
      gap: 20px; /*khoảng cách giữa các sản phẩm*/
    }
    .labelSale{
      /*nằm ở bên trái
      dài dọc xuống
       */
      flex-shrink: 0;
      justify-content: center;
      width: 350px;
      overflow: hidden;
      border: 1px solid #dddddd;
      left: 0;
      color: white;
    }.labelSale img{
       width: 100%;
       height: auto;
       display: block;
     }
     .box{
       overflow: hidden;
       flex-direction: column;
       width: 100%;
       align-items: center;
     }
    .boxNew{
      /*khung hiển thị các sản phẩm mới
      ẩn các phần tử lố qua rìa cua trang web và có thể nhấp vào để xem
       */
      height: 400px;
      flex: 1;
      padding: 15px 20px 15px 15px;
      background-color: #f8f8f8;
      border-radius: 5px;
      position: relative;
      overflow: hidden; /* Ẩn nội dung vượt ra */
      white-space: nowrap;
    }.BoxBrand{
      flex: 1;
      height: 200px;
      background-color: #b3d4fc;
      padding: 20px;
           border-radius: 5px;
           position: relative;
           overflow: hidden; /* Ẩn nội dung vượt ra */
           white-space: nowrap;
         }
     .boxBrand-img{
       width: 80px;
       height: 70px;
       padding: 5px 10px 5px 10px;
     }
    h3{
      font-size: 28px;
      font-style: inherit;
      color: blue;
    }
    h5{
      font-size: 16px;
      text-align: center;
      /*justify-content: inherit;*/
    }
    hgia{
      color: red;
      font-size: 20px;
    }
    a:visited{
      color: inherit;
    }
    .product-list {
      display: flex;
      gap: 10px;
      transition: transform 0.3s ease;
    }
    .product-card {
      white-space: normal;
      flex: 0 0 200px; /* Kích thước cố định */
      width: 180px;
      height: 320px;
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 15px;
      text-align: center;
      background-color: white;
      display: inline-block;
      transition: transform 0.3s ease;
      margin-right: 10px;
    }
    .product-card img {
      padding: 5px 5px 0px 5px;
      max-width: 100%;
      height: 150px;
      object-fit: cover;
      display: block;
      margin: 5px 5px;
    }
    .product-card:hover { /* tạo hiệu ứng khi hover*/
      transform: scale(1.05);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    .boxNew button {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      border: none;
      padding: 10px;
      cursor: pointer;
      z-index: 1;
    }

    .boxNew button.prev {
      left: 0;
    }

    .boxNew button.next {
      right: 0;
    }
    .boxHighlight{
      white-space: normal;
      flex: 1;
      padding: 10px;
      border: solid #0056b3 3px;
      border-radius: 1.5px;
      margin: 15px;
      align-content: flex-end;
      text-align: center;
      height:300px;
      flex-direction: column;

    }.hightlight-item{
      margin-bottom: 20px;
      border-bottom: 1px solid #ddd;
      padding-bottom: 10px;
      display: flex;
      align-items: center;
         }

    .boxHighlight-img{
      height: 80px;
      width: 80px;
      margin-right: 15px;
      object-fit: cover;
      padding: 10px;


         }
     .highlight-info{
       padding: 10px;
       margin: 0 0 5px;

     }
    .highlight-video-section {
      display: flex;
      justify-content: space-between;
      margin-top: 20px; /* Khoảng cách giữa box sản phẩm mới và box sản phẩm nổi bật + video */
    }

    .video-section {
      flex: 1;
      padding: 15px;
      border-radius: 5px;
      background-color: #f8f8f8;

    }
    .video-container iframe{
      width: 100%;
      height: 200px;
      border: none;
    }

    /*Footer*/
    .footer {
      background-color: #398BC4;
      color: white;
      padding: 20px;
      font-family: Tahoma, sans-serif;
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
<div class="sticky">
<div class="container-flugin">
  <div class="row">
    <div class="col-3">
      <a ><img src="img/logo CAD_Xóa nền.png" class="logo" height="150" width="auto"/></a>
    </div>
    <div class="col-6 d-flex justify-content-center align-items-center">
      <form action="${pageContext.request.contextPath}/search" method="GET" class="d-flex" style="width: 750px; height: 40px;">
        <input class="form-control me-2" type="text" value="${querryS}" name="querry" placeholder="Nhập tên hóa chất, mã CAS,...." aria-label="Search" style="height: 100%; width: 90%">
        <button class="btn btn-outline-success" type="submit" style="height: 100%; width: 10%;font-weight: bold">Tìm</button>
      </form>
    </div>
    <div class="col-3 d-flex justify-content-end align-items-center">
      <a href="Trang giỏ hàng.jsp"><i class="fa-solid fa-cart-plus" style="color: #2693E0; font-size: 30px; margin: 30px"></i></a>
      <!--<a href="Trang%20giỏ%20hàng.html"><i class="fa-solid fa-cart-shopping" id="giỏ hàng" style="color: #2693E0; font-size: 40px; margin: 30px;"></i></a>-->
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

  <!-- Hiển thị thông báo thành công nếu có -->
  <% if (request.getAttribute("successMessage") != null) { %>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
    <i class="fas fa-check-circle" style="color: green;"></i> <!-- Dấu tick màu xanh -->
    <%= request.getAttribute("successMessage") %>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <% } %>
<div class="row3">
  <div class="col-12 d-flex justify-content-center align-items-center">
    <img src="img/HÓA CHẤT ĐA DẠNG.png" height="325" width="100%">
  </div>
  <div class="box1">
  </div>
</div>
</div>
<div class="main-section">
  <div class="labelSale">
   <a href="Trang Khuyến mãi.jsp"><img src="img/Sale hóa chất.gif" height="800" width="418"/></a>
  </div>
<div class="box">
  <div class="boxNew">
    <h3>SẢN PHẨM MỚI</h3>
    <button class="prev">
      <i class="fa-solid fa-circle-chevron-left fa-lg" style="color: #2693E0;"></i>
    </button>
    <div class="product-list" >

      <%
        List<Products> products = (List<Products>) request.getAttribute("newProducts");
        if (products != null && !products.isEmpty()) {
        for (Products product : products) {
      %>
      <div class="product-card">
        <img src="<%= product.getImageProduct() %>" alt="<%= product.getProductName() %>">
        <h5><%= product.getProductName() %></h5>
        <p><strong><%= product.getPriceSell() %></strong></p>
      </div>
      <%
        }
      }
      %>

     <!-- <div class="product-card">
        <img src="https://hoachatthinghiem.org/wp-content/uploads/2024/10/Sodium-Acetate-anhydrous-%E2%89%A5-99-AR-Chai-1KG-Fisher-My-Cas-127-09-3-768x768.jpg" alt="Sản phầm 1">
        <h5>Sodium Acetate anhydrous ≥ 99% (AR, Chai 1KG, Fisher Mỹ, Cas 127-09-3)</h5>
          <p><strong>
            750.000 VNĐ</strong></p>

      </div>
      <div class="product-card">
        <a href="Trang%20chi%20tiết%201%20sản%20phẩm.html"><img src="https://hoachatthinghiem.org/wp-content/uploads/2024/10/Oleanolic-acid-98-Cool-chemistry-25G-768x768.jpg" alt="Sản phẩm 2">
        </a>
          <h5>Oleanolic acid ≥98% (Cool Chemistry, Cas 508-02-1)</h5>
        <p><strong>1.050.000 VNĐ</strong></p>
      </div>
      <div class="product-card">
        <img src="https://hoachatthinghiem.org/wp-content/uploads/2019/02/Glycine-Duchefa-98-768x768.jpg" alt="Sản phẩm 3">
        <h5>Glycine 98.5%(Chai 1KG, Duchefa, Cas 56-40-6)</h5>
        <p><strong>1.750.000 VNĐ</strong></p>
      </div>
      <div class="product-card">
        <img src="https://hoachatthinghiem.org/wp-content/uploads/2017/12/TDZThidiazuron-768x768.jpg" alt="Sản phẩm 4">
        <h5>Thidiazuron >95% (TDZ, Duchefa, Cas 51707-55-2)</h5>
        <p><strong>5.200.000 VNĐ</strong></p>
      </div>
      <div class="product-card">
        <img src="https://hoachatthinghiem.org/wp-content/uploads/2019/10/Sodium-Hydrogen-Carbonate-NaHCO3-768x768.jpg" alt="Sản phẩm 5">
        <h5>Sodium Hydrogen Carbonate (NaHCO3, Fisher Mỹ, Cas 144-55-8)</h5>
        <p><strong>520.000 VNĐ</strong></p>
      </div>
      <div class="product-card">
        <img src="https://hoachatthinghiem.org/wp-content/uploads/2019/01/BHI-Broth-768x768.jpg" alt="Sản phẩm 6">
        <h5>BHI Broth- Brain Heart Infusion Broth (Himedia)</h5>
        <p><strong>1.050.000 VNĐ</strong></p>
      </div>-->
  </div>
    <button class="next"><i class="fa-solid fa-circle-chevron-right fa-lg" style="color: #2693E0;"></i></button>
  </div>
  <!-- Thêm box cho sản phẩm nổi bật và video giới thiệu -->
  <div class="highlight-video-section" style="display: flex; padding: 20px;">
    <div class="boxHighlight" style="flex: 1; margin-right: 20px; background-color: #f8f8f8; border-radius: 5px; padding: 15px;">
      <h3>SẢN PHẨM NỔI BẬT</h3>
        <div class="hightlight-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2021/08/MES-monohydrate-DUchefa-100x100.jpg" class="boxHighlight-img" alt="Sản phẩm nổi bật 1">
         <div class="highlight-info">
          <h5> MES monohydrate >99%(Duchefa, Cas 145224-94-8)</h5>
          <h5><strong>1.850.000 VNĐ</strong></h5>
         </div>
         </div>
        <div class="hightlight-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2021/08/Polymixine-B-sulphate-Duchefa-100x100.jpg" class="boxHighlight-img" alt="Sản phẩm nổi bật 2">
          <div class="highlight-info">
          <h5>Polymixine B sulphate 6500 units/mg(Duchefa, Cas 1405-20-5)</h5>
          <h5><strong>1.550.000 VNĐ</strong></h5>
        </div>
        </div>
        <!-- Thêm các sản phẩm nổi bật khác -->
    </div>

    <div class="video-section" >
      <div class="video-container">
        <video  autoplay loop muted width="600">
          <source src="img/video GT web.mp4" type="video/mp4" >
          Trình duyệt của bạn không hỗ trợ video.
        </video>
      </div>
  </div>
</div>
</div>
</div>

<div class="BoxBrand">
  <div class="row" >
    <h3>BRAND</h3></br>
<ul>
  <a href="https://www.duchefa-biochemie.com/product/category/id/1/name/antibiotics-selective-agents"><img src="https://hoachatthinghiem.org/wp-content/uploads/2021/07/Duchefa-Biochemie.jpg" class="boxBrand-img" alt="Duchefa-Biochemie"></a>
  <img src="https://hoachatthinghiem.org/wp-content/uploads/2022/11/Sigma-aldrich-logo-500x500-1.png"class="boxBrand-img" alt="Sigma-aldrich">
  <img src="https://hoachatthinghiem.org/wp-content/uploads/2022/10/TCI-Chemicals.png" class="boxBrand-img" alt="TCI">
  <img src="https://hoachatthinghiem.org/wp-content/uploads/2022/04/Biobasic-logo.png" class="boxBrand-img" alt="Biobasic">
  <img src="https://hoachatthinghiem.org/wp-content/uploads/2022/04/Himedia-logo-1.png" class="boxBrand-img" alt="Himedia">

</ul>
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
  document.addEventListener("DOMContentLoaded", () => {
    const productList = document.querySelector(".product-list");
    const prevBtn = document.querySelector(".prev");
    const nextBtn = document.querySelector(".next");
    const productWidth = document.querySelector(".product-card").offsetWidth + 10; // Kích thước sản phẩm + khoảng cách
    const productListWidth = productList.scrollWidth; // Tổng chiều rộng của danh sách sản phẩm
    const visibleWidth = document.querySelector(".boxNew").offsetWidth; // Chiều rộng của khung hiển thị
    let scrollPosition = 0;

    nextBtn.addEventListener("click", () => {
      const maxScroll = productListWidth - visibleWidth; // Điểm cuộn tối đa
      scrollPosition += productWidth;

      if (scrollPosition > maxScroll) scrollPosition = maxScroll; // Giới hạn ở cuối danh sách
      productList.style.transform = `translateX(-${scrollPosition}px)`;

      // Vô hiệu hóa nút nếu đã đến cuối
      if (scrollPosition >= maxScroll) {
        nextBtn.disabled = true;
      }
      prevBtn.disabled = false; // Kích hoạt nút prev
    });

    prevBtn.addEventListener("click", () => {
      scrollPosition -= productWidth;

      if (scrollPosition < 0) scrollPosition = 0; // Giới hạn ở đầu danh sách
      productList.style.transform = `translateX(-${scrollPosition}px)`;

      // Vô hiệu hóa nút nếu đã đến đầu
      if (scrollPosition <= 0) {
        prevBtn.disabled = true;
      }
      nextBtn.disabled = false; // Kích hoạt nút next
    });

    // Khởi tạo trạng thái ban đầu
    prevBtn.disabled = true; // Vô hiệu hóa nút prev khi bắt đầu
    if (productListWidth <= visibleWidth) {
      nextBtn.disabled = true; // Vô hiệu hóa nút next nếu không có đủ sản phẩm để cuộn
    }
  });


</script>

</body>
</html>
