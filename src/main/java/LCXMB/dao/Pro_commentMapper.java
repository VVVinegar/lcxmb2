package LCXMB.dao;

import LCXMB.pojo.Pro_comment;
import LCXMB.pojo.Pro_commentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface Pro_commentMapper {
    long countByExample(Pro_commentExample example);

    int deleteByExample(Pro_commentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Pro_comment record);

    int insertSelective(Pro_comment record);

    List<Pro_comment> selectByExample(Pro_commentExample example);

    Pro_comment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Pro_comment record, @Param("example") Pro_commentExample example);

    int updateByExample(@Param("record") Pro_comment record, @Param("example") Pro_commentExample example);

    int updateByPrimaryKeySelective(Pro_comment record);

    int updateByPrimaryKey(Pro_comment record);
}