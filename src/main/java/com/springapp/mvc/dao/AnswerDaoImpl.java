package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Answer;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by MM on 19.06.2016.
 */
@Repository
public class AnswerDaoImpl implements AnswerDAO {
    @Resource
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Answer> getList() {
        @SuppressWarnings("unchecked")
        List<Answer> list = sessionFactory.openSession().createCriteria(Answer.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
        return list;
    }
}
