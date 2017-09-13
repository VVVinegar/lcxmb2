package LCXMB.service_impl;

import LCXMB.dao.OrderMapper;
import LCXMB.pojo.Order;
import LCXMB.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 759517209@qq.com on 2017/9/13.
 */
@Service("OrderService")
public class OrderServiceImpl implements OrderService{

    @Resource
    OrderMapper orderMapper;

    public int add(Order order) {
        int insertNumber = orderMapper.insert(order);
        return insertNumber;
    }
}
