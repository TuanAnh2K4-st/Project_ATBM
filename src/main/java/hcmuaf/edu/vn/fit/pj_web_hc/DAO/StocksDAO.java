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
}
