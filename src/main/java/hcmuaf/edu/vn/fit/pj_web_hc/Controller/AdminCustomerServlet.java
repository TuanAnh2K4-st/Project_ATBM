package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.AccountUserDAO;
import hcmuaf.edu.vn.fit.pj_web_hc.DAO.CustomersDAO;
import hcmuaf.edu.vn.fit.pj_web_hc.DAO.ProductDao;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.*;
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
        try {
            String action = request.getParameter("action");
            if ("edit".equals(action)) {
                int customerId = Integer.parseInt(request.getParameter("customerId"));
                Customers customers = CustomersDAO.getCustomerById(customerId);
                String email = CustomersDAO.getEmailByUserId(customers.getUserId());
                CustomersViewModel customersViewModel = new CustomersViewModel(customers.getCustomerId()
                        , customers.getFullName(), email, customers.getDateOfBirth(), customers.getPhoneNum()
                        , customers.getAddress(), customers.getGender(), customers.getJob());
                request.setAttribute("customerToEdit", customersViewModel);
                RequestDispatcher dispatcher = request.getRequestDispatcher("manageCustomers.jsp");
                dispatcher.forward(request, response);
            } else if ("update".equals(action)) {
                int customerId = Integer.parseInt(request.getParameter("customerId"));
                Customers customer = CustomersDAO.getCustomerById(customerId);
                int userId = customer.getUserId();
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String dateOfBirth = request.getParameter("dateOfBirth");
                String phoneNum = request.getParameter("phoneNum");
                String address = request.getParameter("address");
                String gender = request.getParameter("gender");
                String job = request.getParameter("job");

                Customers customers = new Customers(customerId, name, dateOfBirth, phoneNum, address, gender, job);
                AccountUsers accountUsers = new AccountUsers(userId, email);

                boolean updateCustomers = CustomersDAO.updateCustomers(customers);
                boolean updateEmail = CustomersDAO.updateEmail(accountUsers);

                String message = "";
                if (updateCustomers && updateEmail) {
                    message = "Cập nhật thông tin thành công!";
                } else {
                    message = "Cập nhật thông tin thất bại!";
                }
                request.getSession().setAttribute("message", message);
                response.sendRedirect("admin-customers?action=list");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("message", "Đã xảy ra lỗi: " + e.getMessage());
            response.sendRedirect("admin-customers?action=list");
        }
    }
}