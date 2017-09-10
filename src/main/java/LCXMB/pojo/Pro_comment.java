package LCXMB.pojo;

import java.util.Date;

public class Pro_comment {
    private Integer id;

    private Integer proId;

    private String commenter;

    private String replyer;

    private String commenterAvatar;

    private String content;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProId() {
        return proId;
    }

    public void setProId(Integer proId) {
        this.proId = proId;
    }

    public String getCommenter() {
        return commenter;
    }

    public void setCommenter(String commenter) {
        this.commenter = commenter == null ? null : commenter.trim();
    }

    public String getReplyer() {
        return replyer;
    }

    public void setReplyer(String replyer) {
        this.replyer = replyer == null ? null : replyer.trim();
    }

    public String getCommenterAvatar() {
        return commenterAvatar;
    }

    public void setCommenterAvatar(String commenterAvatar) {
        this.commenterAvatar = commenterAvatar == null ? null : commenterAvatar.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}