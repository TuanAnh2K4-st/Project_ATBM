package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;
import hcmuaf.edu.vn.fit.pj_web_hc.DAO.ProductDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value="/homePage")
public class HomeController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("navbarNav", "Tiêu đề");

        List<Products> newproducts = ProductDao.getNewProducts(); // Lấy danh sách sản phẩm từ DAO
        request.setAttribute("newProducts", newproducts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Trang_chu.jsp");
        System.out.println("Số sản phẩm mới: " + newproducts.size());
        dispatcher.forward(request, response);


    }
//Box sản phẩm mới

        public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }
}