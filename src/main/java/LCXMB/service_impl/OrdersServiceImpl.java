package LCXMB.service_impl;

import LCXMB.dao.OrdersMapper;
import LCXMB.pojo.Orders;
import LCXMB.service.OrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 759517209@qq.com on 2017/9/13.
 */
@Service("OrderService")
public class OrdersServiceImpl implements OrdersService {

    @Resource
    OrdersMapper ordersMapper;

    public int add(Orders orders) {
        int insertNumber = ordersMapper.insert(orders);
        return insertNumber;
    }
}