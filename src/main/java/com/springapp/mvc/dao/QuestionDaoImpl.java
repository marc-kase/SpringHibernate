package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Question;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by MM on 19.06.2016.
 */
@Repository
public class QuestionDaoImpl implements QuestionDAO {
    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Question> getList() {
        @SuppressWarnings("unchecked")
        List<Question> list = (List<Question>) sessionFactory.openSession()
                .createCriteria(Question.class)
                .setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();

        return list;
    }

    @Override
    public Question get(Long id) {
        return (Question) sessionFactory.openSession().get(Question.class, id);
    }
}
