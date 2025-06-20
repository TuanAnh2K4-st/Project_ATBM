package hcmuaf.edu.vn.fit.pj_web_hc.Model;

public class CustomersViewModel {
    private int customerId ;
    private String fullName ;
    private String email ;
    private String dateOfBirth ;
    private String phoneNum ;
    private String address;
    private String gender ;
    private String job ;
   public CustomersViewModel(int customerId,String fullName,String email,String dateOfBirth,String phoneNum,String address,String gender,String job) {
       this.customerId = customerId;
       this.fullName = fullName;
       this.email = email;
       this.dateOfBirth = dateOfBirth;
       this.phoneNum = phoneNum;
       this.address = address;
       this.gender = gender;
       this.job = job;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
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
}
