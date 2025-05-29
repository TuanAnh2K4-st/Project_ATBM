<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="IE-edge">
    <title>Sản Phẩm Mới</title>
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
    <link rel="stylesheet" href="css/listProduct.css" />
</head>
<body>
<%--Header--%>
<jsp:include page="header.jsp" />
<div class="products">
    <!--        khung chứa các thông tin và các cách sắp xếp-->
    <div class="sidebar" style="
    width: 260px;
    background: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    font-family: 'Arial', sans-serif;
">
        <h2 style="
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 15px;
        color: #333;
        text-transform: uppercase;
        text-align: center;
    ">Bộ lọc</h2>

        <form id="filterForm" action="list-product" method="get">
            <!-- Lọc theo Hãng -->
            <div class="filter-group" style="margin-bottom: 15px;">
                <label for="brand" style="font-weight: 600; display: block; margin-bottom: 5px; color: #555;">Hãng:</label>
                <select name="brand" id="brand" style="
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 14px;
                transition: all 0.3s ease;
            ">
                    <option value="">Tất cả</option>
                    <option value="Pyrex">Pyrex</option>
                    <option value="Thiên Hà Xanh">Thiên Hà Xanh</option>
                    <option value="Duchefa Hà Lan">Duchefa Hà Lan</option>
                </select>
            </div>

            <!-- Lọc theo Thể tích -->
            <div class="filter-group" style="margin-bottom: 15px;">
                <label for="volume" style="font-weight: 600; display: block; margin-bottom: 5px; color: #555;">Thể tích:</label>
                <select name="volume" id="volume" style="
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 14px;
            ">
                    <option value="">Tất cả</option>
                    <option value="Lít">Lít</option>
                    <option value="kg">kg</option>
                </select>
            </div>

            <!-- Sắp xếp theo giá -->
            <div class="filter-group" style="margin-bottom: 15px;">
                <label for="sortPrice" style="font-weight: 600; display: block; margin-bottom: 5px; color: #555;">Sắp xếp giá:</label>
                <select name="sortPrice" id="sortPrice" style="
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 14px;
            ">
                    <option value="">Mặc định</option>
                    <option value="asc">Giá thấp đến cao</option>
                </select>
            </div>

            <!-- Nút Lọc -->
            <div class="filter-group" style="margin-bottom: 15px;">
                <button type="submit" style="
                width: 100%;
                background: #007bff;
                color: white;
                font-size: 16px;
                font-weight: bold;
                padding: 10px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.3s ease-in-out;
            ">Lọc</button>
            </div>
        </form>

        <!-- Thông tin HOT -->
        <div class="hot-info" style="
        margin-top: 20px;
        padding: 15px;
        background: #f8f9fa;
        border-radius: 6px;
    ">
            <div class="hot-item" style="
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        ">
                <h3 style="font-size: 16px; color: #007bff; margin-bottom: 5px;">Sản phẩm khuyến mãi</h3>
                <p style="font-size: 14px; color: #555;">Giảm giá đến 50% cho các sản phẩm mùa hè.</p>
            </div>
            <div class="hot-item" style="
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        ">
                <h3 style="font-size: 16px; color: #007bff; margin-bottom: 5px;">Sản phẩm mới</h3>
                <p style="font-size: 14px; color: #555;">Đón chào loạt sản phẩm mới với nhiều tính năng hiện đại.</p>
            </div>
            <div class="hot-item" style="
            padding: 10px 0;
        ">
                <h3 style="font-size: 16px; color: #007bff; margin-bottom: 5px;">Ưu đãi đặc biệt</h3>
                <p style="font-size: 14px; color: #555;">Nhận ngay ưu đãi cho khách hàng thân thiết!</p>
            </div>
        </div>
    </div>

    <!--        khung chứa các sản phẩm-->
    <div class="main-content">
        <div class="type">
            <h3>Sản phẩm mới</h3>
        </div>
        <div class="product-lists">
            <!-- Duyệt qua danh sách sản phẩm -->
            <c:forEach var="products" items="${data}">
                <a href="detail?id=${products.productId}">
                    <div class="product-item">
                        <!-- Sử dụng thuộc tính imageProduct cho ảnh sản phẩm -->
                        <img src="${products.imageProduct}" alt="sản phẩm">
                        <ul class="content">
                            <!-- Sử dụng productName và priceSell -->
                            <li class="product-name">${products.productName}</li>
                            <li class="product-price">${products.priceSell} VND</li>
                            <li class="product-view">Mức độ: ${products.hozandLevel}</li>
                            <li class="product-time">Ngày đăng:
                                <fmt:formatDate value="${products.createAt}" pattern="dd/MM/yyyy" />
                            </li>
                        </ul>
                        <!-- Form gửi ID sản phẩm -->
                        <form action="detail" method="GET">
                            <input type="hidden" name="id" value="${products.productId}">
                            <button type="submit">Xem chi tiết</button>
                        </form>
                    </div>
                </a>
            </c:forEach>

            <!-- Phân trang -->
            <div class="pagination">
                <!-- Duyệt qua các số trang -->
                <c:forEach var="pageNumber" begin="1" end="${totalPages}">
                    <a href="list-product?page=${pageNumber}" class="page ${pageNumber == currentPage ? 'active' : ''}">
                            ${pageNumber}
                    </a>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<%--Footer--%>
<jsp:include page="footer.jsp" />
</body>
</html>