package hcmuaf.edu.vn.fit.pj_web_hc.Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet(name = "DownloadFileServlet", value = "/download")
public class DownloadFileServlet extends HttpServlet {
    private static final String FILE_DIRECTORY = "/img"; // thư mục chứa file trong webapp

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy tên file từ query string
        String fileName = request.getParameter("filename");

        if (fileName == null || fileName.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu tên file để tải.");
            return;
        }

        // Đường dẫn thực đến file trong hệ thống
        String fullPath = getServletContext().getRealPath(FILE_DIRECTORY + File.separator + fileName);
        File file = new File(fullPath);

        // Kiểm tra file có tồn tại không
        if (!file.exists() || file.isDirectory()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File không tồn tại.");
            return;
        }

        // Thiết lập header cho phép tải
        response.setContentType("application/octet-stream");
        response.setContentLengthLong(file.length());
        response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");

        // Đọc và ghi nội dung file
        try (BufferedInputStream input = new BufferedInputStream(new FileInputStream(file));
             BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream())) {

            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
        }
    }
}
