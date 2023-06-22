package DAO;

import models.Author;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateSessionFactoryUtil;

import java.util.List;

public class AuthorDAO {
    public AuthorDAO() {
    }

    public static void update(Author test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(test);
        tx1.commit();
        session.close();
    }

    public static void save(Author test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(test);
        tx1.commit();
        session.close();
    }
    public static Author findById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        Author auu = (Author) session.get(Author.class, idd);
        tx1.commit();
        session.close();
        return auu;
    }

    public static void delById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "delete from Author where id_author = :id";
        session.createQuery(hql).setParameter("id", idd).executeUpdate();
        tx1.commit();
        session.close();
    }

    public static List<Author> findAll() {
        return HibernateSessionFactoryUtil
                .getSessionFactory()
                .openSession()
                .createQuery("From Author")
                .list();
    }
}
