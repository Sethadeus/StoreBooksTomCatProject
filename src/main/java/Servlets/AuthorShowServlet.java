package Servlets;

import Service.AuthorService;
import Service.BookService;
import Service.GenreService;
import Service.PublishinghouseService;
import models.Author;
import models.Book;
import models.Genre;
import models.Publishinghouse;
import utils.HibernateSessionFactoryUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;


public class AuthorShowServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String authname = request.getParameter("name");
        String authid = request.getParameter("id");
        List<Integer> idlist= new ArrayList<>();
        idlist.add(Integer.parseInt(authid));
        List<Book> bookAuthList = BookService.findByAuthIdList(idlist);
        request.setAttribute("bookAuthList", bookAuthList);
        request.setAttribute("bookAuthName", authname);

        List<Book> bookList = BookService.findAll();
        Collections.shuffle(bookList);
        request.setAttribute("bookList", bookList);

        List<Book> discountList = BookService.findDiscount();
        Collections.shuffle(discountList);
        request.setAttribute("discountList", discountList);

        List<Author> authList = AuthorService.findAll();
        request.setAttribute("authList", authList);

        List<Publishinghouse> pub = PublishinghouseService.findAll();
        request.setAttribute("publishingHouseList", pub);

        List<Genre> gen = GenreService.findAll();
        request.setAttribute("genreList", gen);

        request.getRequestDispatcher("/authsorted.jsp").forward(request, response);

    }
}
