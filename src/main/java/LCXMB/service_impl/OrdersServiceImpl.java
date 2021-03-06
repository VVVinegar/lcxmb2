package LCXMB.service_impl;

import LCXMB.dao.OrdersMapper;
import LCXMB.pojo.OrderAndProducts;
import LCXMB.pojo.Orders;
import LCXMB.service.OrdersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    public int updateScore(Orders orders) {
        int updateNumber = ordersMapper.updateByPrimaryKeySelective(orders);
        return updateNumber;
    }

    public List<OrderAndProducts> selectOrderAndProductsByUsername(String username) {
        return ordersMapper.selectOrderAndProductsByUsername(username);
    }

    public Orders findById(Integer id) {
        return  ordersMapper.selectByPrimaryKey(id);
    }
}
