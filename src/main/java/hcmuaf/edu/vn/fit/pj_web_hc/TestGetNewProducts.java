package hcmuaf.edu.vn.fit.pj_web_hc;

import hcmuaf.edu.vn.fit.pj_web_hc.DAO.ProductDao;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.Products;

import java.util.List;

public class TestGetNewProducts {
    public static void main(String[] args) {
        List<Products> products = ProductDao.getNewProducts();
        if (products == null || products.isEmpty()) {
            System.out.println("Không có sản phẩm mới để hiển thị.");
        } else {
            System.out.println("Danh sách sản phẩm mới:");
            for (Products p : products) {
                System.out.println("ID: " + p.getProductId() + ", Tên: " + p.getProductName() + ", Ảnh: " + p.getImageProduct());
            }
        }
    }
}