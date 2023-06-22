package Servlets.Del;

import Service.AuthorService;
import Service.BookService;
import models.Author;
import models.Book;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateSessionFactoryUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@WebServlet("/DelBookById")
public class DelBookById extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idd = Integer.parseInt(request.getParameter("id"));

        BookService.delById(idd);

        response.sendRedirect("/StoreBooks");

    }
}
