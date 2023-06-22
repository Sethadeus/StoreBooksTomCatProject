
package Servlets.Create;

        import Service.AuthorService;
        import Service.BookService;
        import Service.PublishinghouseService;
        import models.Author;
        import models.Book;
        import models.Publishinghouse;
        import org.hibernate.Session;
        import org.hibernate.Transaction;
        import utils.HibernateSessionFactoryUtil;
        import utils.Utils;

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

@WebServlet("/CreatePublishingHouse")
public class CreatePublishingHouseServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String pubName = request.getParameter("name");

        Publishinghouse pub = new Publishinghouse();
        pub.setName_publishing_house(Utils.convertToUTF8(pubName));

        PublishinghouseService.save(pub);

        response.sendRedirect("/StoreBooks");
    }
}
