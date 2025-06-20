package hcmuaf.edu.vn.fit.pj_web_hc.DAO;

import hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Customers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
}
