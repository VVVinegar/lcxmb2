package LCXMB.service;


import LCXMB.pojo.User_info;
import java.util.List;

public interface UserService {
    public User_info findById(String username);
    public List<User_info> findAll(int limit);
    public int update(String username);
    public int delete(String username);

    int initUser_info(User_info user_info);
}
