package hcmuaf.edu.vn.fit.pj_web_hc.Model;

public class CartItem {
    private Products product;
    private int quantity;

    public CartItem(Products product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Products getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        if (quantity < 0) quantity = 0;
        this.quantity = quantity;
    }

    public int getTotalPrice() {
        return quantity * product.getPriceSell();
    }
}
