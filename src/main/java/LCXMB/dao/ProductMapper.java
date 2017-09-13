package LCXMB.dao;

import LCXMB.pojo.Product;
import LCXMB.pojo.ProductExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductMapper {
    long countByExample(ProductExample example);

    int deleteByExample(ProductExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductExample example);

    Product selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    //用于首页
    List<Product> selectByCategoryOrderAndLimit(String category1);

    List PageMeShowed(String username);

    // TOP10
    List<Product> selectTop10(@Param("field") String field);

    List<Product> selectByCate(@Param("minPrice") float minPrice,@Param("maxPrice") float maxPrice,
                                    @Param("category_2") String category_2, @Param("style") int style,
                                    @Param("sort") boolean sort, @Param("begin") int begin);
}