package utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

public class Helpers {
    private static final String IMAGE_UPLOAD_DIR = "uploads"; // không có dấu /

    public static String saveImage(Part imagePart, HttpServletRequest request) throws IOException {
        String fileName = extractFileName(imagePart);

        // Lưu trong thư mục /webapps/uploads của Tomcat
        String tomcatPath = System.getProperty("catalina.base"); // đường dẫn gốc của Tomcat
        String uploadPath = tomcatPath + File.separator + "webapps" + File.separator + IMAGE_UPLOAD_DIR;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String filePath = uploadPath + File.separator + fileName;
        imagePart.write(filePath);

        return "/" + IMAGE_UPLOAD_DIR + "/" + fileName; // để render trong src
    }



    public static String extractFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "default.png";
    }
}

