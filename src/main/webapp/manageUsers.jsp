<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.Orders" %>
<%@ page import="java.util.List" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.KeyAccount" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.AccountUsers" %>
<%@ page import="java.util.Map" %>
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
