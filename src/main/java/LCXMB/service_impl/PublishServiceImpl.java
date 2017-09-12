package LCXMB.service_impl;

import LCXMB.dao.ProductMapper;
import LCXMB.pojo.Product;
import LCXMB.service.PublishService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 759517209@qq.com on 2017/9/12.
 */
@Service("PublishService")
public class PublishServiceImpl implements PublishService {

    @Resource
    ProductMapper productMapper;

    public boolean publish(Product product) {
        try {
            productMapper.insertSelective(product);
            return true;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return false;
        }
    }
}
