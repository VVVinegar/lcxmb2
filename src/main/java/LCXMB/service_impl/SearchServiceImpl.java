package LCXMB.service_impl;

import LCXMB.dao.ProductMapper;
import LCXMB.pojo.Product;
import LCXMB.service.SearchService;
import org.apache.ibatis.annotations.Param;
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

    public List<Product> getProductsByCate(float minPrice, float maxPrice, String category_2, int newOrHot,
                                            int lowOrHigh, int begin) {
        return productMapper.selectByCate(minPrice, maxPrice, category_2,  newOrHot, lowOrHigh, begin);
    }

    public List<Product> getProductsByTitle(String keywords, int page) {
        return productMapper.selectByTitle(keywords, page);
    }

}
