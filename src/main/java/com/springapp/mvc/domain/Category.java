package com.springapp.mvc.domain;

import java.util.Set;

/**
 * Created by MM on 19.06.2016.
 */
public class Category {
    private Long categoryId;
    private String name;
    private Set<Question> questions;

    public Category() {
    }

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(Set<Question> questions) {
        this.questions = questions;
    }
}
