package hcmuaf.edu.vn.fit.pj_web_hc.Model;

import java.sql.Date;

public class ProductViews {
    private int productViewId ;
    private int viewProduct ;
    private Date dayView ;
    private int productId ;

    public ProductViews(int productViewId, int viewProduct, Date dayView, int productId) {
        this.productViewId = productViewId;
        this.viewProduct = viewProduct;
        this.dayView = dayView;
        this.productId = productId;
    }
    public int getProductViewId() {
        return productViewId;
    }

    public void setProductViewId(int productViewId) {
        this.productViewId = productViewId;
    }

    public int getViewProduct() {
        return viewProduct;
    }

    public void setViewProduct(int viewProduct) {
        this.viewProduct = viewProduct;
    }

    public Date getDayView() {
        return dayView;
    }

    public void setDayView(Date dayView) {
        this.dayView = dayView;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "ProductViews{" +
                "productViewId=" + productViewId +
                ", viewProduct=" + viewProduct +
                ", dayView='" + dayView + '\'' +
                ", productId=" + productId +
                '}';
    }
}
