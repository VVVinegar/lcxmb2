package LCXMB.service;


import LCXMB.pojo.User_info;

public interface UserService {
    public User_info findById(String username);

    public int update(String username);

    public int delete(String username);

    int initUser_info(User_info user_info);

    int updateByPrimaryKeySelective(User_info record);
}
