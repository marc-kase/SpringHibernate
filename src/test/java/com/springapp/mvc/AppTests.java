package com.springapp.mvc;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.webAppContextSetup;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("file:src/main/webapp/WEB-INF/mvc-dispatcher-servlet.xml")
public class AppTests {
    private MockMvc mockMvc;

    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Autowired
    protected WebApplicationContext wac;

    @Before
    public void setup() {
        this.mockMvc = webAppContextSetup(this.wac).build();
    }

    @Test
    public void users() throws Exception {
        mockMvc.perform(get("/test/users"))
                .andExpect(status().isOk())
                .andExpect(view().name("hello"));
    }

    @Test
    public void quests() throws Exception {
        mockMvc.perform(get("all-questions"))
                .andExpect(status().isOk())
                .andExpect(view().name("hello"));
    }

    @Test
    public void answs() throws Exception {
        mockMvc.perform(get("/test/answers"))
                .andExpect(status().isOk())
                .andExpect(view().name("hello"));
    }

    @Test
    public void login() throws Exception {
        mockMvc.perform(get("/admin").param("ssoId", "Bob").param("password","12345"))
                .andExpect(status().isOk())
                .andExpect(view().name("hello"));
    }
}
