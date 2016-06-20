package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Question;

import java.util.List;

/**
 * Created by MM on 19.06.2016.
 */
public interface QuestionDAO {
    List<Question> getList();
    Question get(Long id);
}
