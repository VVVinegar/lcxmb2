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

    //按一级分类查询
    public List<Product> getProducts(String category_1) {
        return  productMapper.selectByCategoryOrderAndLimit(category_1);
    }

    public Product findById(int id) {
        return productMapper.selectByPrimaryKey(id);
    }

    public int updateStatus(Product record) {
        return productMapper.updateByPrimaryKeySelective(record);
    }
}
