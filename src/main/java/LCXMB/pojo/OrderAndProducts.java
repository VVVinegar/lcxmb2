package LCXMB.pojo;

import java.util.Date;

public class OrderAndProducts {
    private Integer id;

    private String buyerName;

    private String salerName;

    private Integer proId;

    private Date createTime;

    private Integer addrId;

    private Integer buyerScore;

    private Integer salerScore;

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
        this.buyerName = buyerName;
    }

    public String getSalerName() {
        return salerName;
    }

    public void setSalerName(String salerName) {
        this.salerName = salerName;
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

    public Integer getAddrId() {
        return addrId;
    }

    public void setAddrId(Integer addrId) {
        this.addrId = addrId;
    }

    public Integer getBuyerScore() {
        return buyerScore;
    }

    public void setBuyerScore(Integer buyerScore) {
        this.buyerScore = buyerScore;
    }

    public Integer getSalerScore() {
        return salerScore;
    }

    public void setSalerScore(Integer salerScore) {
        this.salerScore = salerScore;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImgUrls() {
        return imgUrls;
    }

    public void setImgUrls(String imgUrls) {
        this.imgUrls = imgUrls;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    private String title;

    private String imgUrls;

    private Float price;

    private Integer status;


}
