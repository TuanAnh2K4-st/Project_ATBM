<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Header.jsp -->
<div class="sticky">
  <div class="container-flugin">
    <div class="row">
      <div class="col-3">
        <a><img src="img/logo CAD_Xóa nền.png" class="logo" height="150" width="auto"/></a>
      </div>
      <div class="col-6 d-flex justify-content-center align-items-center">
        <form action="${pageContext.request.contextPath}/search" method="GET" class="d-flex" style="width: 750px; height: 40px;">
          <input class="form-control me-2" type="text" value="${querryS}" name="querry" placeholder="Nhập tên hóa chất, mã CAS,...." aria-label="Search" style="height: 100%; width: 90%">
          <button class="btn btn-outline-success" type="submit" style="height: 100%; width: 10%;font-weight: bold">Tìm</button>
        </form>
      </div>
      <div class="col-3 d-flex justify-content-end align-items-center">
        <a href="Trang giỏ hàng.jsp"><i class="fa-solid fa-cart-plus" style="color: #2693E0; font-size: 30px; margin: 30px"></i></a>
        <a href="Trang_thong_tin_user.jsp"><i class="fas fa-user" id="user" style="color: #2693E0; font-size: 30px; margin: 30px;"></i></a>
      </div>
    </div>
  </div>
  <div class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="homePage"><i class="fa-solid fa-house" style=" font-size: 22px; color: white"></i> Trang chủ</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Danh sách sản phẩm</a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="list-product">Mới nhất</a></li>
              <li><a class="dropdown-item" href="#">Nổi bật</a></li>
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
          <li class="nav-item"><a class="nav-link" href="#">Thông tin web</a></li>
          <li class="nav-item"><a class="nav-link" href="Trang tin tức.jsp">Tin tức</a></li>
          <li class="nav-item"><a class="nav-link" href="Trang liên hệ.jsp">Liên hệ</a></li>
          <li class="nav-item"><a class="nav-link" href="managerKey">Quản lý Khoá</a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
