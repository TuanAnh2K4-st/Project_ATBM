package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.Model.Cart;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "UpdateQuantityServlet", value = "/update-quantity")
public class UpdateQuantityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int delta = Integer.parseInt(req.getParameter("delta"));

        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        if (cart != null) {
            CartItem item = cart.getItem(id);
            if (item != null) {
                int newQty = item.getQuantity() + delta;
                if (newQty <= 0) {
                    cart.removeItem(id);
                    session.setAttribute("cart", cart);
                    out.print("{\"success\": true, \"quantity\": 0, \"total\": " + cart.getTotalPrice() + "}");
                } else {
                    item.setQuantity(newQty);
                    session.setAttribute("cart", cart);
                    int itemTotal = item.getTotalPrice();
                    out.print("{\"success\": true, \"quantity\": " + newQty + ", \"itemTotal\": " + itemTotal + ", \"total\": " + cart.getTotalPrice() + "}");
                }
            } else {
                out.print("{\"success\": false, \"message\": \"Sản phẩm không tồn tại trong giỏ hàng.\"}");
            }
        } else {
            out.print("{\"success\": false, \"message\": \"Giỏ hàng trống.\"}");
        }
        out.flush();
    }
}
