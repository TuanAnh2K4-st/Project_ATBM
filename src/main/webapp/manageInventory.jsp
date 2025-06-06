<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="css/adminPage.css">
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
                <li><a href="admin-products" onclick="showSection('products')"><i class="fa fa-box"></i> Quản lý Sản phẩm</a>
                </li>
                <li><a href="admin-orders" onclick="showSection('orders')"><i class="fa fa-shopping-cart"></i> Quản lý Đơn
                    hàng</a></li>
                <li><a href="admin-customers" onclick="showSection('customers')"><i class="fa fa-users"></i> Quản lý Khách
                    hàng</a></li>
                <li><a href="admin-inventory" onclick="showSection('inventory')"><i class="fa fa-warehouse"></i> Quản lý Kho</a>
                </li>
                <li><a href="admin-discount" onclick="showSection('discount')"><i class="fa-sharp fa-solid fa-file"></i> Quản lý mã giảm giá</a></li>
                <li><a href="admin-settings" onclick="showSection('settings')"><i class="fa fa-cogs"></i> Cài Đặt</a></li>
                <li><a href="admin-users" onclick="showSection('users')"><i class="fa-solid fa-user"></i> Tài khoản người dùng</a></li>

            </ul>
        </nav>
    </div>
</div>
<!-- Main Content -->
<main class="content">
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
<%--                                <label for="productCode">Mã sản phẩm</label>--%>
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
</main>
</body>
</html>