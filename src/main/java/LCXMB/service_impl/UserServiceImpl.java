package LCXMB.service_impl;

import LCXMB.dao.User_infoMapper;
import LCXMB.pojo.User_info;
import LCXMB.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("UserService")
public class UserServiceImpl implements UserService{

    @Resource
    User_infoMapper user_infoMapper;

    public User_info findById(String username) {
        User_info user_info = user_infoMapper.selectByPrimaryKey(username);
        return user_info;
    }

    public List<User_info> findAll(int limit) {
        return null;
    }

    public int update(String username) {
        return 0;
    }

    public int delete(String username) {
        return 0;
    }

    public int add(String username, String password) {
        return 0;
    }
}
