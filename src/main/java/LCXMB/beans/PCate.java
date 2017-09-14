package LCXMB.beans;

import java.util.List;

public class PCate {
    String value;
    List<CCate> children;
    String img_url;

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public List<CCate> getChildren() {
        return children;
    }

    public void setChildren(List<CCate> children) {
        this.children = children;
    }
}
