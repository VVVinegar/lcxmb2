package LCXMB.pojo;

import java.util.Date;

/**
 * Created by 759517209@qq.com on 2017/9/14.
 */
public class SearchProducts {
    private Integer id;

    private String title;

    private String desciption;

    private String salerUser;

    private String imgUrls;

    private Float priceChanged;

    private Float price;

    private Integer watchCount;

    private Integer status;

    private Date createTime;

    private Date updateTime;

    private String telNum;

    private Float quality;

    private String category1;

    private String category2;

    private String avatarUrl;

    private int productNumber;

    public int getProductNumber() {
        return productNumber;
    }

    public void setProductNumber(int productNumber) {
        this.productNumber = productNumber;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDesciption() {
        return desciption;
    }

    public void setDesciption(String desciption) {
        this.desciption = desciption == null ? null : desciption.trim();
    }

    public String getSalerUser() {
        return salerUser;
    }

    public void setSalerUser(String salerUser) {
        this.salerUser = salerUser == null ? null : salerUser.trim();
    }

    public String getImgUrls() {
        return imgUrls;
    }

    public void setImgUrls(String imgUrls) {
        this.imgUrls = imgUrls == null ? null : imgUrls.trim();
    }

    public Float getPriceChanged() {
        return priceChanged;
    }

    public void setPriceChanged(Float priceChanged) {
        this.priceChanged = priceChanged;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getWatchCount() {
        return watchCount;
    }

    public void setWatchCount(Integer watchCount) {
        this.watchCount = watchCount;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getTelNum() {
        return telNum;
    }

    public void setTelNum(String telNum) {
        this.telNum = telNum == null ? null : telNum.trim();
    }

    public Float getQuality() {
        return quality;
    }

    public void setQuality(Float quality) {
        this.quality = quality;
    }

    public String getCategory1() {
        return category1;
    }

    public void setCategory1(String category1) {
        this.category1 = category1 == null ? null : category1.trim();
    }

    public String getCategory2() {
        return category2;
    }

    public void setCategory2(String category2) {
        this.category2 = category2 == null ? null : category2.trim();
    }
}
