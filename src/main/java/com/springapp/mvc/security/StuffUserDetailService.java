package com.springapp.mvc.security;

import com.springapp.mvc.dao.CredDAO;
import com.springapp.mvc.dao.UserDAO;
import com.springapp.mvc.domain.Credential;
import com.springapp.mvc.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by MM on 19.06.2016.
 */
@Service("stuffUserDetailsService")
@Configurable
public class StuffUserDetailService implements UserDetailsService {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private CredDAO credDAO;

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User user = userDAO.get(s);
        System.out.println("User : " + user);
        if (user == null) {
            System.out.println("User not found");
            throw new UsernameNotFoundException("Username not found");
        }        Credential credential = credDAO.get(user.getUserId());

        return new org.springframework.security.core.userdetails.User(
                user.getUsername(),
                credential.getPass(),
                true, true, true, true, getGrantedAuthorities(user));
    }

    private List<GrantedAuthority> getGrantedAuthorities(User user) {
        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority("ROLE_" + user.getRole().getRole()));
        System.out.print("authorities :" + authorities);
        return authorities;
    }
}
