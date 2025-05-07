package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;
import hcmuaf.edu.vn.fit.pj_web_hc.DAO.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "SearchServlet", value = "/search")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String search = request.getParameter("querry");
        ProductDao pdao= new ProductDao();

        List<Products> listProduct= pdao.searchByName(search);
        request.setAttribute("search", search);
        request.setAttribute("listProduct", listProduct);

        // request.setAttribute("listC", listCategorys);
        // request.setAttribute("last", last);

        /*if (listProduct.isEmpty()) {
            response.getWriter().write(""); // Trả về chuỗi rỗng
        } else {
            // Xây dựng HTML cho danh sách sản phẩm
            StringBuilder html = new StringBuilder();
            for (Products product : listProduct) {
                html.append("<div class='product-item'>")
                        .append("<img src=''").append(product.getImageProduct()).append("' alt='").append(product.getProductName()).append("'>")
                        .append("<h5>").append(product.getProductName()).append("</h5>")
                        .append("<p><strong>").append(product.getPriceSell()).append(" VNĐ</strong></p>")
                        .append("</div>");
            }
            response.getWriter().write(html.toString());
        }*/

        // Chuyển hướng đến trang kết quả tìm kiếm
        request.getRequestDispatcher("SearchResult.jsp").forward(request, response);
        //return listProduct;
    }


}
