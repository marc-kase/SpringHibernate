package com.springapp.mvc.domain;

/**
 * Created by MM on 19.06.2016.
 */
public class Credential {
    private Long userId;
    private String pass;

    public Credential() {
    }

    public Credential(Long userId, String pass) {
        this.userId = userId;
        this.pass = pass;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
