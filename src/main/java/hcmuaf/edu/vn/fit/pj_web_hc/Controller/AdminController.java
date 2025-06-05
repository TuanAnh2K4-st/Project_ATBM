package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.ProductDao;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;
@MultipartConfig
@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao productDao = new ProductDao();
        // Load danh sách sản phẩm
        List<Products> productsList = productDao.getAllProducts();
        request.setAttribute("productsList", productsList);

        request.getRequestDispatcher("Trang_Admin.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDao productDao = new ProductDao();
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            String productIdStr = request.getParameter("productId");
            if (productIdStr != null && !productIdStr.isEmpty()) {
                try {
                    int productId = Integer.parseInt(productIdStr);
                    productDao.deleteById(productId);
                    request.setAttribute("successMessage", "Xóa sản phẩm thành công.");
                    forwardWithProducts(request, response, productDao);
                } catch (NumberFormatException e) {
                    log("Giá trị productId không hợp lệ: " + e.getMessage());
                    request.setAttribute("errorMessage", "ID sản phẩm không hợp lệ.");
                    forwardWithProducts(request, response, productDao);
                }
                forwardWithProducts(request, response, productDao);
            }
        } else if ("add".equals(action)) {
            // Lấy tham số
            String productCodeStr = request.getParameter("productCode");
            String productImage = request.getParameter("productImage");
            String productBrand = request.getParameter("productBrand");
            String productName = request.getParameter("productName");
            String productPriceStr = request.getParameter("productPrice");

            // Kiểm tra hợp lệ và chuyển đổi
            int productCode = 0, productPrice = 0;
            try {
                productCode = Integer.parseInt(productCodeStr);
                productPrice = Integer.parseInt(productPriceStr);
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Mã sản phẩm hoặc giá không hợp lệ.");
                forwardWithProducts(request, response, productDao);
                return;
            }

            if (productImage == null || productBrand == null || productName == null || productImage.isEmpty() || productBrand.isEmpty() || productName.isEmpty()) {
                request.setAttribute("errorMessage", "Vui lòng nhập đầy đủ thông tin.");
                forwardWithProducts(request, response, productDao);
                return;
            }

            // Thêm sản phẩm
            try {
                Products product = new Products(productCode, productImage, productBrand, productName, productPrice);
                productDao.add(product);
                request.setAttribute("successMessage", "Thêm sản phẩm thành công.");
            } catch (Exception e) {
                log("Lỗi khi thêm sản phẩm: " + e.getMessage());
                request.setAttribute("errorMessage", "Lỗi khi thêm sản phẩm.");
            }

            forwardWithProducts(request, response, productDao);

        }
    }


    private void forwardWithProducts(HttpServletRequest request, HttpServletResponse response, ProductDao productDao) throws ServletException, IOException {
        List<Products> productsList = productDao.getAllProducts();
        request.setAttribute("productsList", productsList);
        request.getRequestDispatcher("Trang_Admin.jsp").forward(request, response);
    }
}

