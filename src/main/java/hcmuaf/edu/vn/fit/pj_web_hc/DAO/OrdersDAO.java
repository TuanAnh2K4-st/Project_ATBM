package hcmuaf.edu.vn.fit.pj_web_hc.DAO;

import hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.AccountUsers;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.KeyAccount;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.OrderDetails;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Orders;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrdersDAO {

    public static boolean saveOrderWithDetails(Orders order, List<OrderDetails> detailsList) {
        String insertOrderSQL = "INSERT INTO orders (orderDate, statusOrder, totalAmount, paymentMethod, deliveryAddress, signature, hashData, userId, keyId) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        String insertDetailSQL = "INSERT INTO orderdetails (productId, quantity, unitPrice, statusDetail, orderId) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement orderStmt = conn.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS)) {

            conn.setAutoCommit(false); // Bắt đầu transaction

            // Thiết lập thông tin đơn hàng
            orderStmt.setString(1, order.getOrderDate());
            orderStmt.setString(2, order.getStatusOrder().toString());
            orderStmt.setDouble(3, order.getTotalAmount());
            orderStmt.setString(4, order.getPaymentMethod());
            orderStmt.setString(5, order.getDeliveryAddress());
            orderStmt.setString(6, order.getSignature());
            orderStmt.setString(7, order.getHashData());
            orderStmt.setInt(8, order.getUserId());
            orderStmt.setInt(9, order.getKeyId());

            int affectedRows = orderStmt.executeUpdate();
            if (affectedRows == 0) throw new SQLException("Không thể thêm đơn hàng.");

            int orderId;
            try (ResultSet rs = orderStmt.getGeneratedKeys()) {
                if (rs.next()) {
                    orderId = rs.getInt(1);
                } else {
                    throw new SQLException("Không lấy được ID của đơn hàng.");
                }
            }

            try (PreparedStatement detailStmt = conn.prepareStatement(insertDetailSQL)) {
                for (OrderDetails detail : detailsList) {
                    detailStmt.setInt(1, detail.getProductId());
                    detailStmt.setInt(2, detail.getQuantity());
                    detailStmt.setDouble(3, detail.getUnitPrice());
                    detailStmt.setString(4, detail.getStatusDetail().toString());
                    detailStmt.setInt(5, orderId);
                    detailStmt.addBatch();
                }
                detailStmt.executeBatch();
            }

            conn.commit(); // Commit nếu không có lỗi
            System.out.println("Đơn hàng và chi tiết đã được lưu thành công.");
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static List<Orders> getAllOrdersWithPublicKey() {
        List<Orders> list = new ArrayList<>();
        String sql = "SELECT o.*, ku.userName, k.publicKey " +
                "FROM Orders o " +
                "JOIN KeyAccount k ON o.keyId = k.keyId " +
                "JOIN AccountUsers ku ON o.userId = ku.userId";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Orders order = new Orders();
                order.setOrderId(rs.getInt("orderId"));
                order.setOrderDate(rs.getString("orderDate"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setDeliveryAddress(rs.getString("deliveryAddress"));
                order.setSignature(rs.getString("signature"));
                order.setHashData(rs.getString("hashData"));
                order.setUserId(rs.getInt("userId"));
                order.setKeyId(rs.getInt("keyId"));

                AccountUsers user = new AccountUsers();
                user.setUserName(rs.getString("userName"));

                KeyAccount key = new KeyAccount();
                key.setPublicKey(rs.getString("publicKey"));

                order.setUser(user);
                order.setKey(key);

                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
