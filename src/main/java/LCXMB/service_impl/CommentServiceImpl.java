package LCXMB.service_impl;

import LCXMB.dao.Pro_commentMapper;
import LCXMB.pojo.Pro_comment;
import LCXMB.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("CommentService")
public class CommentServiceImpl implements CommentService {
    @Resource
    Pro_commentMapper proCommentMapper;

    public List<Pro_comment> findByProId(int id) {
        return proCommentMapper.selectByProId(id);
    }
}
