package LCXMB.dao;

import LCXMB.pojo.User_info;
import LCXMB.pojo.User_infoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface User_infoMapper {
    long countByExample(User_infoExample example);

    int deleteByExample(User_infoExample example);

    int deleteByPrimaryKey(String username);

    int insert(User_info record);

    int insertSelective(User_info record);

    List<User_info> selectByExample(User_infoExample example);

    User_info selectByPrimaryKey(String username);

    int updateByExampleSelective(@Param("record") User_info record, @Param("example") User_infoExample example);

    int updateByExample(@Param("record") User_info record, @Param("example") User_infoExample example);

    int updateByPrimaryKeySelective(User_info record);

    int updateByPrimaryKey(User_info record);
}