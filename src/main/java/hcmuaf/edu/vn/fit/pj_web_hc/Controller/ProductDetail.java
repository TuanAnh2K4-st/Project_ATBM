package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;
import hcmuaf.edu.vn.fit.pj_web_hc.Service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
@WebServlet(name = "productDetail", value = "/detail")
public class ProductDetail extends HttpServlet {

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id = request.getParameter("id"); // Lấy tham số id từ URL
            System.out.println("ID nhận được từ request: " + id); // In ra giá trị ID để kiểm tra

            // Kiểm tra nếu id hợp lệ
            if (id == null || id.isEmpty()) {
                request.setAttribute("error", "Sản phẩm không tồn tại!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Lấy thông tin sản phẩm từ service
            ProductService service = new ProductService();
            Products product = service.getProductById(id);
            // Kiểm tra nếu không tìm thấy sản phẩm
            if (product == null) {
                request.setAttribute("error", "Sản phẩm không tồn tại!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            // Truyền thông tin sản phẩm vào request để sử dụng trong JSP
            request.setAttribute("product", product); // Đổi tên attribute ở đây
            List<Products> relatedProducts = service.getRelatedProducts(product);

            request.setAttribute("product", product);
            request.setAttribute("relatedProducts", relatedProducts); // Truyền danh sách sản phẩm liên quan
            request.getRequestDispatcher("Trang chi tiết 1 sản phẩm.jsp").forward(request, response);
        }
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }
    }
