package hcmuaf.edu.vn.fit.pj_web_hc.Model;

public class Customers {
    private int customerId ;
    private String fullName ;
    private String dateOfBirth ;
    private String phoneNum ;
    private String address;
    private String gender ;
    private String job ;
    private String workSpace ;
    private String updateAt ;
    private int userId ;

    //constructor đầy đủ
    public Customers(int customerId, String fullName, String dateOfBirth, String phoneNum, String address, String gender, String job, String updateAt, String workSpace, int userId) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.phoneNum = phoneNum;
        this.address = address;
        this.gender = gender;
        this.job = job;
        this.updateAt = updateAt;
        this.workSpace = workSpace;
        this.userId = userId;
    }

    public Customers(int customerId, String fullName, String dateOfBirth, String phoneNum, String address, String gender, String job) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.phoneNum = phoneNum;
        this.address = address;
        this.gender = gender;
        this.job = job;
    }
    public Customers(){

    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getWorkSpace() {
        return workSpace;
    }

    public void setWorkSpace(String workSpace) {
        this.workSpace = workSpace;
    }

    public String getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(String updateAt) {
        this.updateAt = updateAt;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Cutomers{" +
                "customerId=" + customerId +
                ", fullName='" + fullName + '\'' +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", address='" + address + '\'' +
                ", gender='" + gender + '\'' +
                ", job='" + job + '\'' +
                ", workSpace='" + workSpace + '\'' +
                ", updateAt='" + updateAt + '\'' +
                ", userId=" + userId +
                '}';
    }
}
