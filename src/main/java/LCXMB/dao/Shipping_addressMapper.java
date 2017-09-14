package LCXMB.dao;

import LCXMB.pojo.Shipping_address;
import LCXMB.pojo.Shipping_addressExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface Shipping_addressMapper {
    long countByExample(Shipping_addressExample example);

    int deleteByExample(Shipping_addressExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Shipping_address record);

    int insertSelective(Shipping_address record);

    List<Shipping_address> selectByExample(Shipping_addressExample example);

    Shipping_address selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Shipping_address record, @Param("example") Shipping_addressExample example);

    int updateByExample(@Param("record") Shipping_address record, @Param("example") Shipping_addressExample example);

    int updateByPrimaryKeySelective(Shipping_address record);

    int updateByPrimaryKey(Shipping_address record);

    List<Shipping_address> selectByUsername(@Param("username") String username);
}