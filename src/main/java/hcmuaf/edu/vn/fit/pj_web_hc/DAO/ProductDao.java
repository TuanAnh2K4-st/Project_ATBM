package hcmuaf.edu.vn.fit.pj_web_hc.DAO;

import hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {

    public static List<Products> getNewProducts() {

        List<Products> list = new ArrayList<>();

        String sql = "select * from products ORDER BY createAt DESC LIMIT 8";
        try(Connection conn = new DBConnect().getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs= stmt.executeQuery()){
            int count = 0;
            while (rs.next()) { // Lặp qua tất cả các sản phẩm tìm thấy
                count++;
                list.add(new Products(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getInt("priceBuy"),
                        rs.getInt("priceSell"),
                        rs.getString("productDetail"),
                        rs.getString("imageProduct"),
                        rs.getString("unitOfSure"),
                        rs.getInt("hozandLevel"),
                        rs.getString("brandName"),
                        rs.getTimestamp("createAt"),
                        rs.getInt("categoryId")
                ));
            }
            System.out.println("Số sản phẩm truy vấn được: " + count);
        }catch( SQLException e){
            e.printStackTrace();

        }
        return list;
    }

    public List<Products> getProductsBySellId(int id) {
        List<Products> list = new ArrayList<>();
        String query = "select * from products where priceSell= ?";
        try (
            Connection conn = new DBConnect().getConnection();
            PreparedStatement stmt= conn.prepareStatement(query)){
            stmt.setInt(1, id);
            ResultSet rs= stmt.executeQuery();
            while (rs.next()) {
                list.add(new Products(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getInt("priceBuy"),
                        rs.getInt("priceSell"),
                        rs.getString("productDetail"),
                        rs.getString("imageProduct"),
                        rs.getString("unitOfSure"),
                        rs.getInt("hozandLevel"),
                        rs.getString("brandName"),
                        rs.getTimestamp("createAt"),
                        rs.getInt("categoryId")
                ));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }

    public List<Products> searchByName(String search) {
        List<Products> list = new ArrayList<>();
        String query = "select * from products where productName like ?";
        try (
                Connection conn = new DBConnect().getConnection();
                PreparedStatement stmt= conn.prepareStatement(query)){
                stmt.setString(1, "%" + search+"%");
                ResultSet rs= stmt.executeQuery();
            while (rs.next()) { // Lặp qua tất cả các sản phẩm tìm thấy
                list.add(new Products(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getInt("priceBuy"),
                        rs.getInt("priceSell"),
                        rs.getString("productDetail"),
                        rs.getString("imageProduct"),
                        rs.getString("unitOfSure"),
                        rs.getInt("hozandLevel"),
                        rs.getString("brandName"),
                        rs.getTimestamp("createAt"),
                        rs.getInt("categoryId")
                ));

            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }

    /* Code của Tuấn Anh */
    // Lấy tất cả các sản phẩm với phân trang
    // Lấy sản phẩm theo ngày đăng mới nhất
    public List<Products> getProductsSortedByDate(int page, int pageSize) {
        List<Products> products = new ArrayList<>();
        Statement s = DBConnect.get();
        if (s == null) return products;

        ResultSet rs = null;
        try {
            int offset = (page - 1) * pageSize;
            String query = "SELECT * FROM products ORDER BY createAt DESC LIMIT ? OFFSET ?";
            PreparedStatement ps = s.getConnection().prepareStatement(query);
            ps.setInt(1, pageSize);
            ps.setInt(2, offset);

            rs = ps.executeQuery();
            while (rs.next()) {
                products.add(new Products(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getInt("priceBuy"),
                        rs.getInt("priceSell"),
                        rs.getString("productDetail"),
                        rs.getString("imageProduct"),
                        rs.getString("unitOfSure"),
                        rs.getInt("hozandLevel"),
                        rs.getString("brandName"),
                        rs.getTimestamp("createAt"),
                        rs.getInt("categoryId")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Lấy sản phẩm theo bộ lọc
    public List<Products> getFilteredProducts(int page, int pageSize, String brand, String volume, String sortPrice) {
        List<Products> products = new ArrayList<>();
        Statement s = DBConnect.get();
        if (s == null) return products;

        ResultSet rs = null;
        try {
            int offset = (page - 1) * pageSize;
            StringBuilder query = new StringBuilder("SELECT * FROM products WHERE 1=1");

            if (brand != null && !brand.isEmpty()) {
                query.append(" AND brandName = ?");
            }
            if (volume != null && !volume.isEmpty()) {
                query.append(" AND unitOfSure = ?");
            }
            if ("asc".equals(sortPrice)) {
                query.append(" ORDER BY priceSell ASC");
            } else {
                query.append(" ORDER BY createAt DESC");
            }
            query.append(" LIMIT ? OFFSET ?");

            PreparedStatement ps = s.getConnection().prepareStatement(query.toString());
            int index = 1;

            if (brand != null && !brand.isEmpty()) {
                ps.setString(index++, brand);
            }
            if (volume != null && !volume.isEmpty()) {
                ps.setString(index++, volume);
            }
            ps.setInt(index++, pageSize);
            ps.setInt(index, offset);

            rs = ps.executeQuery();
            while (rs.next()) {
                products.add(new Products(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getInt("priceBuy"),
                        rs.getInt("priceSell"),
                        rs.getString("productDetail"),
                        rs.getString("imageProduct"),
                        rs.getString("unitOfSure"),
                        rs.getInt("hozandLevel"),
                        rs.getString("brandName"),
                        rs.getTimestamp("createAt"),
                        rs.getInt("categoryId")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Lấy tổng số sản phẩm để tính tổng số trang
    public int getTotalProductCount() {
        Statement s = DBConnect.get();
        if (s == null) return 0;
        ResultSet rs = null;
        try {
            rs = s.executeQuery("SELECT COUNT(*) FROM products");
            if (rs.next()) {
                return rs.getInt(1); // Trả về tổng số sản phẩm
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Lấy sản phẩm theo ID
    public Products getProductById(int productId) {
        Statement s = DBConnect.get();
        if (s == null) return null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM products WHERE productId = " + productId;
            rs = s.executeQuery(query);

            if (rs.next()) {
                return new Products(
                        rs.getInt("productId"),
                        rs.getString("productName"),
                        rs.getInt("priceBuy"),
                        rs.getInt("priceSell"),
                        rs.getString("productDetail"),
                        rs.getString("imageProduct"),
                        rs.getString("unitOfSure"),
                        rs.getInt("hozandLevel"),
                        rs.getString("brandName"),
                        rs.getTimestamp("createAt"),
                        rs.getInt("categoryId")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Products> getRelatedProducts(String brandName, int excludeProductId) {
        List<Products> relatedProducts = new ArrayList<>();
        Statement s = DBConnect.get();
        if (s == null) return relatedProducts;

        ResultSet rs = null;
        try {
            String query = "SELECT * FROM products WHERE brandName = ? AND productId <> ? ORDER BY createAt DESC LIMIT 5";
            PreparedStatement ps = s.getConnection().prepareStatement(query);
            ps.setString(1, brandName);
            ps.setInt(2, excludeProductId);

            rs = ps.executeQuery();
            while (rs.next()) {
                relatedProducts.add(new Products(
                        rs.getInt("productId"),  // Sửa id -> productId
                        rs.getString("productName"),
                        rs.getInt("priceBuy"),
                        rs.getInt("priceSell"),
                        rs.getString("productDetail"),
                        rs.getString("imageProduct"),
                        rs.getString("unitOfSure"),
                        rs.getInt("hozandLevel"),
                        rs.getString("brandName"),
                        rs.getTimestamp("createAt"),
                        rs.getInt("categoryId")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return relatedProducts;
    }
}
