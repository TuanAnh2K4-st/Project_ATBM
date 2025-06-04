package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.KeyAccountDAO;
import hcmuaf.edu.vn.fit.pj_web_hc.DAO.ProductDao;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.KeyAccount;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.KeyStatus;

import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "managerKey", value = "/managerKey")
public class ManagerKeyServlet extends HttpServlet {
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            // Nếu chưa đăng nhập thì chuyển hướng sang trang login hoặc hiện thông báo
            response.sendRedirect("login.jsp");  // hoặc trang login bạn đang dùng
            return;
        }

        // Lấy danh sách tất cả khóa của user (nếu muốn) hoặc khóa active
        // Nếu bạn muốn lấy tất cả khóa:
        // List<KeyAccount> keys = KeyAccountDAO.getAllKeysByUserId(userId);
        // Nếu chỉ lấy khóa active hiện tại thì:
        KeyAccount activeKey = KeyAccountDAO.getActiveKeyByUserId(userId);

        // Đưa dữ liệu lên request để JSP dùng
        request.setAttribute("activeKey", activeKey);

        // Gọi chuyển tiếp đến trang JSP quản lý khóa
        RequestDispatcher dispatcher = request.getRequestDispatcher("managerKey.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");

        if ("saveKey".equals(action)) {
            String publicKey = request.getParameter("publicKey");

            if (publicKey == null || publicKey.trim().isEmpty()) {
                request.setAttribute("errorMessage", "Khóa không được để trống.");
            } else {
                KeyAccount key = new KeyAccount();
                key.setUserId(userId);
                key.setPublicKey(publicKey.trim());
                key.setStatus(KeyStatus.active);
                key.setTimeUp(DATE_FORMAT.format(new Date()));

                boolean success = KeyAccountDAO.insertKey(key);
                if (success) {
                    request.setAttribute("successMessage", "Khóa đã được lưu thành công!");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi lưu khóa.");
                }
            }

        } else if ("lostKey".equals(action)) {
            String newKey = request.getParameter("newKey");
            String confirmKey = request.getParameter("confirmKey");

            if (newKey == null || confirmKey == null || !newKey.equals(confirmKey)) {
                request.setAttribute("errorMessage", "Khóa mới và xác nhận không trùng khớp.");
            } else {
                boolean lostMarked = KeyAccountDAO.markKeyAsLost(userId);

                KeyAccount key = new KeyAccount();
                key.setUserId(userId);
                key.setPublicKey(newKey.trim());
                key.setStatus(KeyStatus.active);
                key.setTimeUp(DATE_FORMAT.format(new Date()));

                boolean insertSuccess = KeyAccountDAO.insertKey(key);

                if (lostMarked && insertSuccess) {
                    request.setAttribute("successMessage", "Khóa mới đã được cập nhật!");
                } else if (!lostMarked) {
                    request.setAttribute("errorMessage", "Lỗi khi đánh dấu khóa cũ là mất.");
                } else {
                    request.setAttribute("errorMessage", "Lỗi khi lưu khóa mới.");
                }
            }
        } else {
            request.setAttribute("errorMessage", "Hành động không hợp lệ.");
        }

        // Sau khi xử lý xong, forward về lại JSP để hiển thị kết quả
        // Cập nhật lại thông tin khóa để hiển thị lại giao diện
        KeyAccount activeKey = KeyAccountDAO.getActiveKeyByUserId(userId);
        request.setAttribute("activeKey", activeKey);

        RequestDispatcher dispatcher = request.getRequestDispatcher("managerKey.jsp");
        dispatcher.forward(request, response);
    }
}
