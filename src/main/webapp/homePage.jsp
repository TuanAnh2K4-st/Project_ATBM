<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.Products" %>
<!DOCTYPE html>
<html lang="vi">
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
  <link rel="stylesheet" href="css/header.css" />
  <link rel="stylesheet" href="css/footer.css" />
  <link rel="stylesheet" href="css/homePage.css" />
  <script>
    $(document).ready(function() {
      $(".next").click(function() {
        let productList = $(this).siblings(".product-list");
        productList.animate({scrollLeft: '+=300'}, 400);
      });

      $(".prev").click(function() {
        let productList = $(this).siblings(".product-list");
        productList.animate({scrollLeft: '-=300'}, 400);
      });
    });
  </script>
  <!-- Các link CSS, JS ở đây -->
</head>
<body>
<%--Header--%>
<jsp:include page="header.jsp" />

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
          <ul class="content">
            <li class="product-name"><%= product.getProductName() %></li>
            <li class="product-price"><%= product.getPriceSell() %> VND</li>
            <li class="product-view">Mức độ: <%= product.getHozandLevel() %></li>
            <li class="product-time">
              Ngày đăng:
              <fmt:formatDate value="<%= product.getCreateAt() %>" pattern="dd/MM/yyyy" />
            </li>
          </ul>
          <form action="detail" method="GET">
            <input type="hidden" name="id" value="<%= product.getProductId() %>">
            <button type="submit">Xem chi tiết</button>
          </form>
        </div>
        <%
            }
          }
        %>
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
<%--Footer--%>
<jsp:include page="footer.jsp" />

</body>
</html>
