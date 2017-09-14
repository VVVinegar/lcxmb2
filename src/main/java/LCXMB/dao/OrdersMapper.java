package LCXMB.dao;

import LCXMB.pojo.OrderAndProducts;
import LCXMB.pojo.OrderExample;
import LCXMB.pojo.Orders;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrdersMapper {
    long countByExample(OrderExample example);

    int deleteByExample(OrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Orders record);

    int insertSelective(Orders record);

    List<Orders> selectByExample(OrderExample example);

    Orders selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Orders record, @Param("example") OrderExample example);

    int updateByExample(@Param("record") Orders record, @Param("example") OrderExample example);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);

    List<OrderAndProducts> selectOrderAndProductsByUsername(@Param("username") String username);
}