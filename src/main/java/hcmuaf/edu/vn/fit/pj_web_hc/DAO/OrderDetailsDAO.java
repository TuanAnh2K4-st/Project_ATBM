package hcmuaf.edu.vn.fit.pj_web_hc.DAO;

import hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailsDAO {
    public static List<OrderDetails> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetails> detailsList = new ArrayList<>();

        String sql = "SELECT * FROM orderdetails WHERE orderId = ?";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, orderId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    OrderDetails detail = new OrderDetails();
                    detail.setProductId(rs.getInt("productId"));
                    detail.setQuantity(rs.getInt("quantity"));
                    detail.setUnitPrice(rs.getInt("unitPrice"));
                    detail.setStatusDetail(OrderDetailsStatus.fromString(rs.getString("statusDetail")));
                    detail.setOrderId(orderId);
                    detail.setProductName(rs.getString("productName"));

                    detailsList.add(detail);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return detailsList;
    }

}
