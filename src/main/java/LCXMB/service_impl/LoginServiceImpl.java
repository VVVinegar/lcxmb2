package LCXMB.service_impl;

import LCXMB.dao.User_loginMapper;
import LCXMB.pojo.User_login;
import LCXMB.service.LoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 759517209@qq.com on 2017/9/8.
 */
@Service("LoginService")
public class LoginServiceImpl implements LoginService {

    @Resource
    User_loginMapper user_loginMapper;

    public boolean verify(String name, String password) {
        User_login user_login = user_loginMapper.selectByPrimaryKey(name);
        if(user_login != null){
            if(user_login.getPassword().equals(password)  && user_login.getUsername().equals( name)){
                return true;
            }
        }
        return false;
    }
}
