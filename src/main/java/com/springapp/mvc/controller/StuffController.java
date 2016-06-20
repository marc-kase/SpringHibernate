package com.springapp.mvc.controller;

import com.springapp.mvc.dao.*;
import com.springapp.mvc.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by MM on 19.06.2016.
 */
@Controller
@RequestMapping("/")
public class StuffController {
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private RoleDAO roleDAO;

    @Autowired
    private CredDAO credDAO;

    @Autowired
    private QuestionDAO questionDAO;

    @Autowired
    private CategoryDAO categoryDAO;

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

    @RequestMapping(value = "profile", method = RequestMethod.GET)
    public String showProfile(ModelMap model, @RequestParam(value = "id") Long id) throws SQLException {
        User u = userDAO.get(id);
        model.addAttribute("user", u);
        return "profile";
    }

    @RequestMapping(value = {"all-users"}, method = RequestMethod.GET)
    public String getAllUsers(ModelMap model) throws SQLException {
        model.addAttribute("users", userDAO.getList());
        return "all-users";
    }

    @RequestMapping(value = "add-user-form", method = RequestMethod.GET)
    public String showAddUserForm() {
        return "add-user";
    }

    @RequestMapping(value = "add-user", method = RequestMethod.POST)
    public String addUser(@RequestBody Profile profile) throws SQLException, IOException {
        Role role = roleDAO.getRole(profile.getRole());
        User u = new User(profile.getUsername(), profile.getEmail(), role);
        userDAO.add(u);
        Credential c = new Credential(u.getUserId(), profile.getPic());
        credDAO.add(c);
        return "redirect: profile?id=" + u.getUserId();
    }

    @RequestMapping(value = "edit-user", method = RequestMethod.POST)
    public String editUser(@RequestBody Profile profile) throws SQLException, IOException {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();

        String redirect;
        if (profile.hasUserid()) redirect = "redirect: profile?id=" + profile.getUserid();
        else redirect = "redirect: profile?id=-1";

        if (name.isEmpty()) return redirect;
        if (!name.equals(profile.getUsername())) return redirect;

        User u = userDAO.get(profile.getUserid());
        if (profile.hasUsername()) u.setUsername(profile.getUsername());
        if (profile.hasEmail()) u.setEmail(profile.getEmail());
//        if (profile.hasPic()) u.setUsername(profile.getUsername());
        return "redirect: profile?id=" + u.getUserId();
    }

    @RequestMapping(value = {"/", "all-questions"}, method = RequestMethod.GET)
    public String getAllQuestions(ModelMap model) {
        List<Question> questions = questionDAO.getList();
        List<Category> categories = categoryDAO.getList();
        model.addAttribute("quests", questions);
        model.addAttribute("catgs", categories);
        return "all-questions";
    }

    @RequestMapping(value = "question", method = RequestMethod.GET)
    public String getQuestion(ModelMap model, @RequestParam (value = "id") Long id) {
        Question questions = questionDAO.get(id);
        model.addAttribute("quest", questions);
        return "question";
    }
}

