package hcmuaf.edu.vn.fit.pj_web_hc.DAO;

import hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Stocks;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class StocksDAO {
    public int getQuanityProductOnStocks(int productId) {
        Statement s = DBConnect.get();
        if (s == null) return 0; // Không phải `null` vì method return `int`

        ResultSet rs = null;

        try {
            String query = "SELECT * FROM stocks WHERE productId = " + productId;
            rs = s.executeQuery(query);

            if (rs.next()) {
                // Giả sử cột "quatityStock" trong bảng là số lượng tồn kho
                return rs.getInt("quatityStock");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public boolean updateStockQuantity(int productId, int quantityToReduce) {
        Statement s = DBConnect.get();
        if (s == null) return false;

        try {
            // Cập nhật số lượng nếu còn đủ hàng
            String queryCheck = "SELECT quatityStock FROM stocks WHERE productId = " + productId;
            ResultSet rs = s.executeQuery(queryCheck);

            if (rs.next()) {
                int currentQuantity = rs.getInt("quatityStock");
                if (currentQuantity < quantityToReduce) {
                    System.out.println("Không đủ hàng trong kho.");
                    return false;
                }

                String updateQuery = "UPDATE stocks SET quatityStock = quatityStock - " + quantityToReduce +
                        ", updateStockAt = CURRENT_TIMESTAMP WHERE productId = " + productId;
                int rowsAffected = s.executeUpdate(updateQuery);
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
