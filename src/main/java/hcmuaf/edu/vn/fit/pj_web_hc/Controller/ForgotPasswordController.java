package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.Model.AccountUsers;
import hcmuaf.edu.vn.fit.pj_web_hc.Service.AuthorService;
import hcmuaf.edu.vn.fit.pj_web_hc.Service.SendEmailService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Random;

@WebServlet("/forgot-password")
public class ForgotPasswordController extends HttpServlet {
    private final AuthorService authorService = new AuthorService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        HttpSession session = req.getSession();
        long now = System.currentTimeMillis();

        switch (action) {
            case "send_otp" -> {
                String username = req.getParameter("username");
                String email = req.getParameter("email");

                // Kiểm tra tồn tại
                if (!authorService.isUsernameOrEmailExist(username, email)) {
                    req.setAttribute("message", "Tên đăng nhập hoặc email không tồn tại.");
                    req.setAttribute("step", "1");
                    req.getRequestDispatcher("Trang Quên mật khẩu.jsp").forward(req, resp);
                    return;
                }

                // Tạo OTP
                String otp = String.format("%06d", new Random().nextInt(999999));
                session.setAttribute("otp", otp);
                session.setAttribute("otpTime", now);
                session.setAttribute("username_fp", username);
                session.setAttribute("email_fp", email);
                session.setAttribute("otpTries", 0L);

                // Gửi email
                SendEmailService.send(email, "Mã OTP đặt lại mật khẩu", "Mã OTP của bạn là: " + otp + "\nHiệu lực trong 2 phút.");

                req.setAttribute("message", "OTP đã được gửi tới email.");
                req.setAttribute("step", "2");
                req.getRequestDispatcher("Trang Quên mật khẩu.jsp").forward(req, resp);
            }

            case "verify_otp" -> {
                String inputOtp = req.getParameter("otp");
                String sessionOtp = (String) session.getAttribute("otp");
                Long otpTime = (Long) session.getAttribute("otpTime");
                Long lastTry = (Long) session.getAttribute("lastTry") != null ? (Long) session.getAttribute("lastTry") : 0L;

                if (now - lastTry < 10_000) {
                    req.setAttribute("message", "Vui lòng đợi 10 giây trước khi thử lại.");
                    req.setAttribute("step", "2");
                    req.getRequestDispatcher("Trang Quên mật khẩu.jsp").forward(req, resp);
                    return;
                }

                session.setAttribute("lastTry", now);

                if (sessionOtp == null || otpTime == null || now - otpTime > 120_000) {
                    req.setAttribute("message", "OTP đã hết hạn. Vui lòng gửi lại.");
                    session.removeAttribute("otp");
                    session.removeAttribute("otpTime");
                    req.setAttribute("step", "1");
                    req.getRequestDispatcher("Trang Quên mật khẩu.jsp").forward(req, resp);
                    return;
                }

                if (!inputOtp.equals(sessionOtp)) {
                    req.setAttribute("message", "OTP không chính xác.");
                    req.setAttribute("step", "2");
                    req.getRequestDispatcher("Trang Quên mật khẩu.jsp").forward(req, resp);
                    return;
                }

                req.setAttribute("step", "3");
                req.getRequestDispatcher("Trang Quên mật khẩu.jsp").forward(req, resp);
            }

            case "reset_password" -> {
                String password = req.getParameter("password");
                String confirm = req.getParameter("confirm");

                if (!password.equals(confirm)) {
                    req.setAttribute("message", "Mật khẩu không khớp.");
                    req.setAttribute("step", "3");
                    req.getRequestDispatcher("Trang Quên mật khẩu.jsp").forward(req, resp);
                    return;
                }

                String username = (String) session.getAttribute("username_fp");
                if (username == null) {
                    req.setAttribute("message", "Hết phiên làm việc. Vui lòng bắt đầu lại.");
                    req.setAttribute("step", "1");
                    req.getRequestDispatcher("Trang Quên mật khẩu.jsp").forward(req, resp);
                    return;
                }

                AccountUsers user = authorService.checkLogin(username, password); // chỉ để lấy userId
                if (user == null) {
                    // nếu không đăng nhập được thì tìm lại bằng email
                    String email = (String) session.getAttribute("email_fp");
                    user = new AccountUsers();
                    user.setUserName(username);
                    user.setEmail(email);
                    user.setPasswordUser(AuthorService.hashPassword(password));

                    // Lấy userId từ CSDL
                    user = authorService.getUserByUsername(username);
                    if (user == null) {
                        req.setAttribute("message", "Không tìm thấy người dùng.");
                        req.setAttribute("step", "1");
                        req.getRequestDispatcher("Trang Quên mật khẩu.jsp").forward(req, resp);
                        return;
                    }
                }

                user.setPasswordUser(AuthorService.hashPassword(password));
                boolean updated = authorService.updateUserPassword(user);

                if (updated) {
                    req.setAttribute("message", "Đặt lại mật khẩu thành công. Vui lòng đăng nhập.");
                    req.setAttribute("step", "1");
                    session.invalidate();
                } else {
                    req.setAttribute("message", "Đặt lại mật khẩu thất bại.");
                    req.setAttribute("step", "3");
                }

                req.getRequestDispatcher("Trang Quên mật khẩu.jsp").forward(req, resp);
            }
        }
    }
}
