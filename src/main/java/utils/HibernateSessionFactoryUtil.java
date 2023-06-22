package utils;

import models.Author;
import models.Book;
import models.Genre;
import models.Publishinghouse;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateSessionFactoryUtil {

    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
                configuration.addAnnotatedClass(Author.class);
                configuration.addAnnotatedClass(Book.class);
                configuration.addAnnotatedClass(Publishinghouse.class);
                configuration.addAnnotatedClass(Genre.class);

                StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
                sessionFactory = configuration.buildSessionFactory(builder.build());

            } catch (Exception e) {
                System.out.println("Ошибка!" + e);
            }
        }
        return sessionFactory;
    }
}
