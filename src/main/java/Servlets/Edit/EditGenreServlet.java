package Servlets.Edit;

import Service.GenreService;
import Service.PublishinghouseService;
import models.Genre;
import models.Publishinghouse;
import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditGenre")
public class EditGenreServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int idd = Integer.parseInt(request.getParameter("id"));

        String name = Utils.convertToUTF8(request.getParameter("name"));

        Genre pub = new Genre();

        pub.setName_genre(name);
        pub.setId_genre(idd);

        GenreService.update(pub);

        response.sendRedirect("/StoreBooks");
    }
}
