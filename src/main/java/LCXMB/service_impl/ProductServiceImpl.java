package LCXMB.service_impl;

import LCXMB.dao.ProductMapper;
import LCXMB.pojo.Product;
import LCXMB.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/12.
 */
@Service("ProductService")
public class ProductServiceImpl implements ProductService{

    @Resource
    ProductMapper productMapper;

    public List<Product> getProducts(String category_1) {
        List<Product> list = productMapper.selectByCategoryOrderAndLimit(category_1);
        return list;
    }
}
