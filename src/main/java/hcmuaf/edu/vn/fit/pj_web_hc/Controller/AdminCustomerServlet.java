package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.CustomersDAO;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Customers;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.CustomersViewModel;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AdminCustomerServlet", value = "/admin-customers")
public class AdminCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customers> customers = CustomersDAO.getAllCustomers();
        List<CustomersViewModel> customerViewModels = new ArrayList<>();
        for (Customers customer : customers) {
            String email = CustomersDAO.getEmailByUserId(customer.getUserId());
            customerViewModels.add(new CustomersViewModel(customer.getCustomerId()
                    , customer.getFullName(), email, customer.getDateOfBirth()
                    , customer.getPhoneNum(), customer.getAddress()
                    , customer.getGender(), customer.getJob()));
        }
        request.setAttribute("customersList", customerViewModels);
        RequestDispatcher dispatcher = request.getRequestDispatcher("manageCustomers.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
