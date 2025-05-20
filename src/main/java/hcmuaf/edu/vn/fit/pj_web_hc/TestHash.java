package hcmuaf.edu.vn.fit.pj_web_hc;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class TestHash {

    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");

            byte[] hashedBytes = md.digest(password.getBytes());

            // Chuyển đổi byte array thành chuỗi hexa
            StringBuffer sb = new StringBuffer();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));//Mỗi byte (b) được chuyển thành một cặp số hex (%02x đảm bảo luôn có 2 chữ số).
            }
            return sb.toString();  //Kết quả cuối cùng là một chuỗi 32 ký tự biểu diễn giá trị băm MD5.
        }catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        System.out.println("Hash của admin123 là: " + hashPassword("taz"));
    }
}