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
</main>
</body>
</html>