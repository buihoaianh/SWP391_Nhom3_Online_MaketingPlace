package utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

public class Helpers {

    private static final String IMAGE_UPLOAD_DIR = "uploads"; // thư mục con trong webapp

    public static String saveImage(Part imagePart, HttpServletRequest request, String uploadFolderDir) throws IOException {
        String fileName = extractFileName(imagePart);

        // Lấy đường dẫn thật của thư mục uploads bên trong webapp
        String appPath = request.getServletContext().getRealPath("");
        String uploadPath = appPath + File.separator + "web" + File.separator + IMAGE_UPLOAD_DIR + File.separator + uploadFolderDir;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        // Ghi file vào đúng thư mục webapp/uploads
        String filePath = uploadPath + File.separator + fileName;
        imagePart.write(filePath);

        //luu vao thu muc goc project
        String rootProjectPath = Paths.get(request.getServletContext().getRealPath(""))
                .getParent() // -> build
                .getParent() // -> MarketingPlace
                .toString();     // -> D:\Ky5\SWR\...\MarketingPlace
        String projectImgPath = rootProjectPath + File.separator + "web" + File.separator + IMAGE_UPLOAD_DIR + File.separator + uploadFolderDir;
        File projectImgDir = new File(projectImgPath);
        if (!projectImgDir.exists()) {
            projectImgDir.mkdirs();
        }
        imagePart.write(projectImgPath + File.separator + fileName);

        // Trả về đường dẫn tương đối để chèn vào src của <img>
//        return request.getContextPath() + "/" + uploadFolderDir + "/" + fileName;
        return "/" + IMAGE_UPLOAD_DIR + "/" + uploadFolderDir + "/" + fileName;
    }

    public static String extractFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 2, content.length() - 1);
            }
        }
        return "default.png";
    }
}
