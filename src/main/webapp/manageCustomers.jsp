<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                <li><a href="admin-products" onclick="showSection('products')"><i class="fa fa-box"></i> Quản lý Sản
                    phẩm</a>
                </li>
                <li><a href="admin-orders" onclick="showSection('orders')"><i class="fa fa-shopping-cart"></i> Quản lý
                    Đơn
                    hàng</a></li>
                <li><a href="admin-customers" onclick="showSection('customers')"><i class="fa fa-users"></i> Quản lý
                    Khách
                    hàng</a></li>
                <li><a href="admin-inventory" onclick="showSection('inventory')"><i class="fa fa-warehouse"></i> Quản lý
                    Kho</a>
                </li>
                <li><a href="admin-discount" onclick="showSection('discount')"><i class="fa-sharp fa-solid fa-file"></i>
                    Quản lý mã giảm giá</a></li>
                <li><a href="admin-settings" onclick="showSection('settings')"><i class="fa fa-cogs"></i> Cài Đặt</a>
                </li>
                <li><a href="admin-users" onclick="showSection('users')"><i class="fa-solid fa-user"></i> Tài khoản
                    người dùng</a></li>

            </ul>
        </nav>
    </div>
</div>
<!-- Main Content -->
<main class="content">
    <div id="customers">
        <div class="container">
            <h2>Quản lý thông tin khách hàng</h2>
            <form action="admin-customers" method="get">
                <div class="search-container">
                    <input type="hidden" name="action" value="search"/>
                    <input class="search" type="text" name="keyword" value="${param.keyword}" placeholder="Nhập tên khách hàng..."/>
                    <button type="submit" class="button-search">Tìm kiếm</button>
                </div>
            </form>
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
                <c:forEach items="${customersList}" var="c">
                    <tr>
                        <td>${c.customerId}</td>
                        <td>${c.fullName}</td>
                        <td>${c.email}</td>
                        <td>${c.dateOfBirth}</td>
                        <td>${c.phoneNum}</td>
                        <td>${c.address}</td>
                        <td>${c.gender}</td>
                        <td>${c.job}</td>
                        <td>
                            <form action="admin-customers" method="post">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="customerId" value="${c.customerId}">
                                <button type="submit" class="btn-edit">Sửa</button>
                            </form>
                        </td>
                        <td>
                            <button class="btn-delete">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="container">
            <!-- FORM SỬA -->
            <c:if test="${not empty customerToEdit}">
                <h4>Chỉnh sửa thông tin khách hàng</h4>
                <form action="admin-customers" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="customerId" value="${customerToEdit.customerId}">
                    <div class="form-group">
                        <!-- Tên KH -->
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="name">Tên khách hàng</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="name" name="name"
                                       value="${customerToEdit.fullName}" required>
                            </div>
                        </div>

                        <!-- Email -->
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="email">Email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="email" name="email"
                                       value="${customerToEdit.email}">
                            </div>
                        </div>

                        <!-- Ngày sinh -->
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="date-of-birth">Ngày sinh</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="date-of-birth" name="dateOfBirth"
                                       value="${customerToEdit.dateOfBirth}">
                            </div>
                        </div>

                        <!-- SDT -->
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="phoneNum">SĐT</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="phoneNum" name="phoneNum"
                                       value="${customerToEdit.phoneNum}">
                            </div>
                        </div>

                        <!-- Địa chỉ -->
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="address">Địa chỉ</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="address" name="address"
                                       value="${customerToEdit.address}">
                            </div>
                        </div>
                        <!-- Giới tính -->
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="gender">Giới tính</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="gender" name="gender"
                                       value="${customerToEdit.gender}">
                            </div>
                        </div>
                        <!-- Công việc -->
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="job">Nghề</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="job" name="job"
                                       value="${customerToEdit.job}">
                            </div>
                        </div>
                        <!-- Nút submit -->
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                            </div>
                        </div>
                    </div>
                </form>
            </c:if>
        </div>
        <%
            String message = (String) session.getAttribute("message");
            if (message != null) {
        %>
        <script>
            alert("<%= message %>");
        </script>
        <%
                session.removeAttribute("message"); // Xóa sau khi hiển thị để tránh hiển thị lại
            }
        %>
    </div>
    <div>
        <c:if test="${not empty message}">
            <script>
                alert("${message}");
            </script>
        </c:if>
    </div>
</main>
</body>
</html>