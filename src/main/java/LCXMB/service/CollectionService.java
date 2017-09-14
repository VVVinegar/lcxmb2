package LCXMB.service;

import LCXMB.pojo.Collections;

/**
 * Created by 759517209@qq.com on 2017/9/14.
 */
public interface CollectionService {
    public Collections isExists(String username, int pro_id);

    public int addCollection(Collections collections);
}
