package DAO;

import models.Author;
import models.Book;
import models.Publishinghouse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateSessionFactoryUtil;

import java.util.List;

public class PublishinghouseDAO {
    public PublishinghouseDAO() {
    }

    public static void update(Publishinghouse test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(test);
        tx1.commit();
        session.close();
    }

    public static void save(Publishinghouse test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(test);
        tx1.commit();
        session.close();
    }

    public static Publishinghouse findById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        Publishinghouse pbbb = (Publishinghouse) session.get(Publishinghouse.class, idd);
        tx1.commit();
        session.close();
        return pbbb;
    }

    public static void delById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "delete from Publishinghouse where id = :id";
        session.createQuery(hql).setParameter("id", idd).executeUpdate();
        tx1.commit();
        session.close();
    }

    public static List<Publishinghouse> findAll() {
        return HibernateSessionFactoryUtil
                .getSessionFactory()
                .openSession()
                .createQuery("From Publishinghouse")
                .list();
    }
}
