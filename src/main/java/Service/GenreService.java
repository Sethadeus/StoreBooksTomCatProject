package Service;

import DAO.GenreDAO;
import models.Genre;
import models.Publishinghouse;

import java.util.List;

public class GenreService {
    private static final GenreDAO authorDAO = new GenreDAO();

    public GenreService() {
    }

    public static Genre findById(int idd) {
        return authorDAO.findById(idd);
    }

    public static void delById(int idd) {
        authorDAO.delById(idd);
    }

    public static void save(Genre model) {
        authorDAO.save(model);
    }

    public static void update(Genre model) {
        authorDAO.update(model);
    }

    public static List<Genre> findAll() {
        return authorDAO.findAll();
    }

    public static List<Genre> findByIdList(List<Integer> idlist) {
        return authorDAO.findByIdList(idlist);
    }
}
