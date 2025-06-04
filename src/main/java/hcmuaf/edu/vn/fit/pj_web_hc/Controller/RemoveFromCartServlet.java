package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.Model.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RemoveFromCartServlet", value = "/remove-from-cart")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        if (cart != null) {
            cart.removeItem(id);
            session.setAttribute("cart", cart);
            out.print("{\"success\": true, \"total\": " + cart.getTotalPrice() + "}");
        } else {
            out.print("{\"success\": false, \"message\": \"Giỏ hàng trống.\"}");
        }
        out.flush();
    }
}
