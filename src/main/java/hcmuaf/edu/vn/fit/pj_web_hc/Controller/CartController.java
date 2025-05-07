package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name ="cart", value = "/cart")
public class CartController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        String productImage = request.getParameter("productImage");
        int productPrice = Integer.parseInt(request.getParameter("productPrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        List<Products> cart = (List<Products>) session.getAttribute("cart");
        Map<Integer, Integer> quantityMap = (Map<Integer, Integer>) session.getAttribute("quantityMap");

        if (cart == null) {
            cart = new ArrayList<>();
            quantityMap = new HashMap<>();
        }

        // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
        boolean found = false;
        for (Products product : cart) {
            if (product.getProductId() == productId) {
                // Cập nhật số lượng sản phẩm
                int newQuantity = quantityMap.get(productId) + quantity;
                quantityMap.put(productId, newQuantity);
                found = true;
                break;
            }
        }

        // Nếu sản phẩm chưa có, thêm mới
        if (!found) {
            cart.add(new Products(productId, productName, productPrice, productPrice, "", productImage, "", 0, "", null, 0));
            quantityMap.put(productId, quantity);
        }

        session.setAttribute("cart", cart);
        session.setAttribute("quantityMap", quantityMap);
        response.getWriter().println("Sản phẩm đã được thêm vào giỏ hàng!");
    }

}
