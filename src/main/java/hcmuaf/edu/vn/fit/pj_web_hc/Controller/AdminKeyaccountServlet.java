package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.KeyAccountDAO;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.KeyAccount;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminKeyaccountServlet", value = "/admin-key")
public class AdminKeyaccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<KeyAccount> keyList = KeyAccountDAO.getAllKeyAccounts();
        request.setAttribute("keyList", keyList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("managerKeyaccount.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy thông tin từ form gửi lên
            int keyId = Integer.parseInt(request.getParameter("keyId"));
            String newStatus = request.getParameter("newStatus");

            // Cập nhật trạng thái key
            KeyAccountDAO.updateKeyStatus(keyId, newStatus);
        } catch (Exception e) {
            e.printStackTrace(); // Logging thực tế nên dùng logger
        }

        // Sau khi cập nhật, chuyển hướng về trang danh sách để load lại dữ liệu
        response.sendRedirect("admin-key");
    }
}
