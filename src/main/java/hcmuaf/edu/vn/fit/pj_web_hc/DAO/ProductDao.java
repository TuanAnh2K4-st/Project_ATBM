package hcmuaf.edu.vn.fit.pj_web_hc.DAO;

import hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Stocks;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static hcmuaf.edu.vn.fit.pj_web_hc.DB.DBConnect.conn;

public class ProductDao {

    public static List<Products> getNewProducts() {

        List<Products> list = new ArrayList<>();

        String sql = "select * from products ORDER BY createAt DESC LIMIT 8";
        try (Connection conn = new DBConnect().getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            int count = 0;
            while (rs.next()) { // Lặp qua tất cả các sản phẩm tìm thấy
                count++;
                list.add(new Products(rs.getInt("productId"), rs.getString("productName"), rs.getInt("priceBuy"), rs.getInt("priceSell"), rs.getString("productDetail"), rs.getString("imageProduct"), rs.getString("unitOfSure"), rs.getInt("hozandLevel"), rs.getString("brandName"), rs.getTimestamp("createAt"), rs.getInt("categoryId")));
            }
            System.out.println("Số sản phẩm truy vấn được: " + count);
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return list;
    }

    public List<Products> getProductsBySellId(int id) {
        List<Products> list = new ArrayList<>();
        String query = "select * from products where priceSell= ?";
        try (Connection conn = new DBConnect().getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                list.add(new Products(rs.getInt("productId"), rs.getString("productName"), rs.getInt("priceBuy"), rs.getInt("priceSell"), rs.getString("productDetail"), rs.getString("imageProduct"), rs.getString("unitOfSure"), rs.getInt("hozandLevel"), rs.getString("brandName"), rs.getTimestamp("createAt"), rs.getInt("categoryId")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Products> searchByName(String search) {
        List<Products> list = new ArrayList<>();
        String query = "select * from products where productName like ?";
        try (Connection conn = new DBConnect().getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, "%" + search + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) { // Lặp qua tất cả các sản phẩm tìm thấy
                list.add(new Products(rs.getInt("productId"), rs.getString("productName"), rs.getInt("priceBuy"), rs.getInt("priceSell"), rs.getString("productDetail"), rs.getString("imageProduct"), rs.getString("unitOfSure"), rs.getInt("hozandLevel"), rs.getString("brandName"), rs.getTimestamp("createAt"), rs.getInt("categoryId")));

            }
        } catch (SQLException e) {
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
                products.add(new Products(rs.getInt("productId"), rs.getString("productName"), rs.getInt("priceBuy"), rs.getInt("priceSell"), rs.getString("productDetail"), rs.getString("imageProduct"), rs.getString("unitOfSure"), rs.getInt("hozandLevel"), rs.getString("brandName"), rs.getTimestamp("createAt"), rs.getInt("categoryId")));
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
                products.add(new Products(rs.getInt("productId"), rs.getString("productName"), rs.getInt("priceBuy"), rs.getInt("priceSell"), rs.getString("productDetail"), rs.getString("imageProduct"), rs.getString("unitOfSure"), rs.getInt("hozandLevel"), rs.getString("brandName"), rs.getTimestamp("createAt"), rs.getInt("categoryId")));
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
                return new Products(rs.getInt("productId"), rs.getString("productName"), rs.getInt("priceBuy"), rs.getInt("priceSell"), rs.getString("productDetail"), rs.getString("imageProduct"), rs.getString("unitOfSure"), rs.getInt("hozandLevel"), rs.getString("brandName"), rs.getTimestamp("createAt"), rs.getInt("categoryId"));
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
                relatedProducts.add(new Products(rs.getInt("productId"),  // Sửa id -> productId
                        rs.getString("productName"), rs.getInt("priceBuy"), rs.getInt("priceSell"), rs.getString("productDetail"), rs.getString("imageProduct"), rs.getString("unitOfSure"), rs.getInt("hozandLevel"), rs.getString("brandName"), rs.getTimestamp("createAt"), rs.getInt("categoryId")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return relatedProducts;
    }

    public List<Products> getAllProducts() {
        List<Products> products = new ArrayList<>();
        String query = "SELECT * FROM products ";
        try (Connection conn = new DBConnect().getConnection(); PreparedStatement stmt = conn.prepareStatement(query);) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                products.add(new Products(rs.getInt("productId"), rs.getString("productName"), rs.getInt("priceBuy"), rs.getInt("priceSell"), rs.getString("productDetail"), rs.getString("imageProduct"), rs.getString("unitOfSure"), rs.getInt("hozandLevel"), rs.getString("brandName"), rs.getTimestamp("createAt"), rs.getInt("categoryId")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        ;
        return products;
    }

    public int getQuantityStock(int productId) {
        String query = "SELECT * FROM stocks WHERE productId =" + productId;
        Statement s = DBConnect.get();
        try (Connection conn = new DBConnect().getConnection(); PreparedStatement stmt = conn.prepareStatement(query);) {
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("quatityStock");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        ;
        return 0;
    }

    public void add(Products products) {
        String query = "INSERT INTO products (productId, productName, priceBuy, priceSell, productDetail, imageProduct, unitOfSure, hozandLevel, brandName, createAt, categoryId) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement statement = conn.prepareStatement(query)) {

            statement.setInt(1, products.getProductId());

            if (products.getProductName() != null) {
                statement.setString(2, products.getProductName());
            } else {
                statement.setNull(2, Types.VARCHAR);
            }

            statement.setInt(3, products.getPriceBuy());
            statement.setInt(4, products.getPriceSell());

            if (products.getProductDetail() != null) {
                statement.setString(5, products.getProductDetail());
            } else {
                statement.setNull(5, Types.VARCHAR);
            }

            if (products.getImageProduct() != null) {
                statement.setString(6, products.getImageProduct());
            } else {
                statement.setNull(6, Types.VARCHAR);
            }

            if (products.getUnitOfSure() != null) {
                statement.setString(7, products.getUnitOfSure());
            } else {
                statement.setNull(7, Types.VARCHAR);
            }

            statement.setInt(8, products.getHozandLevel());

            if (products.getBrandName() != null) {
                statement.setString(9, products.getBrandName());
            } else {
                statement.setNull(9, Types.VARCHAR);
            }

            if (products.getCreateAt() != null) {
                statement.setTimestamp(10, products.getCreateAt());
            } else {
                statement.setNull(10, Types.TIMESTAMP);
            }

            statement.setInt(11, products.getCategoryId());

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("Không có bản ghi nào được chèn.");
            } else {
                System.out.println("Đã chèn thành công " + rowsAffected + " bản ghi.");
            }
        } catch (SQLException e) {
            System.err.println("Lỗi SQL: " + e.getMessage());
            e.printStackTrace();
            throw new RuntimeException("Đã xảy ra lỗi khi chèn dữ liệu vào cơ sở dữ liệu", e);
        }
    }

    public void deleteById(int idProducts) {
        String query = "DELETE FROM products WHERE productId = ?";
        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setInt(1, idProducts);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}


