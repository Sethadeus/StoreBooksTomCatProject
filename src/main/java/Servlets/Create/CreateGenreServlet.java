package Servlets.Create;

import Service.GenreService;
import models.Genre;

import utils.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/CreateGenre")
public class CreateGenreServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pubName = request.getParameter("name");

        Genre pub = new Genre();
        pub.setName_genre(Utils.convertToUTF8(pubName));

        GenreService.save(pub);

        response.sendRedirect("/StoreBooks");
    }
}
