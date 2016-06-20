package com.springapp.mvc.domain;

import java.util.Set;

public class User {
    private Long userId;
    private String username;
    private String email;
    private Role role;
    private Byte[] pic;
    private Set<Question> questions;
    private Set<Answer> answers;

    public User() {
    }

    public User(String username, String email, Role role) {
        this.username = username;
        this.email = email;
        this.role = role;
    }

    public Long getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Byte[] getPic() {
        return pic;
    }

    public void setPic(Byte[] pic) {
        this.pic = pic;
    }

    public Set<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(Set<Question> questions) {
        this.questions = questions;
    }

    public Set<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<Answer> answers) {
        this.answers = answers;
    }
}