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

@WebServlet(name = "ListProduct", value = "/list-product")
public class ListProduct extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = new ProductService();
        // Lấy số trang từ request, mặc định là 1 nếu không có
        int page = 1;
        int pageSize = 10; // Mỗi trang sẽ hiển thị 10 sản phẩm
        String pageParam = request.getParameter("page");
        if (pageParam != null && !pageParam.isEmpty()) {
            page = Integer.parseInt(pageParam);
        }
        // Lấy tham số bộ lọc từ request
        String brand = request.getParameter("brand");
        String volume = request.getParameter("volume");
        String sortPrice = request.getParameter("sortPrice");
        List<Products> products;
        // Nếu không có bộ lọc, hiển thị sản phẩm mới nhất theo createAt
        if ((brand == null || brand.isEmpty()) && (volume == null || volume.isEmpty()) && (sortPrice == null || sortPrice.isEmpty())) {
            products = productService.getAllProductsSortedByDate(page, pageSize);
        } else {
            // Nếu có bộ lọc, lấy danh sách sản phẩm đã lọc
            products = productService.getFilteredProducts(page, pageSize, brand, volume, sortPrice);
        }
        int totalProducts = productService.getTotalProductCount();
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
        // Lưu dữ liệu vào request
        request.setAttribute("data", products);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("brand", brand);
        request.setAttribute("volume", volume);
        request.setAttribute("sortPrice", sortPrice);
        // Forward đến trang JSP
        request.getRequestDispatcher("Trang sản phẩm mới.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
//    // Khởi tạo ProductService để lấy dữ liệu sản phẩm
//    private ProductService productService;
//
//    @Override
//    public void init() throws ServletException {
//        // Khởi tạo ProductService khi servlet được khởi tạo
//        productService = new ProductService();
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Lấy danh sách sản phẩm từ ProductService (hoặc từ DAO)
//        List<Product> productList = productService.getAllProducts(); // Giả sử getAllProducts() trả về danh sách sản phẩm
//
//        // Đưa danh sách sản phẩm vào request để sử dụng trong JSP
//        request.setAttribute("productList", productList);
//
//        // Chuyển tiếp đến trang JSP để hiển thị sản phẩm
//        request.getRequestDispatcher("Trang sản phẩm mới.jsp").forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Xử lý yêu cầu POST, ví dụ: thêm sản phẩm mới hoặc xử lý form
//        // Dữ liệu sẽ được gửi lên qua phương thức POST từ form hoặc API
//
//        // Ở đây không có logic POST, vì vậy phương thức này sẽ để trống
//    }
//
//    @Override
//    public void destroy() {
//        // Nếu cần, có thể hủy các tài nguyên (ví dụ: đóng kết nối cơ sở dữ liệu)
//        super.destroy();
//    }
}