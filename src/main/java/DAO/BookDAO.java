package DAO;

import models.Author;
import models.Book;
import models.Genre;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import utils.HibernateSessionFactoryUtil;

import java.util.List;

public class BookDAO {
    public BookDAO() {
    }

    public static void update(Book test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(test);
        tx1.commit();
        session.close();
    }

    public static void delById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "delete from Book where id = :id";
        session.createQuery(hql).setParameter("id", idd).executeUpdate();
        tx1.commit();
        session.close();
    }

    public static List<Book> findByIdList(List<Integer> idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "SELECT p FROM Book p WHERE p.id IN :ids";
        List<Book> genres = session.createQuery(hql).setParameter("ids", idd).getResultList();
        tx1.commit();
        session.close();
        return genres;
    }

    public static List<Book> findByAuthIdList(List<Integer> idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "SELECT p FROM Book p WHERE p.id_author IN :ids";
        List<Book> genres = session.createQuery(hql).setParameter("ids", idd).getResultList();
        tx1.commit();
        session.close();
        return genres;
    }

    public static List<Book> findByPubIdList(List<Integer> idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "SELECT p FROM Book p WHERE p.id_publishing_house IN :ids";
        List<Book> genres = session.createQuery(hql).setParameter("ids", idd).getResultList();
        tx1.commit();
        session.close();
        return genres;
    }

    public static List<Book> findDiscount(){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "SELECT p FROM Book p WHERE p.new_price < p.price";
        List<Book> genres = session.createQuery(hql).getResultList();
        tx1.commit();
        session.close();
        return genres;
    }

    public static int getMaxId(){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();

        String SQL_QUERY = "select max(id_book)from Book insurance";
        Query query = session.createQuery(SQL_QUERY);
        List list = query.list();
        session.close();
        return (int) list.get(0);
    }

    public static void save(Book test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(test);
        tx1.commit();
        session.close();
    }

    public static List<Book> findAll() {
        return HibernateSessionFactoryUtil
                .getSessionFactory()
                .openSession()
                .createQuery("From Book")
                .list();
    }
}
