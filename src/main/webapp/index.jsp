<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <style>
      html, body{
          font-family: Tahoma, sans-serif;
          text-align: center;
          margin: 0; /* Đảm bảo không có margin mặc định */
          padding: 0; /* Đảm bảo không có padding mặc định */
          height: 100%;
          font-size: 16px;
      }
      .nav{
          display: flex;
          align-items: center;
          background-color: #31b0d5;/*#A8CBFF;*/
          padding: 10px 10px 10px 10px;
          justify-content: flex-start;
          position: fixed; /* Cố định vị trí */
          top: 0; /* Đặt ở trên cùng */
          left: 0; /* Đặt ở bên trái */
          width: 100%; /* Chiếm toàn bộ chiều rộng */
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Bóng đổ cho navbar */
          z-index: 1000; /* Đảm bảo navbar nằm trên các phần tử khác */
      }
      .nav-item{
          font-size: 18px;
          color: white;
          padding: 10px 5px 10px 20px;
          margin: 10px 10px;
      }
      .container{
          display: flex;
          padding: 0px 0px 0px 0px;
          justify-content: flex-start;
          width: auto;
          flex-direction: column;
      }
      .container-img{
          max-width: 100%;
          height: auto;
      }
      .logo-img{
          align-items: center;
          height: 80px;
          width: auto;
      }
      h1 {
          font-size: 32px;
      }
      /*Footer*/
      .footer {
          background-color: #398BC4;
          color: white;
          padding: 20px;
          font-family: Tahoma, sans-serif;
          position: relative;
          clear: both;
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
<div class="nav" >

        <div class="col-6 d-flex justify-content-center align-items-center">
               <img src="img/logo CAD_Xóa nền.png" class="logo-img" alt="logo">
            <a class="nav-item" href="Trang_chu.jsp">Trang chủ</a>
                <a class="nav-item" href="Trangdangnhap_dangky.jsp" >Đăng nhập</a>

    </div>
</div>
<div class="container">
    <img src="img/welcome_1.gif" class="container-img" alt="welcome_1">
    <img src="img/welcome_2.gif" class="container-img" alt="welcome_2">
    <img src="img/welcome_3.png" class="container-img" alt="welcome_3">

    <!-- <div class="row">
         <button type="submit" name="đăng nhập" style="color: #1abc9c">Đăng nhập</button>
         <button type="submit" name="đăng ký" style="color: #FB8C00">Đăng ký</button>
     </div>-->
</div>
<!--
<script src="https://cdn.ckeditor.com/4.20.2/standard/ckeditor.js"></script>
<textarea name="editor" id="editor"></textarea>
<script>
    CKEDITOR.replace('editor');
</script>

-->

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
                <li><a href="https://facebook.com"><i class="fa-brands fa-facebook"></i> </a></li>
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