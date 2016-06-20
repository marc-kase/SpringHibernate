package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Role;

import java.util.List;

/**
 * Created by MM on 19.06.2016.
 */
public interface RoleDAO {
    List<Role> list();
    Role getRole(long id);
    Role getRole(String role);
}
