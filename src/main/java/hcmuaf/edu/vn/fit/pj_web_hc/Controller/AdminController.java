package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.ProductDao;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
@WebServlet(name = "AdminController", value = "/admin")
public class AdminController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Products> productsList = new ArrayList<Products>();
        productsList= ProductDao.getAllProducts();
        request.setAttribute("productsList", productsList);
        request.getRequestDispatcher("Trang_Admin.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }


}
