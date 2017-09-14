package LCXMB.service;

import LCXMB.pojo.OrderAndProducts;
import LCXMB.pojo.Orders;

import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/13.
 */
public interface OrdersService {
    public int add(Orders orders);

    public int updateScore(Orders orders);

    public List<OrderAndProducts> selectOrderAndProductsByUsername(String username);
}
