package LCXMB.service;

import LCXMB.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/13.
 */
public interface SearchService {
    public List<Product> getProductsByCate(float minPrice, float maxPrice, String category_2, int orderType, boolean isDesc, int begin);
}
