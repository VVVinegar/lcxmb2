package LCXMB.service_impl;

import LCXMB.dao.ProductMapper;
import LCXMB.pojo.Product;
import LCXMB.service.Top10Service;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("Top10Service")
public class Top10ServiceImpl implements Top10Service{
    @Resource
    ProductMapper productMapper;

    public List<Product> getNewProducts() {
        return productMapper.selectTop10("update_time");
    }

    public List<Product> getHotProducts() {
        return productMapper.selectTop10("watch_count");
    }

    public List<Product> getDescProducts() {
        return productMapper.selectTop10("price_changed");
    }
}
