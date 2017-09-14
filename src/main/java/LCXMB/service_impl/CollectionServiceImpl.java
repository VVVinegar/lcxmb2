package LCXMB.service_impl;

import LCXMB.dao.CollectionsMapper;
import LCXMB.pojo.Collections;
import LCXMB.service.CollectionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 759517209@qq.com on 2017/9/14.
 */
@Service("CollectionService")
public class CollectionServiceImpl implements CollectionService{

    @Resource
    CollectionsMapper collectionsMapper;

    public Collections isExists(String username, int pro_id) {
        return collectionsMapper.selectByUsernameAndProid(username, pro_id);
    }

    public int addCollection(Collections collections) {
        return collectionsMapper.insert(collections);
    }
}
