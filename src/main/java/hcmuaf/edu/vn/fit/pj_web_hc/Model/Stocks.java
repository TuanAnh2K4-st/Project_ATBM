package hcmuaf.edu.vn.fit.pj_web_hc.Model;

public class Stocks {
    private int stockId ;
    private String stockName ;
    private int quatityStock ;
    private int minQuatity ;
    private String updateStockAt ;
    private int productId ;

    public int getStockId() {
        return stockId;
    }

    public void setStockId(int stockId) {
        this.stockId = stockId;
    }

    public String getStockName() {
        return stockName;
    }

    public void setStockName(String stockName) {
        this.stockName = stockName;
    }

    public int getQuatityStock() {
        return quatityStock;
    }

    public void setQuatityStock(int quatityStock) {
        this.quatityStock = quatityStock;
    }

    public int getMinQuatity() {
        return minQuatity;
    }

    public void setMinQuatity(int minQuatity) {
        this.minQuatity = minQuatity;
    }

    public String getUpdateStockAt() {
        return updateStockAt;
    }

    public void setUpdateStockAt(String updateStockAt) {
        this.updateStockAt = updateStockAt;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "Stocks{" +
                "stockId=" + stockId +
                ", stockName='" + stockName + '\'' +
                ", quatityStock=" + quatityStock +
                ", minQuatity=" + minQuatity +
                ", updateStockAt='" + updateStockAt + '\'' +
                ", productId=" + productId +
                '}';
    }
}
