package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.OrdersDAO;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Orders;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.PublicKey;
import java.security.Signature;
import java.security.spec.X509EncodedKeySpec;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@WebServlet(name = "AdminOrderServlet", value = "/admin-orders")
public class AdminOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Orders> listOrders = OrdersDAO.getAllOrdersWithPublicKey();
        List<Boolean> verificationResults = new ArrayList<>();

        for (Orders order : listOrders) {
            try {
                // Giải mã Public Key từ Base64
                byte[] pubKeyBytes = Base64.getDecoder().decode(order.getKey().getPublicKey());
                X509EncodedKeySpec keySpec = new X509EncodedKeySpec(pubKeyBytes);
                KeyFactory kf = KeyFactory.getInstance("RSA");
                PublicKey publicKey = kf.generatePublic(keySpec);

                // Kiểm tra chữ ký
                Signature sig = Signature.getInstance("SHA1withRSA");
                sig.initVerify(publicKey);
                sig.update(order.getHashData().getBytes(StandardCharsets.UTF_8));
                boolean isVerified = sig.verify(Base64.getDecoder().decode(order.getSignature()));

                verificationResults.add(isVerified);
            } catch (Exception e) {
                e.printStackTrace();
                verificationResults.add(false); // Nếu lỗi, đánh dấu là không hợp lệ
            }
        }

        req.setAttribute("listOrders", listOrders);
        req.setAttribute("verifications", verificationResults);
        req.getRequestDispatcher("manageOrders.jsp").forward(req, resp);
    }
}
