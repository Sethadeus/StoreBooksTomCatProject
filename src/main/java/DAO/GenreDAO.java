package DAO;

import models.Genre;
import org.hibernate.Session;
import org.hibernate.Transaction;
import utils.HibernateSessionFactoryUtil;

import java.util.List;

public class GenreDAO {
    public GenreDAO() {
    }

    public static void update(Genre test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.update(test);
        tx1.commit();
        session.close();
    }

    public static void save(Genre test) {
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(test);
        tx1.commit();
        session.close();
    }

    public static Genre findById(int idd){

        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        Genre pbbb = (Genre) session.get(Genre.class, idd);
        tx1.commit();
        session.close();
        return pbbb;
    }

    public static List<Genre> findByIdList(List<Integer> idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "SELECT p FROM Genre p WHERE p.id IN :ids";
        List<Genre> genres = session.createQuery(hql).setParameter("ids", idd).getResultList();
        tx1.commit();
        session.close();
        return genres;
    }

    public static void delById(int idd){
        Session session = HibernateSessionFactoryUtil.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        String hql = "delete from Genre where id_genre = :id";
        session.createQuery(hql).setParameter("id", idd).executeUpdate();
        tx1.commit();
        session.close();
    }

    public static List<Genre> findAll() {
        return HibernateSessionFactoryUtil
                .getSessionFactory()
                .openSession()
                .createQuery("From Genre")
                .list();
    }
}
