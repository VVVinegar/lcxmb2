package LCXMB.dao;

import LCXMB.pojo.Product;
import LCXMB.pojo.ProductExample;
import java.util.List;

import LCXMB.pojo.SearchProducts;
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

    //按分类查询
    List<SearchProducts> selectByCate(@Param("minPrice") float minPrice,@Param("maxPrice") float maxPrice,
                                    @Param("category_2") String category_2, @Param("newOrHot") int newOrHot,
                                    @Param("lowOrHigh") int lowOrHigh, @Param("begin") int begin, @Param("pageSize") int pageSize);
    //按title模糊查询
    List<SearchProducts> selectByTitle(@Param("keywords") String keywords, @Param("begin") int begin , @Param("pageSize") int pageSize);
}