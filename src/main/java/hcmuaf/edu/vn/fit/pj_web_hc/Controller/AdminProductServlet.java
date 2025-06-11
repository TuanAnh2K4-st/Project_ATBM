package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.ProductDao;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.ProductViewModel;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminProductServlet", value = "/admin-products")
public class AdminProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Products> products = ProductDao.getAllProducts();
        List<ProductViewModel> productViewList = new ArrayList<>();
        for (Products p : products) {
            int quantity = ProductDao.getQuantityOfProduct(p.getProductId());
            productViewList.add(new ProductViewModel(
                    p.getProductName(),
                    p.getProductId(),
                    p.getImageProduct(),
                    p.getBrandName(),
                    quantity,
                    p.getPriceSell()
            ));
        }
        request.setAttribute("productViewList", productViewList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("manageProducts.jsp");
        dispatcher.forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
