package hcmuaf.edu.vn.fit.pj_web_hc.Util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {

    /**
     * Tạo chuỗi hash MD5 từ input string.
     * @param input Chuỗi cần hash
     * @return Chuỗi hash dưới dạng hex, hoặc null nếu lỗi
     */
    public static String hash(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hashBytes = md.digest(input.getBytes());

            // Chuyển bytes sang dạng hex
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                // Mask 0xFF để tránh giá trị âm
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }

            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
