package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@WebServlet("/UpdateBlogServlet")
public class UpdateBlogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置请求的字符编码为 UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain;charset=UTF-8");

        try {
            // 获取请求参数
            String htmlContent = request.getParameter("htmlContent");
            System.out.println("获取到的 htmlContent: " + htmlContent); // 调试输出

            if (htmlContent == null || htmlContent.isEmpty()) {
                response.getWriter().write("内容无效");
                return;
            }

            // 处理 htmlContent，例如保存到数据库或文件
            // 示例：保存到文件
            String uploadPath = getServletContext().getRealPath("") + File.separator + "html";
            if (uploadPath == null) {
                response.getWriter().write("无法获取上传路径");
                return;
            }

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            String fileName = "blog_content.html"; // 你可以根据需要生成文件名
            File file = new File(uploadPath + File.separator + fileName);
            Files.write(file.toPath(), htmlContent.getBytes("UTF-8"));

            System.out.println("文件已保存到绝对路径: " + file.getAbsolutePath());
            response.getWriter().write("保存成功: " + fileName);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("保存失败: " + e.getMessage());
        }
    }
}
