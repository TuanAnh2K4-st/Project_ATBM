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
      if (service == null) {
         System.out.println("LỖI: service không được khởi tạo đúng!");
      } else {
         System.out.println("Dịch vụ đã được khởi tạo thành công!");
      }
   }

   //Hiển thị trang đăng nhập và đăng ký
   @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     request.getRequestDispatcher("Trangdangnhap_dangky.jsp").forward(request, response);
   }

   @Override
   public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("----- BẮT ĐẦU XỬ LÝ POST -----");

         String username = request.getParameter("username");
         String password = request.getParameter("login-password");

         String usernameR = request.getParameter("new_username");
         String email = request.getParameter("emailL");
         String passwordR = request.getParameter("new_password");


      //Kiểm tra đăng nhập
         if (username != null && password != null) {
            System.out.println("Đang kiểm tra đăng nhập...");
            System.out.println("Username đăng nhập: " + username);
            System.out.println("Password đăng nhập: " + password);

            AccountUsers userlogin = service.checkLogin(username, password);
        /* userlogin.setUserName(username);
         userlogin.setPasswordUser(password);*/

            if (userlogin != null) {
               System.out.println("Đăng nhập thành công!");
               HttpSession session = request.getSession();
               session.setAttribute("userId", userlogin.getUserId());
               session.setAttribute("user", userlogin);
               request.setAttribute("successMessage", "Đăng nhập thành công!");

               int role = service.getRole(session); // Truyền session vào phương thức getRole

               if (role == 0 || role == 1) {
                  // Điều hướng đến giao diện người dùng
                  System.out.println("Đăng nhập thành công! Vào trang chủ");
                  response.sendRedirect("homePage");

                  //response.getWriter().println("<h1>Đăng nhập thành công! Vào trang chủ</h1>");

               } else if (role == 2) {
                  // Điều hướng đến giao diện admin
                  System.out.println("Đăng nhập thành công! Vào trang admin");
                  response.sendRedirect("adminPage");
                //  response.getWriter().println("<h1>Đăng nhập thành công! Vào Admin</h1>");

               }
            } else {
               request.setAttribute("loginError", "Tên đăng nhập hoặc mật khẩu không đúng!");
               request.setAttribute("oldUsername", username); // SỬA ĐỔI isuse 1: Giữ lại username khi sai
               request.getRequestDispatcher("Trangdangnhap_dangky.jsp").forward(request, response);
            }
         }

         //Kiểm tra đăng ký
         if (usernameR != null && email != null && passwordR != null) {
            System.out.println("Đang xử lý đăng ký...");

            System.out.println("Username đăng ký: " + usernameR);
            System.out.println("Email đăng ký: " + email);
            System.out.println("Password đăng ký: " + passwordR);

            //Kiểm tra ng dùng nhập hợp lệ không
            if (usernameR.isEmpty() || email.isEmpty() || passwordR.isEmpty()) {
               request.setAttribute("emailError", "Vui lòng điền đầy đủ.");
            } else if (!email.contains("@")) {
               request.setAttribute("emailError", "Email không hợp lệ.");
            } else {
               boolean isRegistered = service.register(usernameR, email, passwordR);
               System.out.println("Kết quả đăng ký: " + isRegistered);

               if (isRegistered) {
                  System.out.println("Đăng ký thành công!");
                  request.setAttribute("registerSuccess", "Đăng ký thành công!");
               } else {
                  System.out.println("Lỗi đăng ký: Tên tài khoản hoặc email đã tồn tại.");
                  request.setAttribute("registerError", " Tên tài khoản hoặc email đã tồn tại.");
               }

            }
            //Chuyển hướng đăng nhập lại sau đăng ký
            System.out.println("Forwarding to dangnhap_dangky.jsp...");
           request.getRequestDispatcher("Trangdangnhap_dangky.jsp").forward(request, response);
         }

      System.out.println("----- KẾT THÚC XỬ LÝ POST -----");

   }

}
