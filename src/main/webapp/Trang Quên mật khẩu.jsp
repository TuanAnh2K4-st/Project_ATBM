<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
  // Ưu tiên lấy từ attribute (do servlet forward set)
  String step = (String) request.getAttribute("step");
  // Nếu attribute không có, fallback lấy từ parameter (URL hoặc form)
  if (step == null) {
    step = request.getParameter("step");
  }
  // Nếu vẫn null thì mặc định là bước 1
  if (step == null) step = "1";

  String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Quên mật khẩu</title>
  <style>
    /* Giữ nguyên CSS của bạn */
    html, body { font-family: sans-serif; height: 100vh; margin: 0; }
    .background {
      height: 100%; display: flex; text-align: left; justify-content: center;
      align-items: center; background-size: cover; background-position: center;
      background-repeat: no-repeat; background-image: url("img/bg.gif"); flex-direction: column;
    }
    .container {
      display: flex; border: 1px solid #ccc; border-radius: 8px; overflow: hidden;
      width: 400px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    .form {
      padding: 20px; width: 100%; background: white;
    }
    .form h2 { margin-bottom: 20px; text-align: center; }
    .form input {
      width: 95%; padding: 10px; margin: 10px 0;
      border: 1px solid #ccc; border-radius: 4px;
    }
    .form button {
      background-color: #156DAD; color: white; border: none;
      padding: 10px; border-radius: 4px; width: 100%; cursor: pointer;
      margin-top: 10px;
    }
    .form button:hover { background-color: #0056b3; }
    .btn-back {
      background-color: #777;
      margin-top: 10px;
      width: auto;
      padding: 8px 16px;
      cursor: pointer;
      display: block;
      margin-left: auto;
      margin-right: auto;
    }
    .btn-back:hover {
      background-color: #444;
    }
    .small-image {
      position: absolute; bottom: 10px; width: 100px; height: auto;
    }
    .message {
      color: red; text-align: center; font-size: 14px;
    }
  </style>
</head>
<body>
<div class="background">
  <div class="container">
    <div class="form">
      <h2>Quên mật khẩu</h2>
      <% if (message != null && !( "1".equals(step) && message.contains("thành công") )) { %>
      <div class="message"><%= message %></div>
      <% } %>

      <% if ("1".equals(step)) { %>
      <!-- Bước 1: Nhập email và username để nhận OTP -->
      <form action="forgot-password" method="POST">
        <input type="hidden" name="action" value="send_otp">
        <input type="text" name="username" placeholder="Tên đăng nhập" required>
        <input type="email" name="email" placeholder="Email" required>
        <button type="submit">Gửi mã OTP</button>
      </form>
      <% } else if ("2".equals(step)) { %>
      <!-- Bước 2: Nhập OTP -->
      <form action="forgot-password" method="POST">
        <input type="hidden" name="action" value="verify_otp">
        <input type="text" name="otp" placeholder="Nhập mã OTP" required>
        <button type="submit">Xác minh OTP</button>
      </form>
      <% } else if ("3".equals(step)) { %>
      <!-- Bước 3: Đổi mật khẩu -->
      <form action="forgot-password" method="POST">
        <input type="hidden" name="action" value="reset_password">
        <input type="password" name="password" placeholder="Mật khẩu mới" required>
        <input type="password" name="confirm" placeholder="Nhập lại mật khẩu" required>
        <button type="submit">Đổi mật khẩu</button>
      </form>
      <% } %>

      <!-- Nút quay lại đăng nhập -->
      <button type="button" class="btn-back" onclick="window.location.href='Trangdangnhap_dangky.jsp'">Quay lại đăng nhập</button>
    </div>
  </div>
</div>
<img src="Img/Component%20góc%20trái.png" class="small-image" height="165" width="164"/>
</body>
</html>
