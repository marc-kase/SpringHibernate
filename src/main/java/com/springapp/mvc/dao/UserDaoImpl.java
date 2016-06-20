package com.springapp.mvc.dao;


import com.springapp.mvc.domain.User;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<User> getList() {
        @SuppressWarnings("unchecked")
        List<User> listUser = (List<User>) sessionFactory.openSession()/*getCurrentSession()*/
                .createCriteria(User.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

        return listUser;
    }

    @Override
    public void add(User user) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public User getUser(Long id) {
        return (User) sessionFactory.openSession().get(User.class, id);
    }

    @Override
    public User getUser(String username) {
        String hql = "FROM com.springapp.mvc.domain.User u WHERE u.username = :name";
        Query query = sessionFactory.openSession().createQuery(hql);
        query.setString("name", username);
        return (User) query.uniqueResult();
    }

    @Override
    public void Update(User user) {
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        session.update(user);
        session.getTransaction().commit();
        session.close();
    }


}
