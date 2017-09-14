package LCXMB.service_impl;

import LCXMB.dao.User_loginMapper;
import LCXMB.pojo.User_login;
import LCXMB.service.RegisterService;
import org.springframework.util.DigestUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
@Service("RegisterService")
public class RegisterServiceImpl implements RegisterService{

    @Resource
    User_loginMapper user_loginMapper;

    public boolean register(String username, String password) {
        try {
            String md5_password = DigestUtils.md5DigestAsHex(password.getBytes());
            User_login user_login = new User_login(username, md5_password);
            user_loginMapper.insert(user_login);
            return true;
        } catch (Exception e){
            return false;
        }
    }

    public boolean isExist(String username){
        User_login user_login = user_loginMapper.selectByPrimaryKey(username);
        if (user_login == null){
            return false;
        }
        return true;
    }

}
