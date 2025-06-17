<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.Orders" %>
<%@ page import="java.util.List" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.KeyAccount" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.AccountUsers" %>
<%@ page import="java.util.Map" %>
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
                <li><a href="#"><i class="fa fa-chart-line"></i> Bảng điều
                    khiển</a></li>
                <li><a href="admin-products"><i class="fa fa-box"></i> Quản lý Sản phẩm</a>
                </li>
                <li><a href="admin-orders"><i class="fa fa-shopping-cart"></i> Quản lý Đơn
                    hàng</a></li>
                <li><a href="admin-customers"><i class="fa fa-users"></i> Quản lý Khách
                    hàng</a></li>
                <li><a href="admin-inventory"><i class="fa fa-warehouse"></i> Quản lý Kho</a>
                </li>
                <li><a href="admin-discount"><i class="fa-sharp fa-solid fa-file"></i> Quản lý mã giảm giá</a></li>
                <li><a href="admin-settings"><i class="fa fa-cogs"></i> Cài Đặt</a></li>
                <li><a href="admin-users"><i class="fa-solid fa-user"></i> Tài khoản người dùng</a></li>

            </ul>
        </nav>
    </div>
</div>
<!-- Main Content -->
<main class="content">
    <div id="products" class="product-section">
        <div class="container" style="background: #b3d4fc;box-shadow: none">
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
                        <c:forEach items="${productViewList}" var="p">
                            <tr>
                                <td>${p.productName}</td>
                                <td>${p.productId}</td>
                                <td><img src="${p.imageProduct}"
                                         alt="${p.productName}" style="width:50px;"></td>
                                <td>${p.brandName}</td>
                                <td>${p.quatityStock}</td>
                                <td>${p.priceSell}</td>
                                <td>
                                    <form action="admin-products" method="post">
                                        <input type="hidden" name="action" value="edit">
                                        <input type="hidden" name="productId" value="${p.productId}">
                                    <button type="submit" class="btn btn-warning">Sửa</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- FORM SỬA -->
                    <c:if test="${not empty productToEdit}">
                        <h4>Chỉnh sửa sản phẩm</h4>
                        <form action="admin-products" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="productId" value="${productToEdit.productId}">
                            <div class="form-group">
                                <!-- Tên sản phẩm -->
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="name">Tên sản phẩm:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="name" name="name" value="${productToEdit.productName}" required>
                                    </div>
                                </div>

                                <!-- Hình ảnh -->
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="image">Hình ảnh:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="image" name="image" value="${productToEdit.imageProduct}">
                                    </div>
                                </div>

                                <!-- Hãng -->
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="brand">Hãng:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="brand" name="brand" value="${productToEdit.brandName}">
                                    </div>
                                </div>

                                <!-- Số lượng tồn kho -->
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="quantity">Số lượng tồn:</label>
                                    <div class="col-sm-10">
                                        <input type="number" class="form-control" id="quantity" name="quantity" value="${productToEdit.quatityStock}" min="0">
                                    </div>
                                </div>

                                <!-- Giá bán -->
                                <div class="form-group">
                                    <label class="control-label col-sm-2" for="price">Giá bán:</label>
                                    <div class="col-sm-10">
                                        <input type="number" class="form-control" id="price" name="price" value="${productToEdit.priceSell}" min="0" step="0.01">
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

                <!-- Phần thêm và xóa sản phẩm -->
                <div class="product-list">
                    <div class="card">
                        <form action="admin-products" method="post">
                            <input type="hidden" name="action" value="add">
                            <h3>Thêm sản phẩm</h3>
                            <div class="form-group row">
                                <label for="productCode" class="col-sm-2 col-form-label">Mã sản phẩm:</label>
                                <div class="col-sm-2">
                                    <input type="number" id="productCode" class="form-control" name="productId"
                                           required></div>

                                <label for="productName" class="col-sm-2 col-form-label">Tên sản phẩm:</label>
                                <div class="col-sm-2">
                                    <input type="text" id="productName" class="form-control" name="productName"
                                           required></div>

                                <label for="productBrand" class="col-sm-2 col-form-label">Hãng:</label>
                                <div class="col-sm-2">
                                    <input type="text" id="productBrand" class="form-control" name="brandName" required>
                                </div>

                                <label for="productStock" class="col-sm-2 col-form-label">Số lượng tồn kho:</label>
                                <div class="col-sm-2">
                                    <input type="number" id="productStock" class="form-control" name="quantityStock"
                                           required></div>

                                <label for="productImage" class="col-sm-2 col-form-label">Hình ảnh sản phẩm:</label>
                                <div class="col-sm-2">
                                    <input type="text" id="productImage" class="form-control" name="imageProduct"
                                           required></div>

                                <label for="productPrice" class="col-sm-2 col-form-label">Giá bán:</label>
                                <div class="col-sm-2">
                                    <input type="number" id="productPrice" class="form-control" name="priceSell"
                                           required>
                                </div>

                            </div>
                            <div class="row">
                                <button type="submit" class="btn btn-success">Thêm sản phẩm</button>
                            </div>
                        </form>
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
                    <div class="card">
                        <form action="admin-products" method="post" >
                            <input type="hidden" name="action" value="delete">
                        <h3>Xóa sản phẩm</h3>
                        <div class="form-group row" style="display: flex; align-items: center">
                            <label for="productToDelete" class="col-sm-2 col-form-label">Mã sản phẩm để xóa:</label>
                            <input type="number" id="productToDelete" name="productId" class="form-control col-sm-5">
                            <button type="submit" class="btn btn-danger" id="deleteProductButton">Xóa sản phẩm</button>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>