package LCXMB.pojo;

import java.util.Date;

public class Orders {
    private Integer id;

    private String buyerName;

    private String salerName;

    private Integer proId;

    private Date createTime;

    private Integer addrId;

    private Integer buyer_score;

    private Integer saler_score;

    public Integer getBuyer_score() {
        return buyer_score;
    }

    public void setBuyer_score(Integer buyer_score) {
        this.buyer_score = buyer_score;
    }

    public Integer getSaler_score() {
        return saler_score;
    }

    public void setSaler_score(Integer saler_score) {
        this.saler_score = saler_score;
    }

    public Integer getAddrId() {
        return addrId;
    }

    public void setAddrId(Integer addrId) {
        this.addrId = addrId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName == null ? null : buyerName.trim();
    }

    public String getSalerName() {
        return salerName;
    }

    public void setSalerName(String salerName) {
        this.salerName = salerName == null ? null : salerName.trim();
    }

    public Integer getProId() {
        return proId;
    }

    public void setProId(Integer proId) {
        this.proId = proId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date time) {
        this.createTime = time;
    }
}