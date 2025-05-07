<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--Chúng ta có thể đặt các tệp JSP ở bất kỳ vị trí nào trong tệp WAR, tuy nhiên nếu chúng ta đặt nó bên trong thư mục WEB-INF,
chúng ta sẽ không thể truy cập trực tiếp từ máy khách. Chúng ta có thể cấu hình JSP giống như servlet trong web.xml,
ví dụ nếu tôi có một trang ví dụ JSP như bên dưới bên trong thư mục WEB-INF: `test.jsp`

```-->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

  <style>
    html, body {
      font-family: Tahoma, sans-serif;
      height: 100vh;
      width: 100%;
      margin: 0;
      display: flex;
    }

    .sidebar {
      display: flex;
      flex-direction: column;
      width: 15%;
      background-color: #0056b3;
      color: white;
      box-sizing: border-box;
      height: 100vh;
      padding: 20px;
    }

    .avatar {
      padding: 0px;
      background-color: #2693E0;
      margin-bottom: 20px;
      text-align: center;
    }

    .avatar img {
      width: 50px;
      height: 50px;
      border-radius: 50%; /* Tạo hình tròn cho avatar */
      margin-bottom: 10px; /* Khoảng cách giữa avatar và tên*/
    }

    nav ul {
      list-style-type: none;
      padding: 0;
    }

    nav ul li {
      margin: 10px 0;
      display: flex;
      align-items: flex-start;
    }

    nav ul li a {
      color: white;
      text-decoration: none;
      margin-left: 15px; /* Khoảng cách giữa icon và text */
    }

    .content {
      flex-grow: 2;
      padding: 20px;
      overflow-y: auto;
      background-color: #b3d4fc;
      margin-bottom: 10px;
      height: 100vh;
      box-sizing: border-box;
    }

    .content section {
      display: none;
    }

    .content section.active {
      display: block;
    }

    .dashboard-overview {
      display: flex;
      gap: 20px;
    }

    .card {
      flex: 1 1 calc(50% - 20px);
      margin-bottom: 20px;
      padding: 15px;
      background-color: white;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .container {
      max-width: 100%;
      margin: 0 auto;
      background: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);


    }

    h1 {
      text-align: center;
      color: #333;
    }
    h3{
      padding: 5px;
      margin-bottom: 5px;
      text-align: left;
    }
    .search-bar {
      margin-bottom: 20px;
      display: flex;
      justify-content: center; /* Canh giữa theo chiều ngang */
      align-items: center; /* Canh giữa theo chiều dọc (nếu cần) */
      gap: 10px; /* Khoảng cách giữa thanh tìm kiếm và nút */
    }

    .search-bar input {
      width: 800px; /* Đặt chiều rộng cụ thể cho thanh tìm kiếm */
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }

    .search-bar button {
      padding: 10px 20px; /* Đặt khoảng padding lớn hơn cho nút */
      background-color: white;
      color: #333333;
      border: solid 1px #555555;
      border-radius: 5px;
      cursor: pointer;
    }

    .search-bar button:hover {
      background-color: #1e90ff;
      color: white;
    }

    table {

      width: 80%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      padding: 12px;
      text-align: center;
      border: 1px solid #ddd;
    }

    th {
      background-color: #1e90ff;
      color: white;
    }

    .actions button {
      padding: 8px 12px;
      font-size: 14px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
      margin-right: 5px;
    }

    .actions .edit-btn {
      background-color: #ffc107;
      color: white;
    }

    .actions .edit-btn:hover {
      background-color: #e0a800;
    }

    .actions .delete-btn {
      background-color: #dc3545;
      color: white;
    }

    .actions .delete-btn:hover {
      background-color: #bd2130;
    }

    .status {
      padding: 5px 10px;
      border-radius: 5px;
      color: white;
      font-weight: bold;
    }

    .aactive {
      background-color: #28a745;
    }

    .inactive {
      background-color: #dc3545;
    }

    /* Khung tổng quan */
    .summary {
      display: flex;
      justify-content: space-between;
      margin: 20px 180px;


    }

    .summary-card, .old-summary-card {
      width: 300px; /* Đặt chiều rộng là 500px */
      height: 300px; /* Đặt chiều cao là 500px */
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 20px ;
      margin: 0 10px;
      background: linear-gradient(135deg, #28a745, #218838);
      color: white;
      border-radius: 8px; /* Bo góc nhẹ */
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      text-align: center;
      transition: transform 0.2s ease;
    }


    .old-summary-card {
      background: linear-gradient(135deg, #FFA726, #FB8C00);

    }

    .old-summary-card:hover, .summary-card:hover {
      transform: scale(1.05);
    }

    .old-summary-card h2, .summary-card h2 {
      font-weight: bold;
      font-size: 3rem;
      margin: 0;
    }

    .old-summary-card p, .summary-card p {
      font-size: 1.5rem;
    }

    .product-section {
      margin-top: 30px;
      margin-bottom: 15px;
      text-align: center;
    }

    .product-section label {
      font-size: 1.2rem;
      font-weight: bold;
      color: #333;
      margin-bottom: 10px;
      display: block;
    }

    .product-section select {
      width: 50%;
      padding: 12px;
      font-size: 1rem;
      border: 2px solid #ddd;
      border-radius: 8px;
      background-color: #fff;
      color: #333;
      cursor: pointer;
      transition: all 0.3s ease;
    }
    .product-section label{
      font-size: 1.2rem;
      margin-bottom: 10px;
      display: block;
    }
    .product-section input{
      margin-top: 10px;
      padding: 10px;
    }
    .product-section select:focus {
      border-color: #FFA726; /* Màu cam khi chọn */
      box-shadow: 0 0 10px rgba(255, 165, 38, 0.5); /* Màu cam sáng khi chọn */
      outline: none;
    }

    .product-section select option {
      padding: 10px;
      font-size: 1rem;
    }

    .product-section select option:hover {
      background-color: #f2f2f2;
    }
    .settings-info{
      background-color: white;
      margin: 10px;
      display: flex;
      border: solid #2693E0 0.5px;
      padding: 5px 10px 5px 10px;
    }
    .settings-info form{
      flex: 1;
      flex-direction: column;
      margin: 10px 5px 5px 5px;
      text-align: left;

    }.form-group.row {
       display: flex;
       align-items: center;
       gap: 5px;
     }
    .form-group.row input{
      flex:1;
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    .search-container {
      text-align: center;
      margin-bottom: 20px;
    }

    .search {
      width: 300px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .button-search {
      padding: 10px 15px;
      border: none;
      background-color: #007bff;
      color: #fff;
      cursor: pointer;
      border-radius: 4px;
    }

    button:hover {
      background-color: #0056b3;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: #fff;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    th, td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: center;
    }

    th {
      background-color: #007bff;
      color: white;
    }

    .aactive {
      background-color: #28a745;
      color: white;
      padding: 5px;
      border-radius: 3px;
    }

    .inactive {
      background-color: #dc3545;
      color: white;
      padding: 5px;
      border-radius: 3px;
    }

    .btn-edit {
      background-color: #ffc107;
      color: #fff;
      border: none;
      border-radius: 3px;
      padding: 5px 10px;
      cursor: pointer;
    }

    .btn-delete {
      background-color: #dc3545;
      color: #fff;
      border: none;
      border-radius: 3px;
      padding: 5px 10px;
      cursor: pointer;
    }

    .btn-edit:hover {
      background-color: #e0a800;
    }

    .btn-delete:hover {
      background-color: #c82333;
    }
    .highlight {
      background-color: #28a745;
      color: #fff;
      padding: 5px;
      border-radius: 3px;
    }

  </style>
</head>
<body>
<div class="sidebar">

  <!-- Sidebar -->
  <h3>Trang chủ Admin</h3>
  <div class="avatar">
    <div class="avatar img">
      <img src="img/avatar.jpg" alt="Admin Avatar">
      <span>Admin CAD</span> <!-- Thay tên admin -->

    </div>
    <nav>
      <ul>
        <li><a href="#dashboard" onclick="showSection('dashboard')"><i class="fa fa-chart-line"></i> Bảng điều
          khiển</a></li>
        <li><a href="#products" onclick="showSection('products')"><i class="fa fa-box"></i> Quản lý Sản phẩm</a>
        </li>
        <li><a href="#orders" onclick="showSection('orders')"><i class="fa fa-shopping-cart"></i> Quản lý Đơn
          hàng</a></li>
        <li><a href="#customers" onclick="showSection('customers')"><i class="fa fa-users"></i> Quản lý Khách
          hàng</a></li>
        <li><a href="#inventory" onclick="showSection('inventory')"><i class="fa fa-warehouse"></i> Quản lý Kho</a>
        </li>
        <li><a href="#discount" onclick="showSection('discount')"><i class="fa-sharp fa-solid fa-file"></i> Quản lý mã giảm giá</a></li>
        <li><a href="#settings" onclick="showSection('settings')"><i class="fa fa-cogs"></i> Cài Đặt</a></li>
        <li><a href="#users" onclick="showSection('users')"><i class="fa-solid fa-user"></i> Tài khoản người dùng</a></li>

      </ul>
    </nav>
  </div>
</div>
<!-- Main Content -->
<main class="content">
  <section id="dashboard" class="active">
    <h2>Bảng điều khiển</h2>
    <div class="dashboard-overview">
      <div class="card">
        <h3>Doanh thu</h3>
        <canvas id="revenueChart"></canvas>
      </div>
      <div class="card">
        <h3>Khách hàng mới</h3>
        <canvas id="customerChart"></canvas>
      </div>
    </div>
  </section>
  <section id="products" class="product-section">
    <div class="container"style="background: #b3d4fc;box-shadow: none">
      <h2>Quản lý Sản phẩm</h2>
      <div class="product-list">
        <div class="card">
          <h3>Danh sách sản phẩm</h3>
          <table style="width: 100%; border-collapse: collapse;">
            <thead>
            <tr>
              <th>Tên</th>
              <th>Mã</th>
              <th>Hình ảnh</th>
              <th>Hãng</th>
              <th>Số lượng tồn kho</th>
              <th>Giá bán</th>
              <th>Chỉnh sửa</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>Hóa chất A</td>
              <td>HC001</td>
              <td><img src="https://hoachatthinghiem.org/wp-content/uploads/2024/10/Sodium-Dodecylsulfonate-%E2%89%A597-AR-Chai-250G-Xilong-Cas-2386-53-0-768x768.jpg"
                       alt="Hóa chất A" style="width:50px;"></td>
              <td>Xilong</td>
              <td>100</td>
              <td>750.000 VND</td>
              <td>
                <button>Sửa</button>
              </td>
            </tr>
            <tr>
              <td>Hóa chất B</td>
              <td>HC002</td>
              <td><img src="https://hoachatthinghiem.org/wp-content/uploads/2024/11/Glycine-100g-merck.jpg"
                       alt="Hóa chất B" style="width:50px;"></td>
              <td>Xilong</td>
              <td>40</td>
              <td>1.200.000 VND</td>
              <td>
                <button>Sửa</button>
              </td>
            </tr>

            </tbody>
          </table>
        </div>
        <!-- Phần thêm và xóa sản phẩm -->
        <div class="product-list">
          <div class="card">
            <form>
              <h3>Thêm sản phẩm</h3>
              <div class="form-group row">
                <label for="productCode" class="col-sm-2 col-form-label">Mã sản phẩm:</label>
                <div class="col-sm-2">
                  <input type="number" id="productCode" class="form-control" required></div>

                <label for="productName" class="col-sm-2 col-form-label">Tên sản phẩm:</label>
                <div class="col-sm-2">
                  <input type="text" id="productName" class="form-control" required></div>

                <label for="productBrand" class="col-sm-2 col-form-label">Hãng:</label>
                <div class="col-sm-2">
                  <input type="text" id="productBrand" class="form-control" required></div>

                <label for="productStock" class="col-sm-2 col-form-label">Số lượng tồn kho:</label>
                <div class="col-sm-2">
                  <input type="number" id="productStock" class="form-control" required></div>

                <label for="productImage" class="col-sm-2 col-form-label">Hình ảnh sản phẩm:</label>
                <div class="col-sm-2">
                  <input type="file" id="productImage" class="form-control" required></div>

                <label for="productPrice" class="col-sm-2 col-form-label">Giá bán:</label>
                <div class="col-sm-2">
                  <input type="text" id="productPrice" class="form-control" required></div>

              </div>
              <div class="row"><button type="submit" class="btn btn-success">Thêm sản phẩm</button></div>
            </form>
          </div>
          <div class="card">
            <h3>Xóa sản phẩm</h3>
            <div class="form-group row" style="display: flex; align-items: center">
              <label for="productToDelete" class="col-sm-2 col-form-label">Mã sản phẩm để xóa:</label>
              <input type="number" id="productToDelete" class="form-control col-sm-5">
              <button class="btn btn-danger" id="deleteProductButton">Xóa sản phẩm</button>

            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <section id="orders">
    <div class="container mt-5">
      <h1 class="mb-4 text-center">Quản lý đơn hàng</h1>

      <!-- Bộ lọc đơn hàng -->
      <div class="card p-3 mb-4">
        <h5 class="mb-3">Bộ lọc</h5>
        <div class="row g-3">
          <div class="col-md-4">
            <input type="text" class="form-control" placeholder="Tìm kiếm mã đơn hàng hoặc khách hàng">
          </div>
          <div class="col-md-3">
            <select class="form-select">
              <option selected>Chọn trạng thái</option>
              <option value="1">Đang xử lý</option>
              <option value="2">Hoàn thành</option>
              <option value="3">Đã hủy</option>
            </select>
          </div>
          <div class="col-md-3">
            <input type="date" class="form-control" placeholder="Ngày đặt hàng">
          </div>
          <div class="col-md-2">
            <button class="btn btn-primary w-100">Tìm kiếm</button>
          </div>
        </div>
      </div>

      <!-- Danh sách đơn hàng -->
      <div class="card">
        <div class="card-body">
          <table class="table table-hover align-middle">
            <thead class="table-dark">
            <tr>
              <th scope="col">#</th>
              <th scope="col">Mã đơn hàng</th>
              <th scope="col">Khách hàng</th>
              <th scope="col">Trạng thái</th>
              <th scope="col">Ngày đặt hàng</th>
              <th scope="col">Tổng giá trị</th>
              <th scope="col" class="text-center">Hành động</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1</td>
              <td>DH12345</td>
              <td>Nguyễn Văn A</td>
              <td><span class="badge bg-warning">Đang xử lý</span></td>
              <td>2024-12-01</td>
              <td>1.500.000 VNĐ</td>
              <td class="text-center">
                <button class="btn btn-sm btn-info">Chi tiết</button>
                <button class="btn btn-sm btn-primary">Sửa</button>
                <button class="btn btn-sm btn-danger">Xóa</button>
              </td>
            </tr>
            <tr>
              <td>2</td>
              <td>DH12346</td>
              <td>Trần Thị B</td>
              <td><span class="badge bg-success">Hoàn thành</span></td>
              <td>2024-12-01</td>
              <td>850.000 VNĐ</td>
              <td class="text-center">
                <button class="btn btn-sm btn-info">Chi tiết</button>
                <button class="btn btn-sm btn-primary">Sửa</button>
                <button class="btn btn-sm btn-danger">Xóa</button>
              </td>
            </tr>
            <tr>
              <td>3</td>
              <td>DH12347</td>
              <td>Phạm Văn C</td>
              <td><span class="badge bg-danger">Đã hủy</span></td>
              <td>2024-12-02</td>
              <td>2.300.000 VNĐ</td>
              <td class="text-center">
                <button class="btn btn-sm btn-info">Chi tiết</button>
                <button class="btn btn-sm btn-primary">Sửa</button>
                <button class="btn btn-sm btn-danger">Xóa</button>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  </section>
  <section id="customers">
    <div class="container" >
      <h2>Quản lý thông tin khách hàng</h2>
      <div class="search-container">
        <input class="search" type="text" placeholder="Tìm kiếm khách hàng..."/>
        <button class="button-search">Tìm kiếm</button>
      </div>
      <table>
        <thead>
        <tr>
          <th>ID</th>
          <th>Tên</th>
          <th>Email</th>
          <th>Ngày sinh</th>
          <th>SĐT</th>
          <th>Địa chỉ</th>
          <th>Giới tính</th>
          <th>Nghề</th>
          <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>1</td>
          <td>Nguyễn Văn A</td>
          <td>nguyenvana@example.com</td>
          <td>01/01/1990</td>
          <td>0123456789</td>
          <td>123 Đường ABC, TP.HCM</td>
          <td>Nam</td>
          <td>Giáo viên</td>
          <td>
            <button class="btn-edit">Sửa</button>
            <button class="btn-delete">Xóa</button>
          </td>
        </tr>
        <tr>
          <td>2</td>
          <td>Trần Thị B</td>
          <td>tranthib@example.com</td>
          <td>10/10/1995</td>
          <td>0987654321</td>
          <td>456 Đường XYZ, Hà Nội</td>
          <td>Nữ</td>
          <td>Kế toán</td>
          <td>
            <button class="btn-edit">Sửa</button>
            <button class="btn-delete">Xóa</button>
          </td>
        </tr>
        <tr>
          <td>3</td>
          <td>Lê Minh C</td>
          <td>leminhc@example.com</td>
          <td>15/03/1998</td>
          <td>0931234567</td>
          <td>789 Đường MNO, Đà Nẵng</td>
          <td>Nam</td>
          <td>Kỹ sư</td>
          <td>
            <button class="btn-edit">Sửa</button>
            <button class="btn-delete">Xóa</button>
          </td>
        </tr>
        </tbody>
      </table>
    </div>
  </section>
  <section id="inventory">
    <div class="container">
      <h2 class="text-center my-4">Quản lý Kho</h2>
      <!-- Bảng danh sách kho -->
      <div class="table-responsive">
        <table class="table table-bordered table-striped">
          <thead class="thead-dark">
          <tr>
            <th>#</th>
            <th>Tên sản phẩm</th>
            <th>Mã sản phẩm</th>
            <th>Số lượng tồn kho</th>
            <th>Đơn vị tính</th>
            <th>Hành động</th>
          </tr>
          </thead>
          <tbody id="inventoryTableBody">
          <tr>
            <td>1</td>
            <td>Hóa chất A</td>
            <td>HC001</td>
            <td>100</td>
            <td>Chai</td>
            <td>
              <button class="btn btn-sm btn-primary" onclick="editItem(this)">Sửa</button>
              <button class="btn btn-sm btn-danger" onclick="deleteItem(this)">Xóa</button>
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>Hóa chất B</td>
            <td>HC002</td>
            <td>50</td>
            <td>Thùng</td>
            <td>
              <button class="btn btn-sm btn-primary" onclick="editItem(this)">Sửa</button>
              <button class="btn btn-sm btn-danger" onclick="deleteItem(this)">Xóa</button>
            </td>
          </tr>
          </tbody>
        </table>
      </div>

      <!-- Form thêm sản phẩm -->
      <div class="card my-4">
        <div class="card-header bg-primary text-white">
          <h4>Thêm Sản phẩm vào Kho</h4>
        </div>
        <div class="card-body">
          <form id="addInventoryForm">
            <div class="row">
              <div class="form-group col-md-3">
                <label for="NameproductName">Tên sản phẩm</label>
                <input type="text" id="NameproductName" class="form-control" required>
              </div>
              <div class="form-group col-md-3">
                <label for="productCode">Mã sản phẩm</label>
                <input type="text" id="product" class="form-control" required>
              </div>
              <div class="form-group col-md-3">
                <label for="productQuantity">Số lượng</label>
                <input type="number" id="productQuantity" class="form-control" required>
              </div>
              <div class="form-group col-md-3">
                <label for="unit">Đơn vị tính</label>
                <input type="text" id="unit" class="form-control" required>
              </div>
            </div>
            <button type="submit" class="btn btn-success">Thêm vào kho</button>
          </form>
        </div>
      </div>
    </div>
    <script>
      // Xử lý thêm sản phẩm vào kho
      document.getElementById('addInventoryForm').addEventListener('submit', function (e) {
        e.preventDefault();
        const productName = document.getElementById('NameproductName').value;
        const productCode = document.getElementById('product').value;
        const productQuantity = document.getElementById('productQuantity').value;
        const unit = document.getElementById('unit').value;

        const tableBody = document.getElementById('inventoryTableBody');
        const newRow = tableBody.insertRow();
        newRow.innerHTML = `
      <td>${tableBody.rows.length + 1}</td>
      <td>${productName}</td>
      <td>${productCode}</td>
      <td>${productQuantity}</td>
      <td>${unit}</td>
      <td>
        <button class="btn btn-sm btn-primary" onclick="editItem(this)">Sửa</button>
        <button class="btn btn-sm btn-danger" onclick="deleteItem(this)">Xóa</button>
      </td>
    `;

        // Reset form
        document.getElementById('addInventoryForm').reset();
      });

      // Xử lý chỉnh sửa sản phẩm
      function editItem(button) {
        const row = button.closest('tr');
        const columns = row.children;
        const productName = prompt('Tên sản phẩm:', columns[1].innerText);
        const productCode = prompt('Mã sản phẩm:', columns[2].innerText);
        const productQuantity = prompt('Số lượng tồn kho:', columns[3].innerText);
        const unit = prompt('Đơn vị tính:', columns[4].innerText);

        if (productName && productCode && productQuantity && unit) {
          columns[1].innerText = NameproductName;
          columns[2].innerText = product;
          columns[3].innerText = productQuantity;
          columns[4].innerText = unit;
        }
      }

      // Xử lý xóa sản phẩm
      function deleteItem(button) {
        if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')) {
          const row = button.closest('tr');
          row.remove();
        }
      }
    </script>
  </section>
  <section id="discount">
    <div class="container">
      <h2>Quản lý mã giảm giá</h2>
      <div class="search-container">
        <input class="search" type="text" placeholder="Tìm kiếm mã giảm giá..." />
        <button class="button-search">Tìm kiếm</button>
      </div>
      <table>
        <thead>
        <tr>
          <th>ID</th>
          <th>Tên mã</th>
          <th>Loại</th>
          <th>Giá trị giảm</th>
          <th>Ngày bắt đầu</th>
          <th>Ngày kết thúc</th>
          <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>1</td>
          <td>GIAM50K</td>
          <td>Giảm tiền</td>
          <td>50.000 VNĐ</td>
          <td>01/07/2024</td>
          <td>15/07/2024</td>
          <td>
            <button class="btn-edit">Sửa</button>
            <button class="btn-delete">Xóa</button>
          </td>
        </tr>
        <tr>
          <td>2</td>
          <td>SALE20%</td>
          <td>Giảm phần trăm</td>
          <td>20%</td>
          <td>05/07/2024</td>
          <td>20/07/2024</td>
          <td>
            <button class="btn-edit">Sửa</button>
            <button class="btn-delete">Xóa</button>
          </td>
        </tr>
        <tr>
          <td>3</td>
          <td>FREESHIP</td>
          <td>Miễn phí vận chuyển</td>
          <td><span class="highlight">Miễn phí</span></td>
          <td>10/07/2024</td>
          <td>31/07/2024</td>
          <td>
            <button class="btn-edit">Sửa</button>
            <button class="btn-delete">Xóa</button>
          </td>
        </tr>
        </tbody>
      </table>
    </div>
  </section>
  <section id="settings">
    <h2>Cài đặt</h2>
    <!-- Thông tin cá nhân -->

    <h4>⁜ Thông tin cá nhân</h4>
    <div class="settings-info">

      <form>
        <label for="avatar">Ảnh đại diện:</label>
        <input type="file" id="avatar" name="avatar" accept="avatar.jpg">

        <label for="display-name">Tên hiển thị:</label>
        <input type="text" id="display-name" name="display-name" placeholder="Admin CAD">

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="ttth@aic.hcmuaf.edu.vn">

        <label for="phone">Số điện thoại:</label>
        <input type="tel" id="phone" name="phone" placeholder="028.3896.1713">

        <button type="submit">Lưu thay đổi</button>
      </form>
    </div>


    <!-- Thay đổi mật khẩu -->
    <h4> ⁜ Thay đổi mật khẩu</h4>
    <div class="settings-info">
      <form>
        <label for="old-password">Mật khẩu cũ:</label>
        <input type="password" id="old-password" name="old-password" placeholder="Nhập mật khẩu cũ">

        <label for="new-password">Mật khẩu mới:</label>
        <input type="password" id="new-password" name="new-password" placeholder="Nhập mật khẩu mới">

        <label for="confirm-password">Xác nhận mật khẩu:</label>
        <input type="password" id="confirm-password" name="confirm-password" placeholder="Nhập lại mật khẩu mới">

        <button type="submit">Cập nhật mật khẩu</button>
      </form>
    </div>

    <!-- Cài đặt giao diện -->
    <h4>⁜ Cài đặt giao diện</h4>
    <div class="settings-info">
      <form>
        <label for="theme">Chủ đề:</label>
        <select id="theme" name="theme">
          <option value="light">Sáng</option>
          <option value="dark">Tối</option>
        </select>

        <label for="font-size">Kích thước phông chữ:</label>
        <select id="font-size" name="font-size">
          <option value="small">Nhỏ</option>
          <option value="medium">Vừa</option>
          <option value="large">Lớn</option>
        </select>

        <button type="submit">Lưu cài đặt</button>
      </form>
    </div>

    <!-- Cài đặt thông báo -->
    <h4>⁜ Cài đặt thông báo</h4>
    <div class="settings-info">
      <form>
        <label>
          <input type="checkbox" name="email-notifications"> Thông báo qua email
        </label>
        <label>
          <input type="checkbox" name="app-notifications"> Thông báo trên ứng dụng
        </label>
        <label>
          <input type="checkbox" name="sound-notifications"> Âm thanh thông báo
        </label>

        <label for="notification-frequency">Tần suất thông báo:</label>
        <select id="notification-frequency" name="notification-frequency">
          <option value="immediate">Ngay lập tức</option>
          <option value="daily">Hàng ngày</option>
          <option value="weekly">Hàng tuần</option>
        </select>

        <button type="submit">Lưu cài đặt</button>
      </form>
    </div>
    <!-- Điều khoản sử dụng & Chính sách bảo mật -->
    <h4>⁜ Điều khoản sử dụng & Chính sách bảo mật</h4>
    <div class="settings-info">

      <h5>Tải lên và xem tệp:</h5>
      <form id="fileUploadForm-DK">
        <p><a href="/terms" target="_blank">Xem điều khoản sử dụng</a></p>
        <label for="fileInput1">Chọn tệp:</label>
        <input type="file" id="fileInput1" accept=".txt, .pdf, .doc, .docx, .json" required>
        <button type="button" onclick="uploadAndDisplayFile()">Tải lên</button>
      </form>
      <form id="fileUploadForm-CS">
        <p><a href="/privacy-policy" target="_blank">Xem chính sách bảo mật</a></p>
        <label for="fileInput2">Chọn tệp:</label>
        <input type="file" id="fileInput2" accept=".txt, .pdf, .doc, .docx, .json" required>
        <button type="button" onclick="uploadAndDisplayFile()">Tải lên</button>
      </form>

      <div id="fileContent" style="margin-top: 20px; border: 1px solid #ccc; padding: 10px; background-color: #2693E0; display: none;">
        <h5>Nội dung tệp:</h5>
        <pre id="fileText" style="white-space: pre-wrap; word-wrap: break-word;"></pre>
      </div>
    </div>
  </section>


  <section id="users">
    <div class="container">

      <h2>Quản lý tài khoản</h2>
      <div class="search-container">
        <input class="search" type="text" placeholder="Nhập ID hoặc username... "/>
        <button class="button-search">Tìm kiếm</button>
      </div>
      <table>
        <thead>
        <tr>
          <th>ID</th>
          <th>Username</th>
          <th>Password</th>
          <th>Role</th>
          <th>Trạng thái</th>
          <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>1</td>
          <td>nguyenvana</td>
          <td>******</td>
          <td>Admin</td>
          <td><span class="aactive">Active</span></td>
          <td>
            <button class="btn-edit">Sửa</button>
            <button class="btn-delete">Xóa</button>
          </td>
        </tr>
        <tr>
          <td>2</td>
          <td>tranthib</td>
          <td>******</td>
          <td>User</td>
          <td><span class="inactive">Inactive</span></td>
          <td>
            <button class="btn-edit">Sửa</button>
            <button class="btn-delete">Xóa</button>
          </td>
        </tr>
        <tr>
          <td>3</td>
          <td>lethic</td>
          <td>******</td>
          <td>Moderator</td>
          <td><span class="aactive">Active</span></td>
          <td>
            <button class="btn-edit">Sửa</button>
            <button class="btn-delete">Xóa</button>
          </td>
        </tr>
        </tbody>
      </table>
    </div>

  </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  function showSection(sectionId) {
    const sections = document.querySelectorAll('.content section');
    sections.forEach(section => section.classList.remove('active'));
    const activeSection = document.getElementById(sectionId);
    if (activeSection) {
      activeSection.classList.add('active');
    }
  }
</script>

<script>
  // Biểu đồ Doanh thu
  let ctx = document.getElementById('revenueChart').getContext('2d');
  let revenueChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11'],
      datasets: [{
        label: 'Doanh thu',
        data: [12000000, 1900000, 3000000, 15000000, 200000000, 300000000, 590000000, 600000000, 700000000, 560000000, 500000000],
        backgroundColor: 'rgba(54, 162, 235, 0.6)',
        borderColor: 'rgba(54, 162, 235, 1)',
        borderWidth: 1
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Thống kê doanh thu theo tháng',
        fontSize: 25,
        position: 'top'
      },
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  });

  // Biểu đồ khách hàng mới
  let customerCtx = document.getElementById('customerChart').getContext('2d');
  let customerChart = new Chart(customerCtx, {
    type: 'line',
    data: {
      labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11'],
      datasets: [{
        label: 'Khách hàng mới',
        data: [30, 50, 70, 90, 110, 130, 150, 170, 180, 150, 200],
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
        borderColor: 'rgba(75, 192, 192, 1)',
        borderWidth: 1,
        fill: true
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Thống kê khách hàng mới theo tháng',
        fontSize: 25,
        position: 'top'
      },
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  });
</script>
<script>
  function toggleHistory(customerId) {
    const historyTable = document.getElementById(`history-${customerId}`);
    if (historyTable.style.display === "none") {
      historyTable.style.display = "table";
    } else {
      historyTable.style.display = "none";
    }
  }
</script>
<script>


  function deleteCustomer(button) {
    const row = button.closest("tr"); // Lấy dòng cha chứa nút
    const confirmation = confirm("Bạn có chắc muốn xóa khách hàng này?");
    if (confirmation) {
      row.remove(); // Xóa dòng khỏi bảng
      alert("Khách hàng đã được xóa!");
    }
  }
</script>
<script>
  function updateCustomerCounts() {
    // Lấy giá trị sản phẩm được chọn
    var selectedProduct = document.getElementById('product-select').value;

    // Dựa vào sản phẩm chọn, cập nhật số lượng khách hàng cũ và mới
    var oldCustomerCount = 0;
    var newCustomerCount = 0;

    if (selectedProduct === "product1") {
      oldCustomerCount = 50;  // Sản phẩm A - số lượng khách hàng cũ
      newCustomerCount = 30;  // Sản phẩm A - số lượng khách hàng mới
    } else if (selectedProduct === "product2") {
      oldCustomerCount = 40;  // Sản phẩm B - số lượng khách hàng cũ
      newCustomerCount = 20;  // Sản phẩm B - số lượng khách hàng mới
    } else if (selectedProduct === "product3") {
      oldCustomerCount = 60;  // Sản phẩm C - số lượng khách hàng cũ
      newCustomerCount = 35;  // Sản phẩm C - số lượng khách hàng mới
    } else if (selectedProduct === "product4") {
      oldCustomerCount = 30;  // Sản phẩm D - số lượng khách hàng cũ
      newCustomerCount = 15;  // Sản phẩm D - số lượng khách hàng mới
    }

    // Cập nhật số lượng khách hàng cũ và mới vào giao diện
    document.getElementById('old-customers-count').innerText = oldCustomerCount;
    document.getElementById('new-customers-count').innerText = newCustomerCount;

    // Cập nhật danh sách khách hàng đã mua sản phẩm

  }

</script>
</body>
</html>
