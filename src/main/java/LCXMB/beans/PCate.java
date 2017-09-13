package LCXMB.beans;

import java.util.List;

public class PCate {
    String value;
    List<CCate> children;

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
