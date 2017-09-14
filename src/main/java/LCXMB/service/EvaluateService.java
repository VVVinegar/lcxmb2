package LCXMB.service;

/**
 * Created by 759517209@qq.com on 2017/9/14.
 */
public interface EvaluateService {

    public String getUsername(Integer order_id, String username);

    public int evaluate(Integer score, String uername);
}
