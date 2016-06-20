package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Credential;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

/**
 * Created by MM on 19.06.2016.
 */
@Repository
public class CredDoaImpl implements CredDAO {
    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    public String getPass(Long userId) {
        Credential c = (Credential) sessionFactory.openSession()
                .get(Credential.class, userId);
        return c.getPass();
    }

    @Override
    public Credential get(Long userId) {
        return (Credential) sessionFactory.openSession()
                .get(Credential.class, userId);
    }

    @Override
    public void add(Credential credential) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(credential);
        session.getTransaction().commit();
        session.close();
    }
}
