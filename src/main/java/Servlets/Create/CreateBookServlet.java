package Servlets.Create;

import Service.AuthorService;
import Service.BookService;
import Service.GenreService;
import Service.PublishinghouseService;
import models.Author;
import models.Book;
import models.Genre;
import models.Publishinghouse;
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
import java.util.*;


public class CreateBookServlet extends HttpServlet {

    static final int fileMaxSize = 500 * 1024;
    static final int memMaxSize = 500 * 1024;


    private File file;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int max = BookService.getMaxId();

        String filePath = request.getServletContext().getInitParameter("book-upload");
        response.setContentType("text/html");

        Book book = new Book();

        DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
        diskFileItemFactory.setRepository(new File(filePath));
        diskFileItemFactory.setSizeThreshold(memMaxSize);
        ServletFileUpload upload = new ServletFileUpload(diskFileItemFactory);
        upload.setHeaderEncoding("UTF-8");
        upload.setSizeMax(fileMaxSize);

        try {
            List fileItems = upload.parseRequest(request);
            Iterator iterator = fileItems.iterator();

            List<Integer> samebookidlist = new ArrayList<>();

            List<Integer> genrelist = new ArrayList<>();

            while (iterator.hasNext()) {
                FileItem fileItem = (FileItem) iterator.next();

                if (!fileItem.isFormField()) {

                    String fileName = fileItem.getName();
                    if (fileName.length()>0){
                        String ffilenmae = new SimpleDateFormat("yyyyMMddHHmmssSS").format(new Date()) + fileName.substring(fileName.lastIndexOf("."));
                        file = new File(filePath + ffilenmae);

                        book.setIcon_path(ffilenmae);
                        fileItem.write(file);
                    }
                    else{
                        book.setIcon_path("default.jpg");
                    }
                } else {
                    InputStream stream = fileItem.getInputStream();
                    String value = Streams.asString(stream, "UTF-8");

                    switch (fileItem.getFieldName()) {
                        case "pub":
                            System.out.println("pub");
                            System.out.println(value);
                            Integer val = Integer.parseInt(value);
                            if (val>=0){
                                Publishinghouse pubb = PublishinghouseService.findById(val);
                                book.setId_publishing_house(val);
                                book.setPublishingHouse(pubb);
                            }
                            break;
                        case "name":
                            System.out.println("name");
                            System.out.println(value);
                            book.setName_book(value);
                            break;
                        case "desc":
                            System.out.println("desc");
                            System.out.println(value);
                            book.setDescription(value);
                            break;
                        case "year":
                            System.out.println("year");
                            System.out.println(value);
                            book.setYear_release(Integer.parseInt(value));
                            break;
                        case "price":
                            System.out.println("price");
                            System.out.println(value);
                            book.setPrice(Integer.parseInt(value));
                            book.setNew_price(Integer.parseInt(value));
                            break;
                        case "pages":
                            System.out.println("pages");
                            System.out.println(value);
                            book.setNumberPage(Integer.parseInt(value));
                            break;
                        case "avail":
                            System.out.println("avail");
                            System.out.println(value);
                            if (value.equals("1")) {
                                book.setAvail(true);
                            } else if (value.equals("2")) {
                                book.setAvail(false);
                            }
                            break;
                        case "author":
                            System.out.println("author");
                            System.out.println(value);
                            int val2 = Integer.parseInt(value);
                            if (val2>0){
                                Author auth = AuthorService.findById(val2);
                                book.setAuthor(auth);
                                book.setId_author(val2);
                            }
                            break;
                        case "samebook":
                            System.out.println("samebook");
                            int val3 = Integer.parseInt(value);
                            if (val3!=-1){
                                samebookidlist.add(val3);
                            }
                            break;
                        case "genre":
                            System.out.println("genre");
                            int val4 = Integer.parseInt(value);
                            if (val4!=-1){
                                genrelist.add(val4);
                            }
                            break;
                    }
                }
            }

            List<Genre> ggg = GenreService.findByIdList(genrelist);
            Set<Genre> hashSet = new HashSet<>(ggg);
            book.setGenres(hashSet);

            List<Book> iii = BookService.findByIdList(samebookidlist);
            Set<Book> hashSet2 = new HashSet<>(iii);
            book.setSamebooks(hashSet2);

            BookService.save(book);

            int max2 = BookService.getMaxId();

            System.out.println(11111);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("/StoreBooks");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}