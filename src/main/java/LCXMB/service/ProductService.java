package LCXMB.service;

import LCXMB.pojo.Product;

import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/12.
 */
public interface ProductService {
    public List<Product> getProducts(String category_1);
}
