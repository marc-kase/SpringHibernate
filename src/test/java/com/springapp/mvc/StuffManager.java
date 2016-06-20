package com.springapp.mvc;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class StuffManager {

    public static void main(String[] args) {
        String hbm = "/hibernate/hibernate.cfg.xml";

        Configuration configuration = new Configuration().configure(hbm);
        ServiceRegistryBuilder registry = new ServiceRegistryBuilder();
        registry.applySettings(configuration.getProperties());
        ServiceRegistry serviceRegistry = registry.configure().build();

        // builds a session factory from the service registry
        SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);

        // obtains the session
        Session session = sessionFactory.openSession();
//        session.beginTransaction();
//        QuestionDaoImpl dao = new QuestionDaoImpl(sessionFactory);
//        List<Question> qs = dao.getList();
//        session.getTransaction().commit();
        session.close();
    }
}
