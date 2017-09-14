package LCXMB.service;

import LCXMB.pojo.Product;
import LCXMB.pojo.SearchProducts;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/13.
 */
public interface SearchService {
    public List<SearchProducts> getProductsByCate(float minPrice, float maxPrice, String category_2, int newOrHot,
                                            int lowOrHigh, int begin, int pageSize);

    public List<SearchProducts> getProductsByTitle(String keywords, int begin, int pageSize);


}
