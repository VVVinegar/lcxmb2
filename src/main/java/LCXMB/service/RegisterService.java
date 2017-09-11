package LCXMB.service;

import LCXMB.pojo.User_login;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
public interface RegisterService {
    public boolean isExist(String username);
    public boolean register(String username, String password);
}
