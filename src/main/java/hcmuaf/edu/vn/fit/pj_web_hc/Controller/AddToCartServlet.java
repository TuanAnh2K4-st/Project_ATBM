package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.Model.*;
import hcmuaf.edu.vn.fit.pj_web_hc.Service.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "AddToCartServlet", value = "/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra đã đăng nhập chưa
        HttpSession session = request.getSession();
        AccountUsers user = (AccountUsers) session.getAttribute("user");
        if (user == null) {
            // Chưa đăng nhập => chuyển về trang đăng nhập
            // Có thể lưu URL hiện tại để redirect về sau khi đăng nhập thành công
            session.setAttribute("redirectAfterLogin", "productDetail?id=" + request.getParameter("productId"));
            response.sendRedirect("loginregister");
            return;
        }

        // Đã đăng nhập thì xử lý thêm giỏ hàng
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ProductService service = new ProductService();
        Products product = service.getProductById(String.valueOf(productId));

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }

        cart.addItem(new CartItem(product, quantity));

        response.sendRedirect("cartPage.jsp");
    }
}
