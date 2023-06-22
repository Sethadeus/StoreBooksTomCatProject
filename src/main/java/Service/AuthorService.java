package Service;


import DAO.AuthorDAO;
import DAO.BookDAO;
import models.Author;

import java.util.List;

public class AuthorService {

    private static final AuthorDAO authorDAO = new AuthorDAO();

    public AuthorService() {
    }
    public static Author findById(int idd) {
        return authorDAO.findById(idd);
    }

    public static void delById(int idd) {
        authorDAO.delById(idd);
    }

    public static void save(Author model) {
        AuthorDAO.save(model);
    }

    public static void update(Author model) {
        authorDAO.update(model);
    }

    public static List<Author> findAll() {
        return authorDAO.findAll();
    }
}
