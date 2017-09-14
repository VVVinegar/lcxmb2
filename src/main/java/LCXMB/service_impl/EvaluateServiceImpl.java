package LCXMB.service_impl;

import LCXMB.dao.OrdersMapper;
import LCXMB.pojo.Orders;
import LCXMB.service.EvaluateService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.persistence.criteria.Order;

/**
 * Created by 759517209@qq.com on 2017/9/14.
 */
@Service("EvaluateService")
public class EvaluateServiceImpl implements EvaluateService{

    @Resource
    OrdersMapper ordersMapper;

    public String getUsername(Integer order_id, String username) {
        Orders orders = ordersMapper.selectByPrimaryKey(order_id);
        if (orders.getBuyerName() == username){
            return orders.getSalerName();
        }
       return  orders.getBuyerName();
    }

    public int evaluate(Integer score, String uername) {

        ordersMapper.updateByPrimaryKey()

        return 0;
    }
}
