package models;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.HashMap;
import java.util.Map;

public class HibernateUtil {

    private static SessionFactory sessionFactory;

    private static EntityManager em = null;

    public static  EntityManager getEM()
    {
        if (em == null) {
            Map<String, Object> configOverrides = new HashMap<String, Object>();
            System.out.println("SYSTEM ENV");
            configOverrides.put("javax.persistence.jdbc.password", System.getenv("SPRING_APP_DB_PASSWD"));

            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("theatrondb",configOverrides);
            em = entityManagerFactory.createEntityManager();
        }
        return  em;
    }

    public static SessionFactory buildSessionFactory() {
        // A SessionFactory is set up once for an application!

        Map<String,String> HerokuSettings = new HashMap<>();
        HerokuSettings.put("hibernate.connection.password",System.getenv("SPRING_APP_DB_PASSWD"));

        final StandardServiceRegistry registry = new StandardServiceRegistryBuilder().
                configure("hibernate.cfg.xml").
                applySettings(HerokuSettings).
                build();
        try {
            sessionFactory = new MetadataSources( registry ).buildMetadata().buildSessionFactory();
            return sessionFactory;
        }
        catch (Exception e) {
            // The registry would be destroyed by the SessionFactory, but we had trouble building the SessionFactory
            // so destroy it manually.
            System.out.println("Exception at buildSessionFactory ");
            System.out.println(e.getMessage());
            e.printStackTrace();
            StandardServiceRegistryBuilder.destroy( registry );
            return null;
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void shutdown() {
        sessionFactory.close();
    }

}