package LCXMB.service;

import LCXMB.pojo.SearchProducts;

import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/13.
 */
public interface SearchService {
    public List<SearchProducts> getProductsByCate(float minPrice, float maxPrice, String category_2, int newOrHot,
                                            int lowOrHigh, int begin, int pageSize);

    public SearchProducts getProductsCountByCate(float minPrice, float maxPrice, String category_2, int newOrHot,
                                            int lowOrHigh, int begin, int pageSize);

    public List<SearchProducts> getProductsByTitle(String keywords, int begin, int pageSize);


    public SearchProducts getProductsCountByTitle(String keywords, int begin, int pageSize);
}
