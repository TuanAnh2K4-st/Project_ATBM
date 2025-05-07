package hcmuaf.edu.vn.fit.pj_web_hc.Model;

import java.util.Date;

public class Discount {
    private int discountId ;
    private String discountDetail ;
    private String discountCode ;
    private double discountValue ;
    private Date statusDate ;
    private Date endDate ;
    private Date createAt ;

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public String getDiscountDetail() {
        return discountDetail;
    }

    public void setDiscountDetail(String discountDetail) {
        this.discountDetail = discountDetail;
    }

    public String getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(String discountCode) {
        this.discountCode = discountCode;
    }

    public double getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(double discountValue) {
        this.discountValue = discountValue;
    }

    public Date getStatusDate() {
        return statusDate;
    }

    public void setStatusDate(Date statusDate) {
        this.statusDate = statusDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }


    @Override
    public String toString() {
        return "Discount{" +
                "discountId=" + discountId +
                ", discountDetail='" + discountDetail + '\'' +
                ", discountCode='" + discountCode + '\'' +
                ", discountValue=" + discountValue +
                ", statusDate='" + statusDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", createAt='" + createAt + '\'' +
                '}';
    }
}
