
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="hcmuaf.edu.vn.fit.pj_web_hc.Model.Products" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kết quả tìm kiếm cho: <%= request.getAttribute("search") %></title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        html, body, ul {
            margin: 0;
            padding: 0;
            font-size: 17px;
            font-family: Tahoma, sans-serif;

        }
        /*header*/
        .sticky {
            background-color: white;
            position: sticky;
            top: 0;
            z-index: 1;

        }

        .container-flugin {
            height: 100px; /* Giới hạn chiều cao của header */
            display: flex;
            align-items: center; /* Căn giữa nội dung theo chiều dọc */
            border-bottom: solid 0.5px #bbbbbb;
        }

        h3{
            font-size: 20px;
            padding: 10px 10px;
            color: dodgerblue;
        }
        h5{
            font-size: 17px;
        }
        .logo{
            height: 150px;
            padding:10px 10px 10px 20px;
            width: auto;
        }
        .product-list {
            display: grid;
            grid-template-columns: repeat(5, 250px);
            grid-auto-rows: auto;
            gap: 20px;
            height: auto;
            padding-left: 15px;
            padding-bottom: 40px;
            padding-top: 40px;
        }
        .product-item {
            border-radius: 8px;
            border: 1px solid #ccc;
            text-align: center;
            transition: transform 0.2s;
            padding: 15px;

        }
        .product-item img {
            max-width: 100%;
            width: 85px;
            height: 80px;
            /*border-radius: 5px;*/
        }

        .product-item:hover {
            transform: scale(1.05);
            border-color: #666;
        }

        .product-item .content {
            display: grid;
        }

        .main-section{
            display: flex;
            align-items: flex-start;
            padding: 20px;
            gap: 20px; /*khoảng cách giữa các sản phẩm*/
        }
        .footer {
            background-color: #398BC4;
            color: white;
            padding: 20px;
            font-family: Tahoma, sans-serif;
        }

        .footer-container {
            display: flex;
            justify-content: space-between;
            gap: 30px;
        }

        .footer-section {
            flex: 1;
            padding-left: 70px;
        }

        .footer-section h3 {
            font-size: 1.4rem;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .footer-section ul {
            list-style: none;
            padding: 0;
        }

        .footer-section ul li {
            margin-bottom: 10px;
        }

        .footer-section ul li a {
            color: white;
            text-decoration: none;
            font-size: 1rem;
            transition: color 0.3s ease;
        }

        .footer-section ul li a:hover {
            color: #f1f1f1;
        }

        /* Liên kết mạng xã hội */
        .social-links {
            display: flex;
            gap: 15px;
        }

        .social-links li a {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background-color: #398BC4;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s ease;
        }

        .social-links li a:hover {
            background-color: #f1f1f1;
        }

        /* Phần Footer */
        .footer-bottom {
            text-align: center;
            margin-top: 30px;
            font-size: 1rem;
            background-color: #156DAD;
            padding: 15px 0;
        }

        .certification-images {
            display: flex; /* Sắp xếp hình ảnh theo hàng ngang */
            justify-content: center; /* Căn giữa hình ảnh */
            align-items: center;
            gap: 15px; /* Khoảng cách giữa các hình */
            margin-top: 15px;
        }

        .certification-images img {
            width: 80px; /* Chiều rộng mỗi hình ảnh */
            height: auto; /* Tự động điều chỉnh chiều cao để giữ tỷ lệ */
            border-radius: 5px; /* Bo góc nhẹ */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Hiệu ứng nổi */
            transition: transform 0.3s ease;
        }

        .certification-images img:hover {
            transform: scale(1.1); /* Phóng to hình ảnh khi hover */
        }

        .footer-bottom p {
            margin: 0;
            color: #bbb;
        }


    </style>
</head>
<body>

<!-- Header -->
<div class="sticky">
    <div class="container-flugin">
        <div class="row">
            <div class="col-3">
                <a ><img src="img/logo CAD_Xóa nền.png" class="logo"/></a>
            </div>
            <div class="col-6 d-flex justify-content-center align-items-center" id="searchForm">
                <form class="d-flex" style="width: 750px; height: 40px;">
                    <input class="form-control me-2" type="text" oninput="searchByName(this)" id="searchInput" value="${querryS}" name="querry" placeholder="Nhập tên hóa chất, mã CAS,...." aria-label="Search" style="height: 100%; width: 90%">
                    <button class="btn btn-outline-success" type="submit" style="height: 100%; width: 10%;font-weight: bold">Tìm</button>
                </form>
            </div>
            <div class="col-3 d-flex justify-content-end align-items-center">
                <a href="Trang giỏ hàng.jsp"><i class="fa-solid fa-cart-plus" style="color: #2693E0; font-size: 30px; margin: 30px"></i></a>
                <!--<a href="Trang%20giỏ%20hàng.html"><i class="fa-solid fa-cart-shopping" id="giỏ hàng" style="color: #2693E0; font-size: 40px; margin: 30px;"></i></a>-->
                <a href="Trang_thong_tin_user.jsp"> <i class="fas fa-user" id="user" style="color: #2693E0; font-size: 30px; margin: 30px;"></i></a>
            </div>
        </div>
    </div>
</div>

<!-- Hiển thị kết quả tìm kiếm -->
<div class="container" id="searchResults">
    <h3><i>Kết quả tìm kiếm cho: <%= request.getAttribute("search") %></i></h3>

    <div class="main-section">
        <div class="product-list">
            <%
                List<Products> searchResults = (List<Products>) request.getAttribute("listProduct");
                if (searchResults != null && !searchResults.isEmpty()) {
                    for (Products product : searchResults) {
            %>
            <div class="product-item">
                <img src="<%= product.getImageProduct() %>  alt="<%= product.getProductName() %>">
                <h5><%= product.getProductName() %></h5>
                <p><strong><%= product.getPriceSell() %> VNĐ</strong></p>
            </div>
            <%
                }
            } else {
            %>
            <p>Không tìm thấy sản phẩm nào.</p>
            <%
                }
            %>
        </div>
    </div>
</div>
<!-- Footer -->
<footer class="footer">
    <div class="footer-container">
        <div class="footer-section">
            <h3>Liên hệ</h3>
            <ul>
                <li><a href="mailto:info@example.com">ttth@aic.hcmuaf.edu.vn</a></li>
                <li><a href="tel">028.3896.1713</a></li>
                <li><a href="#">Địa chỉ: P.Linh Trung, TP.Thủ Đức</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h3>Chính sách</h3>
            <ul>
                <li><a href="#">Chính sách bảo mật</a></li>
                <li><a href="#">Chính sách bảo hành</a></li>
                <li><a href="#">Chính sách hoàn trả</a></li>
                <li><a href="#">Chính sách vận chuyển</a></li>
                <li><a href="#">Cách đặt hàng & thanh toán</a></li>
            </ul>
        </div>

        <div class="footer-section">
            <h3>Mạng xã hội</h3>
            <ul class="social-links">
                <li><a href="#"><i class="fa-brands fa-facebook"></i> </a></li>
                <li><a href="#"><i class="fa-brands fa-twitter"></i> </a></li>
                <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
                <li><a href="#"><i class="fa-brands fa-linkedin"></i></a></li>
            </ul>
        </div>
    </div>
    <div class="footer-bottom">
        <h3>CERTIFICATION</h3>
    </div>
    <div class="certification-images">
        <img src="https://images.dmca.com/Badges/dmca-badge-w150-5x1-04.png?ID=b40dd82e-be1f-42d1-8381-a52fa3324ef3" alt="Chứng nhận 1">
        <img src="https://hoachatthinghiem.org/wp-content/uploads/2022/10/Secured-connection-sbc-ssl.png" alt="Chứng nhận 2">
        <img src="https://tinnhiemmang.vn/handle_cert?id=hoachatthinghiem.org" alt="Chứng nhận 3">
        <img src="https://hoachatthinghiem.org/wp-content/uploads/2022/07/Bo-cong-thuong-logo.png" alt="Chứng nhận 4">
    </div>
</footer>
<script>
    function searchByName(para){
        var search = para.value;
        $.ajax({
            url:"hcmuaf/edu/vn/fit/pj_web_hc/Controller/SearchServlet",
            type:"GET",
            data:{
                querry: querryS
            },
            success: function (data){ /*Thêm dấu # hiển thị id*/
                //$('#searchResults').html(data);

                if (data.trim() === "") {
                    $('#searchResults .product-card').html('<p>Không tìm thấy sản phẩm nào.</p>');
                } else {
                    var row= document.getElementById("searchResults");
                    row.innerHTML = data;
                }
            },
            error: function (xhr){
                //Không tìm thấy sản phẩm
                $('#searchResults').html('<p>Đã xảy ra lỗi trong quá trình tìm kiếm.</p>');
            }

        });
    }
    let previousResults = [];
    $(document).ready(function() {
        $('#searchInput').on('input', function(event) {
            // event.preventDefault(); // Ngăn chặn hành động mặc định của form
            const querry = $('#querryS').val(); // Lấy giá trị từ ô tìm kiếm
            if (searchQuerry) {
                $.ajax({
                    url: "hcmuaf/edu/vn/fit/pj_web_hc/Controller/SearchServlet", // Đường dẫn đến Servlet xử lý tìm kiếm
                    type: 'GET',
                    data: {query: querry}, // Gửi dữ liệu tìm kiếm
                    success: function (data) {
                        $('#searchResults').html(data); // Hiển thị kết quả tìm kiếm
                        previousResults = data;
                    },
                    error: function () {
                        $('#searchResults').html('<p>Đã xảy ra lỗi trong quá trình tìm kiếm.</p>');
                    }
                });
            }else{
                $('#searchResults').html(previousResults); // Show previous results if input is cleared
            }
        });
        $('#searchForm').on('submit', function(event) {
            event.preventDefault(); // Prevent default form submission
            const searchQuery = $('#searchInput').val();
            if (!searchQuery) {
                // Do nothing if the input is empty
                return;
            }
            // Optionally, you can trigger the search again if needed
            $.ajax({
                url: "hcmuaf/edu/vn/fit/pj_web_hc/Controller/SearchServlet",
                type: "GET",
                data: {querry: searchQuery},
                success: function (data) {
                    $('#searchResults').html(data);
                    previousResults = data; // Update previous results
                },
                error: function () {
                    $('#searchResults').html('<p>Đã xảy ra lỗi trong quá trình tìm kiếm.</p>');
                }
            });
        });
    });
</script>


</body>
</html>
