
<%@ page import="java.util.Map" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.Products" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  List<Products> cart = (List<Products>) session.getAttribute("cart");
  Map<Integer, Integer> quantityMap = (Map<Integer, Integer>) session.getAttribute("quantityMap");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="x-ua-compatible" content="IE-edge">
  <title>Cart</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

    /*  Body*/
    .payment-info {
      background: #007bff;
      padding: 10px;
      border-radius: 6px;
      color: #fff;
      font-weight: bold;
    }

    .product-details {
      padding: 10px;
    }

    body {
      background: #eee;
    }
    .items {
      display: flex;
      flex-direction: row;
      align-items: center;
      justify-content: space-between;
    }

    .items img {
      max-width: 70px;
      max-height: 70px;
    }

    .items .font-weight-bold {
      font-size: 14px;
      line-height: 1.5;
    }

    .items button {
      min-width: 30px;
      height: 30px;
      text-align: center;
    }

    .items i {
      font-size: 20px;
    }

    .cart {
      background: #fff;
    }


    .d-block {
      margin-left: 50px;
    }
    .d-flex{
      font-size: 20px;

    }


    label.radio input {
      position: absolute;
      top: 0;
      left: 0;
      visibility: hidden;
      pointer-events: none;
    }

    label.radio span {
      padding: 1px 12px;
      border: 2px solid #ada9a9;
      display: inline-block;
      color: #8f37aa;
      border-radius: 3px;
      text-transform: uppercase;
      font-size: 11px;
      font-weight: 300;
    }

    label.radio input:checked + span {
      border-color: #fff;
      background-color: blue;
      color: #fff;
    }

    .credit-inputs {
      background: #2693E0;
      color: #fff !important;
      border-color: rgb(102,102,221);
    }

    .credit-inputs::placeholder {
      color: #fff;
      font-size: 13px;
    }

    .credit-card-label {
      font-size: 9px;
      font-weight: 300;
    }

    .form-control.credit-inputs:focus {
      background: rgb(102,102,221);
      border: rgb(102,102,221);
    }

    .line {
      border-bottom: 1px solid rgb(102,102,221);
    }

    .information span {
      font-size: 12px;
      font-weight: 500;
    }

    .information {
      margin-bottom: 5px;
    }

    .items {
      -webkit-box-shadow: 5px 5px 4px -1px rgba(0,0,0,0.25);
      box-shadow: 5px 5px 4px -1px rgba(0, 0, 0, 0.08);
    }

    /*Footer*/
    .footer {
      margin-top: 50px;
      background-color: #398BC4;
      color: white;
      padding: 20px;
      font-family:  sans-serif;
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
<div class="container mt-5 p-3 rounded cart">
  <div class="row no-gutters">
    <div class="col-md-8">
      <div class="product-details mr-2">
        <div class="d-flex flex-row align-items-center " ><i class="fa fa-long-arrow-left"></i><span class="ml-2 ">Tiếp tục mua sắm</span></div>
        <hr>

        <h3 style="color: #0746e6; margin-right: 20px"><i class="fa-solid fa-cart-plus" style="color: #0746e6"></i> Giỏ Hàng của tôi </h3>
        <!--                <div class="d-flex flex-row align-items-center"><span class="text-black-50">Sort by:</span>-->
        <!--                    <div class="price ml-2"><span class="mr-1">giá</span><i class="fa fa-angle-down"></i></div>-->
        <!--                </div>-->

        <div class="d-flex justify-content-between align-items-center mt-3 p-2 items rounded">
          <div class="d-flex flex-row align-items-center" style="flex: 1;">
            <ul>
                <%
        if (cart != null && !cart.isEmpty()) {
        double totalAmount = 0.0; // Biến để tính tổng giá
        for (Products product : cart) {
            int productId = product.getProductId();
            int quantity = quantityMap.get(productId);
            double productPrice = product.getPriceSell(); // Hoặc giá bạn muốn hiển thị
            double totalPrice = productPrice * quantity; // Tính tổng giá cho sản phẩm

            totalAmount += totalPrice; // Cộng dồn vào tổng giá
%>
              <tr>
                <td><%= productId %></td>
                <td><img src="<%= product.getImageProduct() %>" width="70" /></td>
                <td><%= product.getProductName() %></td>
                <td><%= productPrice %> VNĐ</td>
                <td><%= quantity %></td>
                <td><%= totalPrice %> VNĐ</td>
              </tr>
                <%
        }
%>
              <tr>
                <td colspan="5" style="text-align: right;"><strong>Tổng cộng:</strong></td>
                <td><strong><%= totalAmount %> VNĐ</strong></td>
              </tr>
                <%
    } else {
%>
              <tr>
                <td colspan="6">Giỏ hàng trống!</td>
              </tr>
                <%
    }
%>
            </ul>
           <!-- <img class="rounded" src="https://hoachatthinghiem.org/wp-content/uploads/2024/10/Oleanolic-acid-98-Cool-chemistry-25G-768x768.jpg" width="70">
            <div class="ml-3">
              <span class="font-weight-bold d-block">Oleanolic acid ≥98% (Cool Chemistry, Cas 508-02-1)</span>
            </div>
          </div>
          <div class="d-flex flex-row align-items-center justify-content-end" style="flex: 1;">
            <button class="btn btn-light btn-sm">-</button>
            <span class="d-block mx-2">1</span>
            <button class="btn btn-light btn-sm">+</button>
            <strong><span class="d-block ml-5 font-weight-bold">1.050.000VNĐ</span></strong>
            <i class="fa fa-trash text-danger ml-3" style="margin-left: 20px; width: 20px"></i>
          </div>
        </div>

        <div class="d-flex justify-content-between align-items-center mt-3 p-2 items rounded">
          <div class="d-flex flex-row align-items-center" style="flex: 1;">
            <img class="rounded" src="https://hoachatthinghiem.org/wp-content/uploads/2023/04/15-Diphenylcarbazide-98-Duksan-Cas-140-22-7-768x768.jpg" width="70">
            <div class="ml-3">
              <span class="font-weight-bold d-block">1,5 Diphenylcarbazide 98% (Duksan, Chai 25G, Cas 140-22-7)</span>
            </div>
          </div>
          <div class="d-flex flex-row align-items-center justify-content-end" style="flex: 1;">
            <button class="btn btn-light btn-sm">-</button>
            <span class="d-block mx-2">1</span>
            <button class="btn btn-light btn-sm">+</button>
            <strong><span class="d-block ml-5 font-weight-bold">1.000.000VNĐ</span></strong>
            <i class="fa fa-trash text-danger ml-3" style="margin-left: 20px; width: 20px"></i>-->
          </div>
        </div>

      </div>
    </div>
    <div class="col-md-4">
      <div class="payment-info">
        <div class="d-flex justify-content-between align-items-center"><span>Phương thức thanh toán</span></div>

        <hr class="line">
        <div class="d-flex justify-content-between information"><span style="font-size: 14px">Tạm tính:</span><span style="font-size: 16px">2.050.000 VNĐ</span></div>
        <div class="d-flex justify-content-between information"><span style="font-size: 14px">Phí ship:</span><span style="font-size: 16px">20.000 VNĐ</span></div>
        <div class="d-flex justify-content-between information"><span style="font-size: 14px">Tổng tiền:</span><span style="font-size: 16px">2.070.000 VNĐ</span></div>

        <hr class="line">
        <button class="btn btn-primary btn-block mt-3" type="button"style="background-color: blue">Thanh toán trực tiếp</button>
        <button class="btn btn-primary btn-block mt-3" type="button" style="float: right; background-color: #28a745">Chuyển khoản</button>
        <div><label class="credit-card-label" style="font-size: 14px"> Họ tên chủ thẻ </label><input type="text" class="form-control credit-inputs" placeholder="..."></div>
        <div><label class="credit-card-label" style="font-size: 14px">Số thẻ</label><input type="text" class="form-control credit-inputs" placeholder="0000 0000 0000 0000"></div>
        <div><label class="credit-card-label" style="font-size: 14px">Ngân hàng</label><input type="text" class="form-control credit-inputs" placeholder="..."></div>
        <button class="btn btn-primary btn-block" type="submit" style="margin:10px; background-color: orange">Đặt hàng</button>
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
