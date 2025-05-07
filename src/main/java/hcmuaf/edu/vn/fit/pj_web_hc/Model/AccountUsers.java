package hcmuaf.edu.vn.fit.pj_web_hc.Model;

import jakarta.servlet.http.HttpSession;

import java.io.Serializable;
import java.sql.Date;

public class AccountUsers implements Serializable {
    private int userId ;
    private String userName ;
    private String passwordUser ;
    private int role ;
    private String email ;
    private Date createAt ;
    private String otpCode ;
    private String avatarUrl; // Thêm thuộc tính lưu ảnh đại dện


    public AccountUsers(int userId, String userName, String passwordUser, int role, String email, Date createAt, String otpCode,  String avatarUrl) {
        this.userId = userId;
        this.userName = userName;
        this.passwordUser = passwordUser;
        this.role = role;
        this.email = email;
        this.createAt = createAt;
        this.otpCode = otpCode;
        this.avatarUrl = "img/avatar-default.jpg";
    }
    // Constructor, getter và setter

    public AccountUsers(int id, String userName, String passwordUser, String email, int role, Date createAt, String avatarUrl) {
        this.userId = id ;
        this.userName = userName ;
        this.passwordUser = passwordUser ;
        this.email = email;
        this.role = role ;
        this.createAt = createAt ;
        this.avatarUrl = avatarUrl;
    }

    public AccountUsers() {
    }

    public AccountUsers(int id, String usernameR, String email, String passwordR) {
        this.userId = id ;
        this.userName = usernameR ;
        this.email= email;
        this.passwordUser = passwordR ;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPasswordUser() {
        return passwordUser;
    }

    public void setPasswordUser(String passwordUser) {
        this.passwordUser = passwordUser;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getOtpCode() {
        return otpCode;
    }

    public void setOtpCode(String otpCode) {
        this.otpCode = otpCode;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    @Override
    public String toString() {
        return "AccountUsers{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", passwordUser='" + passwordUser + '\'' +
                ", role=" + role + '\'' +
                ", email='" + email + '\'' +
                ", createAt=" + createAt + '\'' +
                ", otpCode='" + otpCode + '\'' +
                ", avatarUrl='" + avatarUrl + '\'' +
                '}';
    }


}
