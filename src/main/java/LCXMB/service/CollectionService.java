package LCXMB.service;

import LCXMB.pojo.Collections;

import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/14.
 */
public interface CollectionService {
    public Collections isExists(String username, Integer pro_id);

    public int addCollection(Collections collections);

    public List<Collections> findProductsByUser(String username);
}
