package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.Model.AccountUsers;
import hcmuaf.edu.vn.fit.pj_web_hc.Service.AuthorService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name ="LoginRegister", value ="/loginregister")
public class LoginRegister extends HttpServlet {
   private AuthorService service;

   @Override
   public void init() throws ServletException {
      service = new AuthorService();
   }

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.getRequestDispatcher("Trangdangnhap_dangky.jsp").forward(request, response);
   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // Xử lý UTF-8
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");

      System.out.println("----- BẮT ĐẦU XỬ LÝ POST -----");

      String username = request.getParameter("username");
      String password = request.getParameter("login-password");
      String usernameR = request.getParameter("new_username");
      String email = request.getParameter("emailL");
      String passwordR = request.getParameter("new_password");

      // Đăng nhập
      if (username != null && password != null) {
         AccountUsers userlogin = AuthorService.checkLogin(username, password);
         if (userlogin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("userId", userlogin.getUserId());
            session.setAttribute("user", userlogin);
            request.setAttribute("successMessage", "Đăng nhập thành công!");

            int role = service.getRole(session);
            if (role == 2) {
               response.sendRedirect("Trang_Admin.jsp");
            } else {
               response.sendRedirect("Trang_chu.jsp");
            }
            return;
         } else {
            request.setAttribute("loginError", "Tên đăng nhập hoặc mật khẩu không đúng!");
            request.getRequestDispatcher("Trangdangnhap_dangky.jsp").forward(request, response);
            return;
         }
      }

      // Đăng ký
      if (usernameR != null && email != null && passwordR != null) {
         if (usernameR.isEmpty() || email.isEmpty() || passwordR.isEmpty()) {
            request.setAttribute("emailError", "Vui lòng điền đầy đủ.");
         } else if (!email.contains("@")) {
            request.setAttribute("emailError", "Email không hợp lệ.");
         } else {
            boolean isRegistered = service.register(usernameR, email, passwordR);
            if (isRegistered) {
               request.setAttribute("registerSuccess", "Đăng ký thành công!");
            } else {
               request.setAttribute("registerError", "Tên tài khoản hoặc email đã tồn tại.");
            }
         }
         request.getRequestDispatcher("Trangdangnhap_dangky.jsp").forward(request, response);
      }

      System.out.println("----- KẾT THÚC XỬ LÝ POST -----");
   }
}
