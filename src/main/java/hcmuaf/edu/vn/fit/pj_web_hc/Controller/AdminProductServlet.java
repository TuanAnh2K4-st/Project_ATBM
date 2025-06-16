package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.ProductDao;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.ProductViewModel;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Stocks;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminProductServlet", value = "/admin-products")
public class AdminProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        List<Products> products = ProductDao.getAllProducts();
        List<ProductViewModel> productViewList = new ArrayList<>();
        for (Products p : products) {
            int quantity = ProductDao.getQuantityOfProduct(p.getProductId());
            productViewList.add(new ProductViewModel(p.getProductName(), p.getProductId(), p.getImageProduct(), p.getBrandName(), quantity, p.getPriceSell()));
        }
        request.setAttribute("productViewList", productViewList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("manageProducts.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if ("add".equals(action)) {
                ProductViewModel productViewModel = new ProductViewModel(request.getParameter("productName"), Integer.parseInt(request.getParameter("productId")), request.getParameter("imageProduct"), request.getParameter("brandName"), Integer.parseInt(request.getParameter("quantityStock")), Integer.parseInt(request.getParameter("priceSell")));

                Products products = new Products(productViewModel.getProductId(), productViewModel.getProductName(), productViewModel.getBrandName(), productViewModel.getPriceSell(), productViewModel.getImageProduct());

                boolean successInsertProduct = ProductDao.insertProduct(products);
                boolean successInsertStock = false;
                String message = "";


                if (successInsertProduct) {
                    Stocks stocks = new Stocks(productViewModel.getProductId(), productViewModel.getQuatityStock());
                    successInsertStock = ProductDao.insertStock(stocks);

                    if (successInsertStock) {
                        message = "Thêm sản phẩm thành công!";
                    } else {
                        message = "Thêm sản phẩm thành công nhưng thêm số tồn kho thất bại!";
                    }
                } else {
                    message = "Thêm sản phẩm thất bại!";
                }

                request.getSession().setAttribute("message", message); // Lưu thông báo vào session
                response.sendRedirect("admin-products?action=list");
                return;


            } else if ("delete".equals(action)) {
            }
        } catch (Exception e) {
            e.printStackTrace(); // in lỗi ra console
            request.getSession().setAttribute("message", "Đã xảy ra lỗi: " + e.getMessage());
            response.sendRedirect("admin-products?action=list");
            return;
        }
    }
}

