package LCXMB.beans;

import java.lang.reflect.Array;
import java.util.List;

public class CCate {
    String value;
    List<String> keywords;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public List<String> getKeywords() {
        return keywords;
    }

    public void setKeywords(List<String> keywords) {
        this.keywords = keywords;
    }

    public Boolean getOther() {
        return isOther;
    }

    public void setOther(Boolean other) {
        isOther = other;
    }

    Boolean isOther;
}
