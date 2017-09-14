package LCXMB.service_impl;

import LCXMB.dao.OrdersMapper;
import LCXMB.dao.User_infoMapper;
import LCXMB.pojo.Orders;
import LCXMB.pojo.User_info;
import LCXMB.service.EvaluateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 759517209@qq.com on 2017/9/14.
 */
@Service("EvaluateService")
public class EvaluateServiceImpl implements EvaluateService{

    @Resource
    OrdersMapper ordersMapper;
    @Resource
    User_infoMapper user_infoMapper;
    //获得信誉度改变的用户
    public String getUsername(Integer order_id, String username) {
        Orders orders = ordersMapper.selectByPrimaryKey(order_id);
        if (orders.getBuyerName() == username){
            return orders.getSalerName();
        }
       return  orders.getBuyerName();
    }

    //判断目前用户是是卖家还是买家 0卖家   1买家
    public int buyerOrSaler(Integer order_id, String username) {
        Orders orders = ordersMapper.selectByPrimaryKey(order_id);
        if (orders.getBuyerName() == username){
            return 1;
        }
        return 0;
    }

    public int evaluate(User_info user_info) {

       return user_infoMapper.updateByPrimaryKeySelective(user_info);
    }
}
