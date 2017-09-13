package LCXMB.pojo;

import java.util.Date;

public class User_info {
    private String username;

    private Integer credits;

    private Float virtualCurrency;

    private String avatarUrl;

    private Date createTime;

    private Integer defaultAddress;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Integer getCredits() {
        return credits;
    }

    public void setCredits(Integer credits) {
        this.credits = credits;
    }

    public Float getVirtualCurrency() {
        return virtualCurrency;
    }

    public void setVirtualCurrency(Float virtualCurrency) {
        this.virtualCurrency = virtualCurrency;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl == null ? null : avatarUrl.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getDefaultAddress() {
        return defaultAddress;
    }

    public void setDefaultAddress(Integer defaultAddress) {
        this.defaultAddress = defaultAddress;
    }
}