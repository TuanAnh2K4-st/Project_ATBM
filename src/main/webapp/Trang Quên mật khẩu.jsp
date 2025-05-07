<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Quen mat khau</title>
</head>
<style>
    html, body {
      font-family: sans-serif;
      height: 100vh;
      margin: 0;
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
      background-image: url("img/bg.gif");
      flex-direction: column;
    }
  .container {
    display: flex; /* Thiết lập chế độ hiển thị của phần tử là flexbox*/
    border: 1px solid #ccc;
    border-radius: 8px;/* Bo tròn các góc của phần tử với bán kính 8px. */
    overflow: hidden;
    width: 400px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Bóng đổ cho phần tử, với độ dịch chuyển 0px theo trục x, 2px theo trục y, và độ mờ 10px, màu đen với độ trong suốt 0.1. */
  }

  .form {
    padding: 20px;
    width: 100%;
    background: white;
  }
  .form h2 {
    margin-bottom: 20px;
    text-align: center;/*căn giữa tiêu đề*/
  }
  .form input {
    width: 95%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
  .form button {
    background-color: #156DAD;
    color: white;
    border: none;
    padding: 10px;
    border-radius: 4px;
    width: 100%;
    cursor: pointer; /*thay đổi hình dạng con trỏ chuột*/
  }
  .form button:hover {
    background-color: #0056b3; /*hiệu ứng chuyển chuột qua button*/

}.small-image {
   position: absolute; /* Định vị tuyệt đối */
   bottom: 10px; /* Cách đáy 20px */
    /* Cách bên phải 20px */
   width: 100px; /* Chiều rộng của ảnh */
   height: auto; /* Tự động điều chỉnh chiều cao */
 }

</style>
<body>
<div class="background">
<div class="container">
  <div class="form">
    <h2>Quên mật khẩu?</h2>
    <form action="#" method="POST">
      <input type="text" name="username" placeholder="Tên đăng nhập" required>
      <input type="email" name="email" placeholder="Email" required>
      <button type="submit">Đặt lại mật khẩu</button>
    </form>
  </div>
</div>
</div>
<img src="Img/Component%20góc%20trái.png" class="small-image" height="165" width="164"/>
</body>
</html>
