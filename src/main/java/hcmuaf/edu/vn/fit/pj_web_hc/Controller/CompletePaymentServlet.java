package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.OrdersDAO;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.OrderDetails;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Orders;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/complete-payment")
public class CompletePaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String signature = request.getParameter("signature");

        HttpSession session = request.getSession();
        Orders order = (Orders) session.getAttribute("pendingOrder");
        List<OrderDetails> details = (List<OrderDetails>) session.getAttribute("pendingDetails");

        if (order == null || details == null || signature == null || signature.isEmpty()) {
            response.sendRedirect("Trang_chu.jsp");
            return;
        }

        order.setSignature(signature);

        // Gọi DAO lưu đơn hàng
        boolean success = OrdersDAO.saveOrderWithDetails(order, details);

        if (success) {
            // Xóa giỏ hàng và các thông tin tạm
            session.removeAttribute("cart");
            session.removeAttribute("pendingOrder");
            session.removeAttribute("pendingDetails");
            session.removeAttribute("infoOrder");
            session.removeAttribute("infoOrderHash");

            // Đặt thông báo thành công trong session
            session.setAttribute("message", "Giao dịch thành công");

            // Redirect về trang homePage
            response.sendRedirect(request.getContextPath() + "/homePage");
        } else {
            request.setAttribute("error", "Có lỗi xảy ra khi lưu đơn hàng.");
            request.getRequestDispatcher("addSignature.jsp").forward(request, response);
        }
    }
}
