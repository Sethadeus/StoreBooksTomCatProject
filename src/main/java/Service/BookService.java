package Service;

import DAO.AuthorDAO;
import DAO.BookDAO;
import models.Author;
import models.Book;
import models.Genre;

import java.util.List;

public class BookService {

    private static final BookDAO bookDAO = new BookDAO();

    public BookService() {
    }
    public static int getMaxId() { return BookDAO.getMaxId(); }

    public static void delById(int idd) {
        BookDAO.delById(idd);
    }

    public static void save(Book model) {
        BookDAO.save(model);
    }

    public static void update(Book model) {
        BookDAO.update(model);
    }

    public static List<Book> findDiscount() {
        return BookDAO.findDiscount();
    }

    public static List<Book> findAll() {
        return BookDAO.findAll();
    }

    public static List<Book> findByIdList(List<Integer> idlist) {
        return BookDAO.findByIdList(idlist);
    }

    public static List<Book> findByAuthIdList(List<Integer> idlist) {
        return BookDAO.findByAuthIdList(idlist);
    }

    public static List<Book> findByPubIdList(List<Integer> idlist) {
        return BookDAO.findByPubIdList(idlist);
    }
}
