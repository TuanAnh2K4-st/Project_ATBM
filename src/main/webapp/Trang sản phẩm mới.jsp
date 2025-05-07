<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="IE-edge">
    <title>Sản Phẩm Mới</title>
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


        .product-lists {
            position: relative;
            display: grid;
            grid-template-columns: repeat(4, 200px);
            grid-auto-rows: auto;
            gap: 20px;
            padding-left: 20px;
            padding-bottom: 80px;
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

        .product-price {
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
            z-index: 1;
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

        .main-content {
            justify-content: space-between;
            align-items: center;
            padding-right: 20px;

        }
        .products{
            padding-left: 60px;
            gap:70px;
        }


    </style>
</head>
<body>

<!--Header-->
<div class="sticky">
    <div class="container-flugin">
        <div class="row">
            <div class="col-3">
                <a href="Trang_chu.jsp"><img src="img/logo CAD_Xóa nền.png" class="logo" height="150"
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
<div class="products">
    <!--        khung chứa các thông tin và các cách sắp xếp-->
    <div class="sidebar" style="
    width: 260px;
    background: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    font-family: 'Arial', sans-serif;
">
        <h2 style="
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 15px;
        color: #333;
        text-transform: uppercase;
        text-align: center;
    ">Bộ lọc</h2>

        <form id="filterForm" action="list-product" method="get">
            <!-- Lọc theo Hãng -->
            <div class="filter-group" style="margin-bottom: 15px;">
                <label for="brand" style="font-weight: 600; display: block; margin-bottom: 5px; color: #555;">Hãng:</label>
                <select name="brand" id="brand" style="
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 14px;
                transition: all 0.3s ease;
            ">
                    <option value="">Tất cả</option>
                    <option value="Pyrex">Pyrex</option>
                    <option value="Thiên Hà Xanh">Thiên Hà Xanh</option>
                    <option value="Duchefa Hà Lan">Duchefa Hà Lan</option>
                </select>
            </div>

            <!-- Lọc theo Thể tích -->
            <div class="filter-group" style="margin-bottom: 15px;">
                <label for="volume" style="font-weight: 600; display: block; margin-bottom: 5px; color: #555;">Thể tích:</label>
                <select name="volume" id="volume" style="
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 14px;
            ">
                    <option value="">Tất cả</option>
                    <option value="Lít">Lít</option>
                    <option value="kg">kg</option>
                </select>
            </div>

            <!-- Sắp xếp theo giá -->
            <div class="filter-group" style="margin-bottom: 15px;">
                <label for="sortPrice" style="font-weight: 600; display: block; margin-bottom: 5px; color: #555;">Sắp xếp giá:</label>
                <select name="sortPrice" id="sortPrice" style="
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 14px;
            ">
                    <option value="">Mặc định</option>
                    <option value="asc">Giá thấp đến cao</option>
                </select>
            </div>

            <!-- Nút Lọc -->
            <div class="filter-group" style="margin-bottom: 15px;">
                <button type="submit" style="
                width: 100%;
                background: #007bff;
                color: white;
                font-size: 16px;
                font-weight: bold;
                padding: 10px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.3s ease-in-out;
            ">Lọc</button>
            </div>
        </form>

        <!-- Thông tin HOT -->
        <div class="hot-info" style="
        margin-top: 20px;
        padding: 15px;
        background: #f8f9fa;
        border-radius: 6px;
    ">
            <div class="hot-item" style="
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        ">
                <h3 style="font-size: 16px; color: #007bff; margin-bottom: 5px;">Sản phẩm khuyến mãi</h3>
                <p style="font-size: 14px; color: #555;">Giảm giá đến 50% cho các sản phẩm mùa hè.</p>
            </div>
            <div class="hot-item" style="
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        ">
                <h3 style="font-size: 16px; color: #007bff; margin-bottom: 5px;">Sản phẩm mới</h3>
                <p style="font-size: 14px; color: #555;">Đón chào loạt sản phẩm mới với nhiều tính năng hiện đại.</p>
            </div>
            <div class="hot-item" style="
            padding: 10px 0;
        ">
                <h3 style="font-size: 16px; color: #007bff; margin-bottom: 5px;">Ưu đãi đặc biệt</h3>
                <p style="font-size: 14px; color: #555;">Nhận ngay ưu đãi cho khách hàng thân thiết!</p>
            </div>
        </div>
    </div>

    <!--        khung chứa các sản phẩm-->
    <div class="main-content">
        <div class="type">
            <h3>Sản phẩm mới</h3>
        </div>
        <div class="product-lists">
            <!-- Duyệt qua danh sách sản phẩm -->
            <c:forEach var="products" items="${data}">
                <a href="detail?id=${products.productId}">
                    <div class="product-item">
                        <!-- Sử dụng thuộc tính imageProduct cho ảnh sản phẩm -->
                        <img src="${products.imageProduct}" alt="sản phẩm">
                        <ul class="content">
                            <!-- Sử dụng productName và priceSell -->
                            <li class="product-name">${products.productName}</li>
                            <li class="product-price">${products.priceSell} VND</li>
                            <li class="product-view">Mức độ: ${products.hozandLevel}</li>
                            <li class="product-time">Ngày đăng:
                                <fmt:formatDate value="${products.createAt}" pattern="dd/MM/yyyy" />
                            </li>
                        </ul>
                        <!-- Form gửi ID sản phẩm -->
                        <form action="detail" method="GET">
                            <input type="hidden" name="id" value="${products.productId}">
                            <button type="submit">Xem chi tiết</button>
                        </form>
                    </div>
                </a>
            </c:forEach>

            <!-- Phân trang -->
            <div class="pagination">
                <!-- Duyệt qua các số trang -->
                <c:forEach var="pageNumber" begin="1" end="${totalPages}">
                    <a href="list-product?page=${pageNumber}" class="page ${pageNumber == currentPage ? 'active' : ''}">
                            ${pageNumber}
                    </a>
                </c:forEach>
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
<script src="../js/script.js"></script>
</body>
</html>