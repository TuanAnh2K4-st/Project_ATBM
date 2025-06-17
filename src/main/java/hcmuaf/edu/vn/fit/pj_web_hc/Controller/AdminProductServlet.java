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


            } else if ("delete".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                boolean successDeleteProduct = ProductDao.deleteProduct(productId);
                String message = "";
                if (successDeleteProduct) {
                    message = "Xóa sản phẩm thành công!";
                } else {
                    message = "Xóa sản phẩm thất bại!";
                }
                request.getSession().setAttribute("message", message);
                response.sendRedirect("admin-products?action=list");

            } else if ("edit".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                Products product = ProductDao.getProductById(productId);
                int quantity = ProductDao.getQuantityOfProduct(product.getProductId());
                ProductViewModel productViewModel = new ProductViewModel(product.getProductName(), product.getProductId(), product.getImageProduct(), product.getBrandName(), quantity, product.getPriceSell());
                request.setAttribute("productToEdit", productViewModel);
                RequestDispatcher dispatcher = request.getRequestDispatcher("manageProducts.jsp");
                dispatcher.forward(request, response);
            } else if ("update".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                String productName = request.getParameter("name");
                String imageProduct = request.getParameter("image");
                String brandName = request.getParameter("brand");
                int quantityStock = Integer.parseInt(request.getParameter("quantity"));
                int priceSell = Integer.parseInt(request.getParameter("price"));

                Products product = new Products(productId, productName, brandName, priceSell, imageProduct);
                Stocks stocks = new Stocks(productId, quantityStock);

                boolean updatedProductInfo = ProductDao.updateProductInfo(product);
                boolean updatedStock = ProductDao.updateStock(stocks);

                String message = "";
                if (updatedProductInfo && updatedStock) {
                    message = "Cập nhật sản phẩm thành công!";
                } else {
                    message = "Cập nhật sản phẩm thất bại!";
                }
                request.getSession().setAttribute("message", message);
                response.sendRedirect("admin-products?action=list");
            }
        } catch (Exception e) {
            e.printStackTrace(); // in lỗi ra console
            request.getSession().setAttribute("message", "Đã xảy ra lỗi: " + e.getMessage());
            response.sendRedirect("admin-products?action=list");
        }
    }
}

