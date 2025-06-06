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
</main>
</body>
</html>