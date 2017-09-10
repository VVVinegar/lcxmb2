package LCXMB.pojo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.junit.Assert.*;

/**
 * Created by 759517209@qq.com on 2017/9/9.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
@WebAppConfiguration
public class User_loginTest {

    @Test
    public void testUser_login(){
        User_login user_login = new User_login("hong", "123");
        System.out.print(user_login.getUsername());
        System.out.print(user_login.getPassword());
    }
}