package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Role;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by MM on 19.06.2016.
 */

@Repository
public class RoleDaoImpl implements RoleDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Role> list() {
        @SuppressWarnings("unchecked")
        List<Role> list = (List<Role>) sessionFactory.openSession()
                .createCriteria(Role.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

        return list;
    }

    @Override
    public Role getRole(long id) {
        return  (Role) sessionFactory.getCurrentSession().get(Role.class, id);
    }

    @Override
    public Role getRole(String role) {
        String hql = "FROM com.springapp.mvc.domain.Role r WHERE r.role = :r";
        Query query = sessionFactory.openSession().createQuery(hql);
        query.setString("r", role);
        return (Role)query.uniqueResult();
    }
}
