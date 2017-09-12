package LCXMB.service;


import LCXMB.pojo.User_info;
import java.util.List;

public interface UserService {
    public User_info findById(String username);
    public List<User_info> findAll(int limit);
    public int update(String username);
    public int delete(String username);
    public int add(String username, String password);
}
