package LCXMB.service_impl;

import LCXMB.dao.ProductMapper;
import LCXMB.pojo.SearchProducts;
import LCXMB.service.SearchService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/13.
 */
@Service("SearchService")
public class SearchServiceImpl implements SearchService{

    @Resource
    ProductMapper productMapper;

    public List<SearchProducts> getProductsByCate(float minPrice, float maxPrice, String category_2, int newOrHot,
                                            int lowOrHigh, int begin, int pageSize) {
        return productMapper.selectByCate(minPrice, maxPrice, category_2,  newOrHot, lowOrHigh, begin, pageSize);
    }

    public SearchProducts getProductsCountByCate(float minPrice, float maxPrice, String category_2, int newOrHot, int lowOrHigh, int begin, int pageSize) {
        return productMapper.selectCountByCate(minPrice, maxPrice, category_2,  newOrHot, lowOrHigh, begin, pageSize);
    }

    public List<SearchProducts> getProductsByTitle(String keywords, int page, int pageSize) {
        return productMapper.selectByTitle(keywords, page, pageSize);
    }

    public SearchProducts getProductsCountByTitle(String keywords, int page, int pageSize) {
        return productMapper.selectCountByTitle(keywords, page, pageSize);
    }

}
