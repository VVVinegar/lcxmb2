package LCXMB.pojo;

import java.util.Date;

public class Orders {
    private Integer id;

    private String buyerName;

    private String salerName;

    private Integer proId;

    private Date createTime;

    private Integer addrId;

    private Integer buyerScore;

    private Integer salerScore;

    public Integer getBuyerScore() {
        return buyerScore;
    }

    public void setBuyer_score(Integer buyerScore) {
        this.buyerScore = buyerScore;
    }

    public Integer getSalerScore() {
        return salerScore;
    }

    public void setSalerScore(Integer salerScore) {
        this.salerScore = salerScore;
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

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}