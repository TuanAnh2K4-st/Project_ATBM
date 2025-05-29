package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import hcmuaf.edu.vn.fit.pj_web_hc.DAO.ProductDao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));
        int quantity = 1;
        try {
            quantity = Integer.parseInt(request.getParameter("quantity"));
            if (quantity < 1) quantity = 1; // bảo vệ số lượng hợp lệ
        } catch (Exception e) {
            quantity = 1;
        }

        HttpSession session = request.getSession();

        List<Products> cart = (List<Products>) session.getAttribute("cart");
        Map<Integer, Integer> quantityMap = (Map<Integer, Integer>) session.getAttribute("quantityMap");

        if (cart == null) {
            cart = new ArrayList<>();
            quantityMap = new HashMap<>();
        }

        boolean exists = false;
        for (Products p : cart) {
            if (p.getProductId() == productId) {
                exists = true;
                break;
            }
        }

        if (!exists) {
            Products product = ProductDao.getProductById(productId);
            if (product != null) {
                cart.add(product);
                quantityMap.put(productId, quantity);
            }
        } else {
            int currentQty = quantityMap.getOrDefault(productId, 0);
            quantityMap.put(productId, currentQty + quantity);
        }

        session.setAttribute("cart", cart);
        session.setAttribute("quantityMap", quantityMap);

        // Chuyển về trang giỏ hàng
        response.sendRedirect("Trang giỏ hàng.jsp");
    }
}

