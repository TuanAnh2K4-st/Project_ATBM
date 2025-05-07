<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="IE-edge">
  <title>Hóa Chất Cơ Bản</title>
  <link rel="stylesheet" href="../css/list.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"
        integrity="sha512-5Hs3dF2AEPkpNAR7UiOHba+lRSJNeM2ECkwxUIxC1Q/FLycGTbNapWXB4tP889k5T5Ju8fs4b1P5z/iB4nMfSQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    html {
      margin: 0;
      padding: 0;
    }

    body {
      font-family: Tahoma, sans-serif;
    }

    .container {
      max-width: 1200px;
      width: 100%;
      margin: 0 auto;


    }


    ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    /*product*/
    .products {
      display: flex;
      gap: 10px;
    }
    .main-content {
      justify-content: space-between;
      align-items: center;
      padding-right: 20px;

    }
    .products{
      padding-left: 60px;
      gap:70px;
    }


    .product-lists {
      position: relative;
      display: grid;
      grid-template-columns: repeat(4, 200px);
      grid-auto-rows: auto;
      gap: 20px;
      padding-left: 20px;
      padding-bottom: 80px;
      padding-top: 60px;
    }

    .product-lists img {
      max-width: 100%;
      width: auto;
      height: auto;
      border-radius: 5px;
    }

    .product-item {
      border-radius: 8px;
      border: 1px solid #ccc;
      text-align: center;
      transition: transform 0.2s;
      padding: 15px;

    }

    .product-item:hover {
      transform: scale(1.05);
      border-color: #666;
    }

    .products .content {
      padding: 0;
      margin: 0;
    }

    .product-name {
      font-size: 15px;
      text-align: left;

    }

    .product-items, .product-price {
      text-align: left;
    }
    .product-price{
      font-weight: bold;
    }

    .product-view {
      padding-top: 10px;
    }

    .product-items, .product-view, .product-time {

      text-align: left;
      opacity: 70%;
      font-size: 12px;
    }

    .product-item .content {
      display: grid;
    }

    .main-content {
      position: relative;
    }

    .sort-by select {
      position: relative;
      z-index: 0;
      pointer-events: auto;
    }

    a {
      text-decoration: none;
      color: black;
    }

    /*sidebar*/
    .sidebar {
      width: 250px;
      background-color: #f4f4f4;
      padding: 20px;
      border-radius: 5px;

    }

    .sidebar h2 {
      font-size: 1.2rem;
      margin-bottom: 20px;
      color: #333;
    }

    .arrange ul {
      list-style: none;
      padding-left: 0;
    }

    .arrange li {
      padding: 10px;
      background-color: #fff;
      margin-bottom: 10px;
      border-radius: 4px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .arrange ul li a {
      display: block;
      color: black;
      text-decoration: none;
      width: 100%;
    }

    #sort li:hover {
      background-color: #1E90FF;
    }

    #sort li:hover a {
      color: white;
    }


    #sort li.active {
      background-color: #1E90FF;
    }

    #sort li.active a {
      color: white;
    }


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

    /*sort-by*/
    .sort-by {
      position: absolute;
      left: 30px;
      top: 17px;
      display: flex;
      align-items: center;
      gap: 5px;
    }

    .sort-by label {
      white-space: nowrap;
      font-size: 16px;
      font-weight: bold;
    }

    .sort-by select {
      padding: 5px 10px;
      font-size: 14px;
      border: 1px solid #ccc;
      border-radius: 4px;
      cursor: pointer;
      background-color: #fff;
    }

    .sort-by select:focus {
      border-color: #007bff;
      outline: none;
      box-shadow: 0 0 5px #1E90FF;
    }

    .type h3 {
      width: 400px; /* Sets the fixed width for the box */
      padding: 10px 20px; /* Adds spacing inside the box */
      margin: 20px auto; /* Centers the box horizontally */
      text-align: center; /* Centers the text inside the box */
      font-weight: bold; /* Makes the text bold */
      color: #fff; /* White text color */
      background-color: #007bff; /* Blue background */
      border-radius: 5px; /* Rounds the corners of the box */
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Adds a subtle shadow */
    }

    /*pagination*/
    .pagination {
      width: 80%;
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 8px;
      position: absolute;
      bottom: 10px;
      left: 50%;
      transform: translateX(-50%);
    }

    .pagination a {
      margin: 0 5px;
      padding: 8px 16px;
      color: #1E90FF;
      text-decoration: none;
      border-radius: 50px;
      border: 1px solid #ddd;
      font-weight: bold;
      transition: background-color 0.3s ease, color 0.3s ease;
    }

    .pagination a:hover {
      background-color: #1E90FF;
      color: #fff;
    }

    .pagination .active {
      background-color: #1E90FF;
      color: white;

    }


    /*!*sort**/
    .arrange {
      justify-content: center;
      margin: 10px 0;
    }

    #sort {
      list-style: none;
      gap: 20px;
      padding: 0;
      margin: 0;
    }

    #sort li {
      cursor: pointer;
      padding: 8px 15px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    #sort li:hover {
      background-color: #1E90FF;
    }


    /*detail*/
    .detail {
      margin-top: 20px;
      padding: 20px;
      background-color: #f9f9f9;
      border: 1px solid #ddd;
      border-radius: 5px;
    }

    .detail h2 {
      font-size: 24px;
      color: #333;
      margin-bottom: 10px;
    }

    .detail .description p {
      font-size: 16px;
      line-height: 1.5;
      color: #555;
      margin-bottom: 10px;
    }

    .detail .description ul {
      padding-left: 20px;
      list-style: disc;
    }

    .detail .description ul li {
      font-size: 16px;
      color: #555;
      margin-bottom: 5px;
    }


    /*header*/
    .sticky {
      background-color: white;
      position: sticky;
      top: 0;
      z-index: 9999;
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

    #sort-by-price {
      position: absolute;
      right: -850px;
      bottom: -60px;
      z-index: 1;
    }

    .sort-by {
      display: flex;
      justify-content: flex-end; /* Canh phải */
      align-items: center;
      margin: 20px 0; /* Khoảng cách trên và dưới */
    }

    .sort-by select {
      padding: 10px 15px; /* Khoảng cách bên trong */
      border: 2px solid #f3f3f3; /* Viền xanh */
      border-radius: 8px; /* Bo góc mềm mại */
      font-size: 16px; /* Kích thước chữ */
      background-color: #f8f9fa; /* Màu nền xám nhẹ */
      color: #333; /* Màu chữ đen */
      outline: none; /* Xóa viền mặc định khi focus */
      cursor: pointer; /* Con trỏ tay khi hover */
      transition: all 0.3s ease; /* Hiệu ứng khi hover */

    }

    /* Hiệu ứng khi di chuột */
    .sort-by select:hover {
      border-color: #f3f3f3; /* Viền đậm hơn */
      background-color: #1E90FF; /* Nền đậm hơn một chút */

    }

    /* Hiệu ứng khi focus */
    .sort-by select:focus {
      border-color: #f3f3f3; /* Viền xanh đậm */
      background-color: #ffffff; /* Nền trắng */
      box-shadow: 0px 4px 8px rgba(0, 123, 255, 0.2); /* Hiệu ứng đổ bóng */
    }

    .sidebar img {
      width: 210px;
      padding-top: 20px;

    }

    .btn-axit, .btn-bazo, .btn-salt {
      position: absolute;
      bottom: -60px;
      z-index: 1;
    }
    .btn-axit{
      right: -32px;
    }
    .btn-bazo{
      right: -132px;
    }
    .btn-salt{
      right: -232px;
    }
    /* Container cho nút */
    .btn-type {
      display: flex;
      justify-content: center;
      gap: 20px; /* Khoảng cách giữa các nút */
      margin: 20px 0;
    }

    /* Style chung cho các nút */
    .btn-type button {
      padding:6px 12px ;
      font-size: 16px;
      font-weight: bold;
      text-transform: uppercase;
      color: #333;

      border: solid 1px gray;
      border-radius: 8px; /* Độ bo góc */
      cursor: pointer;
      transition: all 0.3s ease; /* Hiệu ứng chuyển đổi */
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Đổ bóng */
    }

    /* Hiệu ứng hover cho nút */
    .btn-type button:hover {
      background: linear-gradient(135deg, #007bff, #1e90ff);
      box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15); /* Đổ bóng mạnh hơn */
      transform: translateY(-3px); /* Nút nổi lên */
      color: white;
    }

    /* Hiệu ứng khi nhấn nút */
    .btn-type button:active {
      transform: translateY(1px); /* Nút nhấn xuống */
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* Đổ bóng nhẹ hơn */
    }

    /* Hiệu ứng khi nút đang active */
    .btn-type button.active {
      background: #1e90ff;
      color: white; /* Đổi màu chữ khi active */
      transform: scale(1.05); /* Nút to hơn một chút */
      box-shadow: 0 6px 10px rgba(0, 0, 0, 0.15);
    }


  </style>
</head>
<body>

<!--Header-->
<div class="sticky">
  <div class="container-flugin">
    <div class="row">
      <div class="col-3">
        <a><img src="logo CAD_Xóa nền.png" class="logo" height="150"
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
        <a href="Trang%20giỏ%20hàng.html"><i class="fa-solid fa-cart-plus" style="color: #2693E0; font-size: 30px; margin: 30px"></i></a>
        <a href="Trang%20thông%20tin%20user.html"> <i class="fas fa-user" id="user" style="color: #2693E0; font-size: 30px; margin: 30px;"></i></a>
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
            <a class="nav-link" href="Trang%20chủ.html"><i class="fa-solid fa-house"
                                            style=" font-size: 22px; color: white"></i> Trang chủ</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
               data-bs-toggle="dropdown" aria-expanded="false">
              Danh sách sản phẩm
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li>
                <a class="dropdown-item" href="Trang%20sản%20phẩm%20mới.html">Mới nhất</a>
              </li>
              <li>
                <a class="dropdown-item" href="#">Nổi bật</a>
              </li>
              <li class="dropdown-submenu">
                <a class="dropdown-item dropdown-toggle" href="#">Phân loại</a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="Trang%20HCCB.html">Hóa Chất Cơ Bản</a></li>
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
            <a class="nav-link" href="Trang%20tin%20tức.html">Tin tức</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Trang%20liên%20hệ.html">Liên hệ</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="products">
  <!--        khung chứa các thông tin và các cách sắp xếp-->
  <div class="sidebar">
    <h2>Bộ lọc </h2>
    <div class="arrange">
      <ul id="sort">


        <li class="brand"><a href="list4.html">Hãng</a></li>
        <li class="price active"><a href="list1.html">Giá</a></li>
        <li class="volume"><a href="list3.html">Thể tích</a></li>
      </ul>
    </div>
    <a href="Trang%20Khuyến%20mãi.html"><img src="Sale%20hóa%20chất.gif" alt=""></a>
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
  <!--        khung chứa các sản phẩm-->
  <div class="main-content">
    <div class="type"><h3>Hóa Chất Cơ Bản</h3></div>
    <div class="sort-by">
      <div class="btn-type">
        <a href="list2.html" ><button class="btn-axit ">AXIT</button> </a>
        <button class="btn-bazo">BAZO</button>
        <button class="btn-salt">SALT</button>
      </div>
      <select id="sort-by-price">
        <option value="desc">Cao đến thấp</option>
        <option value="asc">Thấp đến cao</option>
      </select>
    </div>
    <div class="product-lists">
      <!--      thêm sản phẩm mới ở chổ này-->
      <a href="Trang%20chi%20tiết%201%20sản%20phẩm.html">
        <div class="product-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2024/10/Oleanolic-acid-98-Cool-chemistry-25G-510x510.jpg"
               alt="">
          <ul class="content">
            <li class="product-name">Oleanolic acid ≥98% (Cool Chemistry, Cas 508-02-1)
            </li>
            <li class="product-price">500.000 VND</li>
            <li class="product-view">Lượt xem: 123</li>
            <li class="product-time">Ngày đăng: 23/4/2022</li>
          </ul>
        </div>
      </a>
      <a href="#">
        <div class="product-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2019/04/D-PANTOTHENATE-Vitamin-B5-Calcium-247x247.jpg"
               alt="">
          <ul class="content">
            <li class="product-name">D(+) Pantothenate (Vitamin B5 Calcium, Duchefa, Cas 137-08-6)</li>
            <li class="product-price">1.200.000 VND</li>
            <li class="product-view">Lượt xem: 224</li>
            <li class="product-time">Ngày đăng: 12/4/2025</li>
          </ul>
        </div>
      </a>
      <a href="#">
        <div class="product-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2020/09/Yeast-Extract-Powder-247x247.jpg"
               alt="">
          <ul class="content">
            <li class="product-name">Yeast Extract Powder(Bacteriological Grade)</li>
            <li class="product-price">1.000.000 VND</li>
            <li class="product-view">Lượt xem: 524</li>
            <li class="product-time">Ngày đăng: 12/4/2025</li>
          </ul>
        </div>
      </a>
      <a href="#">
        <div class="product-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2023/12/Nicotinic-acid-duchefa-250G-247x247.jpg"
               alt="">
          <ul class="content">
            <li class="product-name">Nicotinic acid >99% (Vitamin B3, Duchefa, Cas 59-67-6)</li>
            <li class="product-price">1.500.000 VND</li>
            <li class="product-view">Lượt xem: 124</li>
            <li class="product-time">Ngày đăng: 12/4/2025</li>
          </ul>
        </div>
      </a>
      <a href="#">
        <div class="product-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2020/08/%C2%B1-%CE%B1-Tocopherol-%E2%89%A596-HPLC-T3251-247x247.jpg"
               alt="">
          <ul class="content">
            <li class="product-name">(±)-α-Tocopherol synthetic, ≥96% ( HPLC )</li>
            <li class="product-price">100.000 VND</li>
            <li class="product-view">Lượt xem: 424</li>
            <li class="product-time">Ngày đăng: 12/4/2025</li>
          </ul>
        </div>
      </a>
      <a href="#">
        <div class="product-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2024/10/L-Ascorbic-acid-Xilong-25G-Xanh-247x247.jpg"
               alt="">
          <ul class="content">
            <li class="product-name">L(+)-Ascorbic Acid 99.7% (Vitamin C, AR, Xilong, Cas 50-81-7)</li>
            <li class="product-price">120.000 VND</li>
            <li class="product-view">Lượt xem: 454</li>
            <li class="product-time">Ngày đăng: 15/4/2025</li>
          </ul>
        </div>
      </a>
      <a href="#">
        <div class="product-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2020/03/vitamin-sh-Schenk-Hildebrt-vitamin-mixture-247x247.jpg"
               alt="">
          <ul class="content">
            <li class="product-name">Schenk & Hildebr&t vitamin mixture (Duchefa)</li>
            <li class="product-price">1.250.000 VND</li>
            <li class="product-view">Lượt xem: 444</li>
            <li class="product-time">Ngày đăng: 2/4/2025</li>
          </ul>
        </div>
      </a>
      <a href="#">
        <div class="product-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2020/03/Cyanocobalamin-1G-247x247.jpg"
               alt="">
          <ul class="content">
            <li class="product-name">Cyanocobalamin >98% (Vitamin B12, Duchefa, Cas 68-19-9)</li>
            <li class="product-price">400.000 VND</li>
            <li class="product-view">Lượt xem: 154</li>
            <li class="product-time">Ngày đăng: 1/4/2025</li>
          </ul>
        </div>
      </a>
      <a href="#">
        <div class="product-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2019/09/Folic-acid-Vitamin-B9-Duchefa-247x247.jpg"
               alt="">
          <ul class="content">
            <li class="product-name">Folic acid >96% (Vitamin B9, Duchefa, Cas 59-30-3)</li>
            <li class="product-price">1.550.000 VND</li>
            <li class="product-view">Lượt xem: 224</li>
            <li class="product-time">Ngày đăng: 12/8/2025</li>
          </ul>
        </div>
      </a>
      <a href="#">
        <div class="product-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2019/09/Nicotiamide-Vitamin-PP-247x247.jpg"
               alt="">
          <ul class="content">
            <li class="product-name">Glycine 98.5% (Chai 1KG, Duchefa, Cas 56-40-6)</li>
            <li class="product-price">100.000 VND</li>
            <li class="product-view">Lượt xem: 424</li>
            <li class="product-time">Ngày đăng: 12/4/2025</li>
          </ul>
        </div>
      </a>
      <a href="#">
        <div class="product-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2019/04/Vitamin-B7-D-Biotine-247x247.jpg"
               alt="">
          <ul class="content">
            <li class="product-name">D(+)-BIOTINE (Vitamin B7, Chai 500mg, Duchefa, Cas 58-85-5)</li>
            <li class="product-price">120.000 VND</li>
            <li class="product-view">Lượt xem: 324</li>
            <li class="product-time">Ngày đăng: 1/4/2025</li>
          </ul>
        </div>
      </a>
      <a href="#">
        <div class="product-item">
          <img src="https://hoachatthinghiem.org/wp-content/uploads/2019/04/Vitamin-B2-Riboflavine-Duchefa-247x247.jpg"
               alt="">
          <ul class="content">
            <li class="product-name">Riboflavine >97% (Vitamin B2, Duchefa, Cas 83-88-5)</li>
            <li class="product-price">1.000.000 VND</li>
            <li class="product-view">Lượt xem: 424</li>
            <li class="product-time">Ngày đăng: 12/4/2025</li>
          </ul>
        </div>
      </a>
      <!--            chuyển trang-->
      <div class="pagination">
        <a href="list.html" class="page active">1</a>
        <a href="list5.html" class="page ">2</a>
        <a href="list6.html" class="page ">3</a>

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

<script src="../js/script.js"></script>
</body>
</html>
