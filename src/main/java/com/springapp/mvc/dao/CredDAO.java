package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Credential;

/**
 * Created by MM on 19.06.2016.
 */
public interface CredDAO {
    String getPass(Long userId);
    Credential get(Long userId);
    void add(Credential credential);
}
