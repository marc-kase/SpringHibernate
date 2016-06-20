package com.springapp.mvc.dao;

import com.springapp.mvc.domain.User;

import java.util.List;
 
public interface UserDAO {
    List<User> getList();
    void add(User user);
    User getUser(Long id);
    User getUser(String username);
    void Update(User user);
}