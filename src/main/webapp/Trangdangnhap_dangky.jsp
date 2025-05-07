<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.security.*, hcmuaf.edu.vn.fit.pj_web_hc.Service.AuthorService" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <title>Đăng Nhập /Đăng Ký</title>
  <style>
    html, body {
      font-family: sans-serif;
      height: 100vh;
      margin: 0;
      overflow: hidden; /* Ẩn thanh cuộn */
      background-image: url("<%= request.getContextPath() %>/img/bg.gif");
      background-size: cover; /* Đảm bảo hình nền bao phủ toàn bộ */
      background-position: center; /* Căn giữa hình nền */
      background-repeat: no-repeat;
    }
      .background{
        height: 100%;
      display: flex;
        text-align: left;
      justify-content: center;
      align-items: center;
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;/*k lặp lại hình nền*/
      flex-direction: column;
    }
    .logo{
      max-width: 100%;
      height: 20%;
      margin-bottom: 30px;
      justify-items: center;
      align-items: center;
      padding: 10px 15px;
    }
    .container {
      margin-top: 20px;
      background-color: rgba(250, 250, 250, 0.7);
      display: flex; /* Thiết lập chế độ hiển thị của phần tử là flexbox*/
      border: 1px solid #ccc;
      border-radius: 8px;/* Bo tròn các góc của phần tử với bán kính 8px. */
      overflow: hidden;
      width: 800px;
      padding: 40px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Bóng đổ cho phần tử, với độ dịch chuyển 0px theo trục x, 2px theo trục y, và độ mờ 10px, màu đen với độ trong suốt 0.1. */
    }

    .conform {
      margin-top: 10px;
      padding: 10px;
      width: 50%;
    }
    .conform h2 {

      width: 50%;
      margin-bottom: 20px;
    }
    .conform input {
      width: calc(100% - 40px);
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .conform .toggle-password {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #0056b3;
    }
    .conform .password-wrapper {
      position: relative;
    }
    .conform button {
      border: solid 0.5px #b3d4fc;
      background-color: #156DAD;
      color: white;
      padding: 10px;
      border-radius: 4px;
      cursor: pointer; /*thay đổi hình dạng con trỏ chuột*/
    }
    .conform button:hover {
      background-color: #0056b3; /*hiệu ứng chuyển chuột qua button*/
    }
    .toggle-password {/*ẩn hiện mật khẩu*/
      position: absolute;
      right: 10px;
      top: 10px;
      cursor: pointer;
    }
    .divider {
      width: 1px;
      background-color: #ccc; /*phân tách ptu trong form*/
    }
    .footer{
      width: 100%;
      height: 30px;
      padding: 30px 20px;
      margin: 15px 15px;
      text-align: center;
      align-items: center;
    }
    .footer button{
      color: white;
      background-color: #2693E0;
      text-align: center;
      border-radius: 4px;
      padding: 5px;
    }

  </style>
</head>
<body>
<div class="background">
<div class="logo">
<img src="<%= request.getContextPath() %>/img/logo CAD_Xóa nền.png" alt="logo" height="180" width="370" >

</div>
   <form action="${pageContext.request.contextPath}/loginregister" method="post">
<div class="container">
  <div class="conform" >
    <form action="${pageContext.request.contextPath}/loginregister" method="POST">
    <h2>Đăng Nhập</h2>
    <!-- Hiển thị thông báo lỗi nếu có -->
    <% if (request.getAttribute("loginError") != null) { %>
    <div class="alert alert-danger">
      <%= request.getAttribute("loginError") %>
    </div>
    <% } %>

      <input type="text" name="username" placeholder="Tên đăng nhập" required>
      <div class="password-wrapper">
      <input type="password" name="login-password" id="login-password" placeholder="Mật khẩu" required>
        <span class="toggle-password" onclick="togglePassword('login-password',this)">
         <!-- <i class="fa-regular fa-eye-slash" style="color: #0056b3;"></i>-->
        </span>
      <p>
        <a href="Trang Quên mật khẩu.jsp" style="color: #0056b3; text-decoration: none; font-size: 10px">Quên mật khẩu?</a>
      </p>
      </div>
     <button type="submit" >Đăng Nhập</button>
        <!-- Hiển thị thông báo đăng nhập thành công-->
        <% if (request.getAttribute("successMessage") != null) { %>
        <div class="alert alert-success alert-dismissible fade show" style="margin-top: 20px" role="alert">
            <i class="fas fa-check-circle" style="color: green;"></i> <!-- Dấu tick màu xanh -->
            <%= request.getAttribute("successMessage") %>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <% } %>
    </form>
  </div>
  <div class="divider"></div>

  <div class="conform">
   <form action="${pageContext.request.contextPath}/loginregister" method="POST">
    <h2>Đăng Ký</h2>

    <!-- Hiển thị thông báo lỗi nếu có -->
    <% if (request.getAttribute("registerError") != null) { %>
    <div class="alert alert-danger">
      <%= request.getAttribute("registerError") %>
    </div>
    <% } %>
      <input type="text" id="new_username" name="new_username" placeholder="Tên đăng ký" required>
      <input type="email" id="emailL" name="emailL" placeholder="Email" required>

      <!-- Hiển thị thông báo lỗi email -->
      <% if(request.getAttribute("emailError") !=null){%>
      <div class="alert alert-danger">
        <%= request.getAttribute("emailError")%>
      </div>
     <% }%>
      <div class="password-wrapper">
      <input type="password" id="new_password" name="new_password" placeholder="Mật khẩu" required>
      <span class="toggle-password" onclick="togglePassword('new_password', this)">
         <!-- <i class="fa-regular fa-eye-slash" style="color: #0056b3;"></i>-->
          </span>
      </div>
      <button type="submit">Đăng Ký</button>
      <!-- Hiển thị thông báo thành công nếu có -->
      <% if (request.getAttribute("registerSuccess") != null) { %>
      <div class="alert alert-success alert-dismissible fade show" style="margin-top: 20px" role="alert">
        <i class="fas fa-check-circle" style="color: green;"></i> <!-- Dấu tick màu xanh -->
        <%= request.getAttribute("registerSuccess") %>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <% } %>
    </form>
  </div>
</div>
    </form>
  <!--
<div class="footer">
<button>
  <i class="fa-brands fa-google-plus-g" style="color: #ffffff;"></i>
  Đăng nhập bằng Google
</button>
</div>-->
</div>
<script>
  function togglePassword(inputId, toggleIcon) {
    const passwordInput = document.getElementById(inputId);
    const icon = toggleIcon.querySelector('i');
    if (passwordInput.type === 'password') {
      passwordInput.type = 'text';
      icon.classList.remove('fa-eye-slash');
      icon.classList.add('fa-eye');
    } else {
      passwordInput.type = 'password';
      icon.classList.remove('fa-eye');
      icon.classList.add('fa-eye-slash');
    }
  }
</script>
</body>
</html>
