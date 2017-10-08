package LCXMB.controller;

import LCXMB.pojo.Msg;
import com.sun.javafx.collections.MappingChange;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.Map;

import static org.junit.Assert.*;

/**
 * Created by 759517209@qq.com on 2017/9/20.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml",
        "classpath:springMVC.xml" })
public class LoginControllerTest {
    @Autowired
    WebApplicationContext context;

    MockMvc mockMvc;

    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testLogin() throws Exception {
        MockHttpServletResponse result =  mockMvc.perform(MockMvcRequestBuilders.post("/api/login").
                param("gaoxiang","123456")).andReturn().getResponse();

        System.out.println(result);
    }


}