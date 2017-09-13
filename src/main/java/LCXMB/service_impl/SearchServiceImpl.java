package LCXMB.service_impl;

import LCXMB.dao.ProductMapper;
import LCXMB.pojo.Product;
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

    public List<Product> getProductsByCate(float minPrice, float maxPrice, String category_2, int orderType, boolean isDesc, int begin) {
        return productMapper.selectByCate(minPrice, maxPrice, category_2, orderType, isDesc, begin);
    }
}
