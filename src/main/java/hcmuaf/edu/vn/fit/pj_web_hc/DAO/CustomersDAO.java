package hcmuaf.edu.vn.fit.pj_web_hc.DAO;

import hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.AccountUsers;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Customers;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.CustomersViewModel;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomersDAO {
    public static List<Customers> getAllCustomers() {
        List<Customers> customers = new ArrayList<Customers>();
        String query = "SELECT * FROM customers";
        try (
                Connection conn = new DBConnect().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
        ) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                customers.add(new Customers(rs.getInt("customerId"),
                        rs.getString("fullName"),
                        rs.getString("dateOfBirth"),
                        rs.getString("phoneNum"),
                        rs.getString("address"),
                        rs.getString("gender"),
                        rs.getString("job"),
                        rs.getString("workSpace"),
                        rs.getString("updateAt"),
                        rs.getInt("userId")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }

    public static Customers getCustomerById(int customerId) {
        Statement s = DBConnect.get();
        if (s == null) return null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM customers WHERE customerId = " + customerId;
            rs = s.executeQuery(query);

            if (rs.next()) {
                return new Customers(
                        rs.getInt("customerId"),
                        rs.getString("fullName"),
                        rs.getString("dateOfBirth"),
                        rs.getString("phoneNum"),
                        rs.getString("address"),
                        rs.getString("gender"),
                        rs.getString("job"),
                        rs.getString("updateAt"),
                        rs.getString("workSpace"),
                        rs.getInt("userId")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String getEmailByUserId(int userId) {
        String email = "";
        String query = "SELECT email FROM accountusers WHERE userId = ?";
        try (
                Connection conn = new DBConnect().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
        ) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                email = rs.getString("email");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return email;
    }

    public static boolean updateCustomers(Customers customers) {
        String query = "UPDATE customers SET fullName = ?,dateOfBirth = ?,phoneNum=?,address = ?,gender=?,job=? WHERE customerId = ?;";
        boolean rowUpdated = false;
        try (
                Connection conn = new DBConnect().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
        ) {
            ps.setString(1, customers.getFullName());
            ps.setString(2, customers.getDateOfBirth());
            ps.setString(3, customers.getPhoneNum());
            ps.setString(4, customers.getAddress());
            ps.setString(5, customers.getGender());
            ps.setString(6, customers.getJob());
            ps.setInt(7, customers.getCustomerId());
            rowUpdated = ps.executeUpdate() > 0;
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return rowUpdated;
    }

    public static boolean updateEmail(AccountUsers accountUsers) {
        String query = "UPDATE accountusers SET email = ? WHERE userId = ?;";
        boolean rowUpdated = false;
        try (
                Connection conn = new DBConnect().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
        ) {
            ps.setString(1, accountUsers.getEmail());
            ps.setInt(2, accountUsers.getUserId());
            rowUpdated = ps.executeUpdate() > 0;
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return rowUpdated;
    }

    public static List<Customers> searchCustomers(String keyword) {
        List<Customers> list = new ArrayList<>();
        String query = "SELECT * FROM customers WHERE fullName LIKE ?";

        try (
                Connection conn = new DBConnect().getConnection();
                PreparedStatement ps = conn.prepareStatement(query);
        ) {
            String pattern = "%" + keyword + "%";
            ps.setString(1, pattern);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customers c = new Customers();
                c.setCustomerId(rs.getInt("customerId"));
                c.setFullName(rs.getString("fullName"));
                c.setDateOfBirth(rs.getString("dateOfBirth"));
                c.setPhoneNum(rs.getString("phoneNum"));
                c.setAddress(rs.getString("address"));
                c.setGender(rs.getString("gender"));
                c.setJob(rs.getString("job"));
                c.setWorkSpace(rs.getString("workSpace"));
                c.setUpdateAt(rs.getString("updateAt"));
                c.setUserId(rs.getInt("userId"));
                list.add(c);
            }
        } catch (SQLException exception) {
            exception.printStackTrace();
        }
        return list;
    }

}
