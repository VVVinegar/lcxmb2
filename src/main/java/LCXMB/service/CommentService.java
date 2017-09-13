package LCXMB.service;


import LCXMB.pojo.Pro_comment;
import java.util.List;

public interface CommentService {
    public List<Pro_comment> findByProId(int id);
}
