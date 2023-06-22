package Servlets.Edit;

import Service.PublishinghouseService;
import models.Publishinghouse;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditPublishingHouse")
public class EditPublishingHouseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idd = Integer.parseInt(request.getParameter("id"));

        String name = Utils.convertToUTF8(request.getParameter("name"));

        Publishinghouse pub = new Publishinghouse();

        pub.setName_publishing_house(name);
        pub.setId_publishing_house(idd);

        PublishinghouseService.update(pub);

        response.sendRedirect("/StoreBooks");
    }
}
