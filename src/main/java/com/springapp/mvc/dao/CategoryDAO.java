package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Category;

import java.util.List;

/**
 * Created by MM on 19.06.2016.
 */
public interface CategoryDAO {
    List<Category> getList();
    Category get(Long id);
}
