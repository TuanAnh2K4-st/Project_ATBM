package hcmuaf.edu.vn.fit.pj_web_hc.Service;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.ProductDao;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;

import java.util.ArrayList;
import java.util.List;

public class ProductService {
    static ProductDao productDao = new ProductDao();

    // Lấy tất cả sản phẩm với phân trang
    public List<Products> getAllProductsSortedByDate(int page, int pageSize) {
        return productDao.getProductsSortedByDate(page, pageSize);
    }

    public List<Products> getFilteredProducts(int page, int pageSize, String brand, String volume, String sortPrice) {
        return productDao.getFilteredProducts(page, pageSize, brand, volume, sortPrice);
    }


    // Lấy tổng số sản phẩm để tính tổng số trang
    public int getTotalProductCount() {
        return productDao.getTotalProductCount();
    }

    // Lấy sản phẩm theo ID
    public Products getProductById(String id) {
        if (id == null || id.trim().isEmpty()) {
            System.out.println("Lỗi: ID sản phẩm không hợp lệ - " + id);
            return null;
        }
        try {
            int productId = Integer.parseInt(id);  // Chuyển đổi ID thành số nguyên
            Products product = productDao.getProductById(productId);  // Lấy sản phẩm từ DAO
            if (product == null) {
                System.out.println("Sản phẩm với ID " + productId + " không tồn tại.");
            }
            return product;
        } catch (NumberFormatException e) {
            System.out.println("Lỗi: ID sản phẩm không phải số hợp lệ - " + id);
            return null;
        }
    }
    public List<Products> getRelatedProducts(Products product) {
        if (product == null) return new ArrayList<>();
        return productDao.getRelatedProducts(product.getBrandName(), product.getProductId());
    }
}
