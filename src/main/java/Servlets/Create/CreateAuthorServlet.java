package Servlets.Create;

import Service.AuthorService;
import models.Author;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;


public class CreateAuthorServlet extends HttpServlet {

    static final int fileMaxSize = 1024 * 1024;
    static final int memMaxSize = 1024 * 1024;


    private File file;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println(request.getContextPath());

        String filePath = request.getServletContext().getInitParameter("auth-upload");

        response.setContentType("text/html");

        Author auth = new Author();

        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        diskFileItemFactory.setRepository(new File(filePath));
        diskFileItemFactory.setSizeThreshold(memMaxSize);

        ServletFileUpload upload = new ServletFileUpload(diskFileItemFactory);
        upload.setHeaderEncoding("UTF-8");
        upload.setSizeMax(fileMaxSize);

        try {
            List fileItems = upload.parseRequest(request);

            Iterator iterator = fileItems.iterator();


            while (iterator.hasNext()) {
                FileItem fileItem = (FileItem) iterator.next();

                if (!fileItem.isFormField()) {
                    String fileName = fileItem.getName();

                    if (fileName.length()>0){

                        String ffilenmae = new SimpleDateFormat("yyyyMMddHHmmssSS").format(new Date()) + fileName.substring(fileName.lastIndexOf("."));
                        file = new File(filePath + ffilenmae);
                        auth.setIcon_author_path(ffilenmae);
                        fileItem.write(file);
                    }
                    else{
                        auth.setIcon_author_path("default.jpg");
                    }

                }
                else{
                    InputStream stream = fileItem.getInputStream();
                    String value = Streams.asString(stream, "UTF-8");

                    if (Objects.equals(fileItem.getFieldName(), "name")){
                        auth.setName_author(value);
                    }
                    else if (Objects.equals(fileItem.getFieldName(), "desc")){
                        auth.setDescription_author(value);
                    }

                }
            }

            AuthorService.save(auth);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("/StoreBooks");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}