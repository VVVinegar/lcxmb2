package LCXMB.service;

import LCXMB.pojo.User_info;

/**
 * Created by 759517209@qq.com on 2017/9/14.
 */
public interface EvaluateService {

    public String getUsername(Integer order_id, String username);

    public int evaluate(User_info user_info);

    public int buyerOrSaler(Integer order_id, String username);
}
