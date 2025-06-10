package hcmuaf.edu.vn.fit.pj_web_hc.Model;

import java.sql.Timestamp;

public class ProductViewModel {
    private String productName;
    private int productId;
    private String imageProduct;
    private String brandName;
    private int quatityStock;
    private int priceSell;

    public ProductViewModel() {
    }

    public ProductViewModel(String productName, int productId, String imageProduct, String brandName, int quatityStock, int priceSell) {
        this.productName = productName;
        this.productId = productId;
        this.imageProduct = imageProduct;
        this.brandName = brandName;
        this.quatityStock = quatityStock;
        this.priceSell = priceSell;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImageProduct() {
        return imageProduct;
    }

    public void setImageProduct(String imageProduct) {
        this.imageProduct = imageProduct;
    }

    public int getPriceSell() {
        return priceSell;
    }

    public void setPriceSell(int priceSell) {
        this.priceSell = priceSell;
    }

    public int getQuatityStock() {
        return quatityStock;
    }

    public void setQuatityStock(int quatityStock) {
        this.quatityStock = quatityStock;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "ProductViewModel{" +
                "productName='" + productName + '\'' +
                ", productId=" + productId +
                ", imageProduct='" + imageProduct + '\'' +
                ", brandName='" + brandName + '\'' +
                ", quatityStock=" + quatityStock +
                ", priceSell=" + priceSell +
                '}';
    }
}
