package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.KeyAccountDAO;
import hcmuaf.edu.vn.fit.pj_web_hc.DAO.OrdersDAO;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.*;
import hcmuaf.edu.vn.fit.pj_web_hc.Util.MD5;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/process-payment")
public class PaymentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy thông tin từ form thanh toán
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String paymentMethod = request.getParameter("paymentMethod");

        // Kiểm tra session và giỏ hàng
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        AccountUsers user = (AccountUsers) session.getAttribute("user"); // Thống nhất tên session

        if (cart == null || cart.isEmpty() || user == null) {
            response.sendRedirect("Trang_chu.jsp");
            return;
        }

        // Lấy KeyAccount active của user (giả sử bạn đã có DAO này)
        KeyAccount activeKey = KeyAccountDAO.getActiveKeyByUserId(user.getUserId());

        if (activeKey == null) {
            // Chưa có key active => xử lý: ví dụ báo lỗi hoặc chuyển trang thông báo
            request.setAttribute("error", "Bạn chưa có khóa hoạt động. Vui lòng liên hệ quản trị.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        // Ngày hiện tại
        Date orderDate = new Date(System.currentTimeMillis());
        double totalAmount = cart.getTotalPrice();

        // Tạo đơn hàng
        Orders order = new Orders();
        order.setUserId(user.getUserId());
        order.setOrderDate(orderDate.toString());
        order.setStatusOrder(OrdersStatus.CONFIRMATIONING);
        order.setPaymentMethod(paymentMethod);
        order.setDeliveryAddress(address);
        order.setTotalAmount(totalAmount);
        order.setKeyId(activeKey.getKeyId());  // Gán keyId của key active
        order.setSignature(null); // Chưa có chữ ký
        order.setHashData(null);  // Sẽ tạo ở bước tiếp theo

        // Tạo danh sách chi tiết đơn hàng
        List<OrderDetails> detailsList = new ArrayList<>();
        StringBuilder rawInfo = new StringBuilder();
        rawInfo.append(user.getUserName())
                .append("|").append(address)
                .append("|").append(phone)
                .append("|").append(orderDate.toString());

        for (CartItem item : cart.getItems()) {
            OrderDetails detail = new OrderDetails();
            detail.setProductId(item.getProduct().getProductId());
            detail.setQuantity(item.getQuantity());
            detail.setUnitPrice(item.getProduct().getPriceSell());
            detail.setStatusDetail(OrderDetailsStatus.PENDING);
            detailsList.add(detail);

            rawInfo.append("|").append(item.getProduct().getProductName())
                    .append("|").append(item.getQuantity())
                    .append("|").append(item.getProduct().getPriceSell());
        }

        rawInfo.append("|").append(totalAmount);

        // Hash thông tin đơn hàng
        String infoOrder = rawInfo.toString();
        String infoOrderHash = MD5.hash(infoOrder);
        order.setHashData(infoOrderHash);

        // Lưu vào session để xác nhận chữ ký
        session.setAttribute("pendingOrder", order);
        session.setAttribute("pendingDetails", detailsList);
        session.setAttribute("infoOrder", infoOrder);
        session.setAttribute("infoOrderHash", infoOrderHash);

        // Chuyển đến trang nhập chữ ký
        request.getRequestDispatcher("addSignature.jsp").forward(request, response);
    }
}
