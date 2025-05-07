package hcmuaf.edu.vn.fit.pj_web_hc.Model;


import java.sql.Timestamp;

public class Products {
    private int productId;
    private String productName ;
    private int priceBuy ;
    private int priceSell;
    private String  productDetail ;
    private String imageProduct ;
    private String unitOfSure ;
    private int  hozandLevel ;
    private String brandName ;
    private Timestamp createAt ;
    private int categoryId ;

    // Constructor đầy đủ
    public Products(int productId, String productName, int priceBuy, int priceSell,
                   String productDetail, String imageProduct, String unitOfSure,
                   int hozandLevel, String brandName, Timestamp createAt, int categoryId) {
        this.productId = productId;
        this.productName = productName;
        this.priceBuy = priceBuy;
        this.priceSell = priceSell;
        this.productDetail = productDetail;
        this.imageProduct = imageProduct;
        this.unitOfSure = unitOfSure;
        this.hozandLevel = hozandLevel;
        this.brandName = brandName;
        this.createAt = createAt;
        this.categoryId = categoryId;
    }

    public Products(int id,  String imageURL,String name, int price) {
        this.productId = id;
        this.imageProduct = imageURL;
        this.productName = name;
        this.priceSell = price;
    }


    //Contrustor cho sản phẩm mới


    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getPriceBuy() {
        return priceBuy;
    }

    public void setPriceBuy(int priceBuy) {
        this.priceBuy = priceBuy;
    }

    public int getPriceSell() {
        return priceSell;
    }

    public void setPriceSell(int priceSell) {
        this.priceSell = priceSell;
    }

    public String getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(String productDetail) {
        this.productDetail = productDetail;
    }

    public String getImageProduct() {
        return imageProduct;
    }

    public void setImageProduct(String imageProduct) {
        this.imageProduct = imageProduct;
    }

    public String getUnitOfSure() {
        return unitOfSure;
    }

    public void setUnitOfSure(String unitOfSure) {
        this.unitOfSure = unitOfSure;
    }

    public int getHozandLevel() {
        return hozandLevel;
    }

    public void setHozandLevel(int hozandLevel) {
        this.hozandLevel = hozandLevel;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "Products{" +
                "productId=" + productId +
                ", productName='" + productName + '\'' +
                ", priceBuy=" + priceBuy +
                ", priceSell=" + priceSell +
                ", productDetail='" + productDetail + '\'' +
                ", imageProduct='" + imageProduct + '\'' +
                ", unitOfSure='" + unitOfSure + '\'' +
                ", hozandLevel='" + hozandLevel + '\'' +
                ", categoryId='" + categoryId + '\'' +
                ", brandName='" + brandName + '\'' +
                ", createAt=" + createAt +
                '}';
    }



}