package LCXMB.pojo;

public class PageMeProducts {
    private int id;
    private String title;
    private String imgUrls;
    private int price;
    private int commentsNum;

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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCommentsNum() {
        return commentsNum;
    }

    public void setCommentsNum(int commentNum) {
        this.commentsNum = commentNum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
