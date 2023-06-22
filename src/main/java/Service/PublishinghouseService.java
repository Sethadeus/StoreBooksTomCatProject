package Service;

import DAO.BookDAO;
import DAO.PublishinghouseDAO;
import models.Author;
import models.Publishinghouse;

import java.util.List;

public class PublishinghouseService {

    private static final DAO.PublishinghouseDAO PublishinghouseDAO = new PublishinghouseDAO();


    public PublishinghouseService() {
    }
    public static Publishinghouse findById(int idd) {
        return PublishinghouseDAO.findById(idd);
    }

    public static void delById(int idd) {
        PublishinghouseDAO.delById(idd);
    }

    public static void save(Publishinghouse model) {
        PublishinghouseDAO.save(model);
    }

    public static void update(Publishinghouse model) {
        PublishinghouseDAO.update(model);
    }

    public static List<Publishinghouse> findAll() {
        return PublishinghouseDAO.findAll();
    }
}
