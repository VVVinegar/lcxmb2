package LCXMB.dao;

import LCXMB.pojo.Collections;
import LCXMB.pojo.CollectionsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CollectionsMapper {
    long countByExample(CollectionsExample example);

    int deleteByExample(CollectionsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Collections record);

    int insertSelective(Collections record);

    List<Collections> selectByExample(CollectionsExample example);

    Collections selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Collections record, @Param("example") CollectionsExample example);

    int updateByExample(@Param("record") Collections record, @Param("example") CollectionsExample example);

    int updateByPrimaryKeySelective(Collections record);

    int updateByPrimaryKey(Collections record);

    Collections selectByUsernameAndProid(@Param("username") String username, @Param("pro_id") int pro_id);
}