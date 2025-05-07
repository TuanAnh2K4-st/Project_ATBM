package hcmuaf.edu.vn.fit.pj_web_hc.Controller;
import hcmuaf.edu.vn.fit.pj_web_hc.Annotation.Action;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.AccountUpgrades;
import hcmuaf.edu.vn.fit.pj_web_hc.Model.AccountUsers;
import hcmuaf.edu.vn.fit.pj_web_hc.Service.AuthorService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import java.net.URLEncoder;//cho cookie
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

import jakarta.servlet.annotation.MultipartConfig;

@WebServlet(name = "UserInfo", value = "/UserInfo")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,  // 1MB
        maxFileSize = 10 * 1024 * 1024,    // 2MB
        maxRequestSize = 20 * 1024 * 1024  // 4MB
)

public class UserInfo extends HttpServlet {
    private Map<String, Method> actionMap;

    @Override
    public void init() throws ServletException {
        actionMap = new HashMap<>();
        // Lấy tất cả các phương thức trong lớp này
        for (Method method : this.getClass().getDeclaredMethods()) {
            // Kiểm tra xem phương thức có annotation Action không
            if (method.isAnnotationPresent(Action.class)) {
                Action action = method.getAnnotation(Action.class);
                actionMap.put(action.value(), method); // Lưu trữ action và phương thức tương ứng
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        AccountUsers currentUser  = (AccountUsers) session.getAttribute("user");

        if (currentUser != null) {
            request.setAttribute("user", currentUser );
            RequestDispatcher dispatcher = request.getRequestDispatcher("Trang_thong_tin_user.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("Trangdangnhap_dangky.jsp");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // Tìm phương thức tương ứng với action
        Method method = actionMap.get(action);
        if (method != null) {
            try {
                method.invoke(this, request, response); // Gọi phương thức
            } catch (Exception e) {
                throw new ServletException("Error executing action", e);
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }
    @Action("uploadAvatar")
    public void uploadAvatar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Đang gọi uploadAvatar...");

        HttpSession session = request.getSession(false);
        AccountUsers currentUser  = (AccountUsers) session.getAttribute("user");

        if (currentUser  != null) {
            Part filePart = request.getPart("avatar");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // Kiểm tra định dạng file hợp lệ là JPG, PNG, JPEG
            String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
            if (!fileExtension.matches("jpg|jpeg|png")) {
                response.sendRedirect("Trang_thong_tin_user.jsp?error=InvalidFileType");
                return;
            }
            //Lưu file vào thư mục/
            //String uploadPath = "C:/Users/CACA/Pictures/WEB PJ/avatar/" + fileName;
           String uploadDir = getServletContext().getRealPath("img");
            File uploadFolder = new File(uploadDir);
            if (!uploadFolder.exists()) {
                uploadFolder.mkdirs();
            }
            String uploadPath = uploadDir + File.separator + fileName;

            try (InputStream fileContent = filePart.getInputStream()) {
                Files.copy(fileContent, Paths.get(uploadPath), StandardCopyOption.REPLACE_EXISTING);
                System.out.println("Ảnh đã lưu: " + uploadPath);
            }

            // Cập nhật avatarUrl vào database
            currentUser .setAvatarUrl("img/" + fileName);
            AuthorService.updateUserAvatar(currentUser);

            // Cập nhật session
            session.setAttribute("user", currentUser );
            response.sendRedirect("Trang_thong_tin_user.jsp?success=AvatarUpdated");
        } else {
            response.sendRedirect("Trangdangnhap_dangky.jsp");
        }
    }
    @Action("logout")
    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect("Trangdangnhap_dangky.jsp");
        System.out.println("Đã đăng xuất");
    }

    @Action("changePassword")
    public void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        AccountUsers currentUser  = (AccountUsers) session.getAttribute("user");
        if (currentUser == null) {
            response.sendRedirect("Trangdangnhap_dangky.jsp");
            return;
        }
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra mật khẩu mới và mật khẩu xác nhận trùng nhau không:
        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("Trang_thong_tin_user.jsp?error=PasswordMismatch");
            return;
        }
        // Kiểm tra mật khẩu cũ
        if (!AuthorService.checkPassword(oldPassword, currentUser.getPasswordUser())){
            response.sendRedirect("Trang_thong_tin_user.jsp?error=IncorrectOldPassword");
            return;
        }
        //mã hóa mật khẩu trước khi lưu vào csdl
        String newEncryptPassword = AuthorService.hashPassword(newPassword);
        currentUser.setPasswordUser(newEncryptPassword);

        //cập nhật vào database
        boolean updated= AuthorService.updateUserPassword(currentUser);
        if (updated) {
            response.sendRedirect("Trang_thong_tin_user.jsp?success=PasswordChanged");
        } else{
            response.sendRedirect("Trang_thong_tin_user.jsp?error=UpdateFailed");
        }
    }
// Cập nhật thông tin
@Action("updateProfile")
    public void updateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("Đang tiến hành cập nhật thông tin cá nhân...");

    HttpSession session = request.getSession();
    Integer userIdInt = (Integer) session.getAttribute("userId");
    String userId = userIdInt != null ? userIdInt.toString() : null;

    //AccountUsers currentUser  = (AccountUsers) session.getAttribute("user");
    // Kiểm tra nếu userId không tồn tại
    if (userId == null) {
        response.sendRedirect("Trangdangnhap_dangky.jsp");
        return;
    }
    // Lấy Map chứa thông tin cá nhân bổ sung từ session, nếu chưa có thì tạo mới
    // HttpSession session = request.getSession();
    /*Map<String, String> profileInfo = (Map<String, String>) session.getAttribute("profileInfo");
    if (profileInfo == null) {
        profileInfo = new HashMap<>();
    }*/
    //Lưu dữ liệu vào cookie để đăng xuất không bị mất

    Map<String, String> profileInfo = new HashMap<>();

    // Lấy dữ liệu từ form
    // Lưu thông tin vào Map
        profileInfo.put("fullName_" + userId, request.getParameter("fullName"));
        profileInfo.put("email_" +userId, request.getParameter("email"));
        profileInfo.put("dob_" + userId, request.getParameter("dob"));
        profileInfo.put("address_" +userId, request.getParameter("address"));
        profileInfo.put("city_" +userId, request.getParameter("city"));
        profileInfo.put("occupation_" +userId, request.getParameter("occupation"));
        profileInfo.put("company_" +userId, request.getParameter("company"));
        profileInfo.put("phone_" +userId, request.getParameter("phone"));

        //Lưu session với key profileInfo
       // session.setAttribute("profileInfo", profileInfo);

    // Lưu dữ liệu vào Cookie (ENCODE để tránh lỗi khoảng trắng)
    for (Map.Entry<String, String> entry : profileInfo.entrySet()) {
        if (entry.getValue() != null) {
            String encodedValue = URLEncoder.encode(entry.getValue(), StandardCharsets.UTF_8); // Mã hóa
            Cookie cookie = new Cookie(entry.getKey(), encodedValue);
            cookie.setMaxAge(60 * 60 * 24 * 30); // Lưu trong 30 ngày
            cookie.setPath("/"); // Cho phép Cookie sử dụng trên toàn bộ ứng dụng
            response.addCookie(cookie);
        }
    }
        response.sendRedirect("Trang_thong_tin_user.jsp?success=ProfileUpdated");
        System.out.println("Cập nhật thông tin thành công.");
    }

    @Action("upgrade")
    public void upgrade(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");
            Integer role= (Integer) session.getAttribute("role");
            //AccountUsers currentUser  = (AccountUsers) session.getAttribute("user");
            // Kiểm tra nếu userId không tồn tại
            if (userId == null) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Bạn chưa đăng nhập!");
                return;
            }
            System.out.println("Role của user: "+ role);

            //Lấy thông tin từ request
            String requestReason = request.getParameter("requestReason");
            System.out.println("Request action: " + request.getParameter("action"));
            Part imagePart = request.getPart("imageUp");
            System.out.println("Part received: " + imagePart);

            if (imagePart == null || imagePart.getSize() == 0) {
                response.sendRedirect("Trang_thong_tin_user.jsp?error=NoFileUploaded");
                return;
            }

            String uploadDir = getServletContext().getRealPath("documents");
            File uploadFolder = new File(uploadDir);
            if (!uploadFolder.exists()) {
                uploadFolder.mkdirs();
            }

            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = uploadDir + File.separator + fileName;
            try (InputStream fileContent = imagePart.getInputStream()) {
                Files.copy(fileContent, Paths.get(uploadPath), StandardCopyOption.REPLACE_EXISTING);
            }

            //// Tạo đối tượng AccountUpgrades và cập nhật các thuộc tính
            AccountUpgrades upgradeRequest = new AccountUpgrades();

            upgradeRequest.setUpgradeStatus("pending");
            upgradeRequest.setRequestReason(requestReason);
            upgradeRequest.setRequestedAt(new Timestamp(System.currentTimeMillis()));

            upgradeRequest.setImageUp("documents/" + fileName);//Lưu đường dẫn tương đối
            upgradeRequest.setUserId(userId);
            System.out.println("Tài liệu lưu trữ ở: " + fileName);
            session.setAttribute("upgradeRequest", upgradeRequest);
            boolean updated = upgradeRequest.upgrade(upgradeRequest);
            if (updated) {
                response.sendRedirect("Trang_thong_tin_user.jsp?success=UpgradeRequested");
                System.out.println("Gửi yêu cầu nâng cấp thành công");
            } else {
                response.sendRedirect("Trang_thong_tin_user.jsp?error=UpgradeFailed");
                System.out.println("Gửi yêu cầu nâng cấp thất bại");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }

    }
}
