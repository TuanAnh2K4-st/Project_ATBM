
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="x-ua-compatible" content="IE-edge">
  <title>Tin tức chi tiết</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    html, body, ul {
      margin: 0;
      padding: 0;
      font-size: 18px;
      font-family: sans-serif, Tahoma;
    }
    /*header*/

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
    }

    .navbar-custom {

      background-color: #2693E0;
      height: 50px;
      z-index: 1030;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Hiệu ứng đổ bóng */
    }

    .navbar-custom .navbar-nav .nav-link {
      color: white;
    }

    .navbar-custom .navbar-nav .nav-link:hover {
      color: #f0ad4e; /* Màu vàng khi hover */
    }

    .dropdown-submenu {
      position: relative;
    }

    .dropdown-submenu .dropdown-menu {
      top: 0;
      left: 100%;
      margin-top: -60px;
      display: none;
    }

    .dropdown-submenu:hover .dropdown-menu {
      display: block;

    }

    .dropdown-submenu li a:hover {
      background-color: #1E90FF;
      color: #fff;
    }

    .dropdown-menu {
      padding: 0;
    }

    .d-flex {
      margin: 0;
    }
    /*  Body*/

    .container {
      max-width: 1000px; /* Độ rộng của khung nội dung */
      margin: 40px auto;
      padding: 20px;
      background-color: #ffffff; /* Nền trắng */
      border-radius: 10px; /* Bo góc */
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1); /* Hiệu ứng đổ bóng */
      line-height: 1.6; /* Dãn dòng hợp lý */
    }

    .name-news {
      font-size: 28px;
      color: #1abc9c; /* Màu xanh nổi bật */
      text-align: center;
      margin-bottom: 20px;
      border-bottom: 2px solid #ecf0f1; /* Đường gạch chân */
      padding-bottom: 10px;
    }

    .idea {
      font-size: 20px;
      color: #3498db; /* Màu xanh nhẹ */
      margin-top: 20px;
    }

    p {
      font-size: 16px;
      color: #34495e; /* Màu xám đậm */
      margin: 15px 0;
    }

    .pics-news {
      display: block;
      max-width: 100%; /* Đảm bảo hình ảnh không vượt quá khung */
      height: auto;
      margin: 20px auto; /* Căn giữa hình */
      border-radius: 10px; /* Bo góc cho ảnh */
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2); /* Đổ bóng ảnh */
    }
    /*Footer*/
    .footer {
      margin-top: 50px;
      background-color: #398BC4;
      color: white;
      padding: 20px;
      font-family: Arial, sans-serif;
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
<!--Header-->
<div class="sticky">
<div class="container-flugin">
  <div class="row">
    <div class="col-3">
      <a ><img src="img/logo CAD_Xóa nền.png" class="logo" height="180" width="370"/></a>
    </div>
    <div class="col-6 d-flex justify-content-center align-items-center">
      <form class="d-flex" style="width: 750px; height: 40px;">
        <input class="form-control me-2" type="search" placeholder="Nhập tên hóa chất, mã CAS,...." aria-label="Search" style="height: 100%; width: 90%;">
        <button class="btn btn-outline-success" type="submit" style="height: 100%; width: 10%;font-weight: bold">Tìm</button>
      </form>
    </div>

    <div class="col-3 d-flex justify-content-end align-items-center">
      <a href="Trang%20giỏ%20hàng.html"><i class="fa-solid fa-cart-plus" style="color: #2693E0; font-size: 30px; margin: 30px"></i></a>
      <a href="Trang%20thông%20tin%20user.html"> <i class="fas fa-user" id="user" style="color: #2693E0; font-size: 30px; margin: 30px;"></i></a>
    </div>
  </div>
</div>
<div class="navbar navbar-expand-lg navbar-custom">
  <div class="container-fluid">
    <!--            <a class="navbar-brand text-white" href="#">Brand</a>-->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="Trang_chu.jsp"><i class="fa-solid fa-house" style=" font-size: 22px; color: white"></i> Trang chủ</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Danh sách sản phẩm
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li>
              <a class="dropdown-item" href="#">Mới nhất</a>
            </li>
            <li>
              <a class="dropdown-item" href="#">Nổi bật</a>
            </li>
            <li class="dropdown-submenu">
              <a class="dropdown-item dropdown-toggle" href="#">Phân loại</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="Trang%20Danh%20sách%20sản%20phẩm.html">Hóa Chất Cơ Bản</a></li>
                <li><a class="dropdown-item" href="#">Dung Môi</a></li>
                <li><a class="dropdown-item" href="#">Chất Chuẩn Phân Tích</a></li>
                <li><a class="dropdown-item" href="#">Hóa Chất Vô Cơ</a></li>
                <li><a class="dropdown-item" href="#">Dung Dịch Chuẩn</a></li>
                <li><a class="dropdown-item" href="#">Chất Chỉ Thị Màu</a></li>
              </ul>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Thông tin web</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Trang%20tin%20tức.html">Tin tức</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Trang%20liên%20hệ.html">Liên hệ</a>
        </li>
      </ul>
    </div>
  </div>
</div>
</div>
<!--body-->
<div class="container">
  <h1 class="name-news" style="font-size: 30px; font-weight: bold">Những quy tắc an toàn trong phòng thí nghiệm hóa học</h1>
  <img src="https://hpi.com.vn/wp-content/uploads/2022/06/an-toan-phong-thi-nghiem-1.jpg" alt="Hóa chất mới" class="pics-news">
  <p>An toàn phòng thí nghiệm là gì? Quy định chung tại phòng thí nghiệm cùng với nội quy của phòng thí nghiệm ra sao? Trách nhiệm của cán bộ, nhân viên như thế nào?  Khi làm việc tại phòng thí nghiệm và làm việc trực tiếp với hóa chất thì bạn phải lưu ý những điều gì để đảm bảo an toàn cho mình? Cuối cùng đó là cách sơ cứu những trường hợp chấn thương và ngộ độc trong phòng thí nghiệm ra sao? Tất cả sẽ có trong bài viết dưới đây của Hiệp Phát.</p>
  <h3 class="idea">An toàn phòng thí nghiệm là gì?</h3>
  <p>Trong bất cứ lĩnh vực nào từ hóa, sinh, lý hay y học,… thì an toàn phòng thí nghiệm đều rất được chú ý.
    Để đảm bảo an toàn, tránh những trường hợp đáng tiếc xảy ra khi làm việc trong Phòng thí nghiệm , mỗi cán bộ và nhân viên làm việc tại phòng thí nghiệm phải nắm vững các quy trình, quy phạm và tuân thủ nghiêm ngặt. Cùng với đó là việc trang bị và sử dụng các thiết bị bảo hộ lao động là điều vô cùng cần thiết.</p>
  <h3 class="idea">Các quy định chung về an toàn trong phòng thí nghiệm </h3>
  <p>Sau đây là những quy định chung tại phòng thí nghiệm để đảm bảo an toàn trong quá trình làm việc và nghiên cứu. Đó là:



    Luôn luôn nhận biết nơi để các trang thiết bị an toàn.
    Phải mặc áo choàng của phòng thí nghiệm.
    Phải mang kính bảo hộ.
    Phải cột tóc gọn lại.
    Chỉ được làm thí nghiệm khi có sự hiện diện của giáo viên hoặc người phụ trách trong phòng thí nghiệm.
    Đọc kỹ hướng dẫn và suy nghĩ trước khi làm thí nghiệm.
    Làm sạch bàn thí nghiệm trước khi bắt đầu một thí nghiệm.
    Không bao giờ được nếm các hóa chất thí nghiệm. Không ăn hoặc uống trong phòng thí nghiệm.
    Không được nhìn xuống ống thí nghiệm.
    Nếu hóa chất rơi vào mắt, phải đi rửa mắt ngay lập tức.
    Bỏ chất thải thí nghiệm vào đúng nơi quy định như được hướng dẫn.
    Nếu bạn chưa rõ vấn đề nào, hãy hỏi.
    Nếu làm đổ hóa chất hoặc xảy ra tai nạn, báo cho giáo viên ngay lập tức.
    Rửa sạch da khi tiếp xúc với hóa chất.</p>
  <img src="https://hpi.com.vn/wp-content/uploads/2022/06/an-toan-phong-thi-nghiem-2.jpg" alt="" class="pics-news">
  <h3 class="idea">Những lưu ý dành cho cán bộ, nhân viên làm việc trong phòng thí nghiệm</h3>
  <p>Để đảm bảo an toàn, khi vào phòng thí nghiệm chúng ta cần:



    Làm sạch bàn thí nghiệm trước khi tiến hành thí nghiệm
    Không nuốt, không uống các loại hóa chất có trong phòng thí nghiệm
    Rửa sạch vùng da sau khi tiếp xúc với hóa chất
    Đọc kỹ hướng dẫn sử dụng các loại hóa chất và suy nghĩ kỹ trước khi làm thí nghiệm
    Đeo kính bảo hộ, găng tay, khẩu trang y tế và mặc áo choàng của phòng thí nghiệm
    Nếu chẳng may bị hóa chất rơi vào mắt cần phải rửa ngay lập tức
    Bỏ chất thải thí nghiệm vào đúng nơi quy định như hướng dẫn
    Cột tóc gọn gàng, tránh tiếp xúc với hóa chất độc hại


    Mọi người làm việc trong phòng thí nghiệm đều phải được học, kiểm tra về nội quy an toàn lao động, nắm vững các quy trình, quy phạm kỹ thuật và các biện pháp đảm bảo an toàn lao động.

    Phải đọc kỹ tài liệu, hiểu rõ mọi chi tiết của thí nghiệm trước lúc làm và lường trước các sự cố có thể xảy ra để chủ động phòng tránh.

    Tiến hành thí nghiệm thì cần quan sát và ghi chép kĩ các số liệu để làm bản báo cáo thí nghiệm. Sau giờ làm việc phải lau chùi, sắp xếp gọn gàng các thiết bị và dụng cụ thí nghiệm.

    Lấy hóa chất, dụng cụ thí nghiệm ở đâu thì đặt lại vị trí cũ. Trước khi rời khỏi PTN cần phải kiểm tra lại PTN, khoá các van nước, đóng ngắt cầu dao điện,…
    Tóc phải gọn gàng, nếu tóc dài phải buộc gọn, Móng tay phải được cắt gọn, không trang sức khi làm việc.
    Sử dụng phương tiện bảo hộ cá nhân theo quy định về an toàn lao động.
    Nhân viên phòng Hóa nghiệm tuân thủ nghiêm ngặt các quy định an toàn lao động của Nhà máy.
    Không hút thuốc trong phòng Hóa nghiệm.
    Không được sử dụng kính sát tròng khi làm việc trong phòng Thí nghiệm.
    Không ăn uống trong phòng thí nghiệm.</p>
  <h3 class="idea">Quy định về kiểm soát hóa chất Phòng thí nghiệm</h3>
  <img src="https://hpi.com.vn/wp-content/uploads/2022/06/an-toan-phong-thi-nghiem-4.jpg " alt="" class="pics-news">
  <p>Hóa chất phòng thí nghiệm chưa sử dụng phải được lưu trong tủ riêng biệt.
    Hoá chất trong tủ phải được lưu trữ theo từng loại và một khu vực riêng để phân biệt.
    Phải lập sổ theo dõi hóa chất xuất nhập kho. Định kỳ thực hiện kiểm tra hóa chất lưu kho.
    Kiểm tra thường xuyên bao bì đựng hóa chất tránh xảy ra hư hỏng, gây rò rỉ, tràn đổ.  Nếu bị đổ hay bể thùng hóa chất phải thu gom hóa chất ngay, sắp xếp cho dùng ngay hoặc thay bao bì mới, vệ sinh sạch phần hóa chất hóa chất còn lại đúng cách.
    Dán nhãn cho từng lọ hóa chất. Trên nhãn phải ghi nhận tình trạng của lọ hóa chất : ngày nhận, ngày mở chai, ngày hết hạn sử dụng…
    Hóa chất độc được phải quản lý chặt chẽ trong việc cấp phát : số lượng, mục đích sử dụng, người nhận. Người cho phép cấp phát hóa chất độc là Trưởng phòng QLCL.
    Phòng Hóa nghiệm phải có danh mục hóa chất độc. Danh mục được cập nhật thường xuyên.</p>

  <a href="Trang tin tức.jsp">Quay lại danh sách tin tức</a>
</div>
<!--Footer-->
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
</body>
</html>
