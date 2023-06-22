
package Servlets.Del;

import Service.BookService;
import Service.PublishinghouseService;
import models.Publishinghouse;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DelPublishingHouse")
public class DelPublishingById extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idd = Integer.parseInt(request.getParameter("id"));

        System.out.println(idd);

        PublishinghouseService.delById(idd);

        response.sendRedirect("/StoreBooks");
    }
}
