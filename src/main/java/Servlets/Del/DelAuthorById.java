package Servlets.Del;

import Service.AuthorService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/DelAuthorById")
public class DelAuthorById extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idd = Integer.parseInt(request.getParameter("id"));

        AuthorService.delById(idd);

        response.sendRedirect("/StoreBooks");
    }
}
