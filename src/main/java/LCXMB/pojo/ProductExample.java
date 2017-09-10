package LCXMB.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProductExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andDesciptionIsNull() {
            addCriterion("desciption is null");
            return (Criteria) this;
        }

        public Criteria andDesciptionIsNotNull() {
            addCriterion("desciption is not null");
            return (Criteria) this;
        }

        public Criteria andDesciptionEqualTo(String value) {
            addCriterion("desciption =", value, "desciption");
            return (Criteria) this;
        }

        public Criteria andDesciptionNotEqualTo(String value) {
            addCriterion("desciption <>", value, "desciption");
            return (Criteria) this;
        }

        public Criteria andDesciptionGreaterThan(String value) {
            addCriterion("desciption >", value, "desciption");
            return (Criteria) this;
        }

        public Criteria andDesciptionGreaterThanOrEqualTo(String value) {
            addCriterion("desciption >=", value, "desciption");
            return (Criteria) this;
        }

        public Criteria andDesciptionLessThan(String value) {
            addCriterion("desciption <", value, "desciption");
            return (Criteria) this;
        }

        public Criteria andDesciptionLessThanOrEqualTo(String value) {
            addCriterion("desciption <=", value, "desciption");
            return (Criteria) this;
        }

        public Criteria andDesciptionLike(String value) {
            addCriterion("desciption like", value, "desciption");
            return (Criteria) this;
        }

        public Criteria andDesciptionNotLike(String value) {
            addCriterion("desciption not like", value, "desciption");
            return (Criteria) this;
        }

        public Criteria andDesciptionIn(List<String> values) {
            addCriterion("desciption in", values, "desciption");
            return (Criteria) this;
        }

        public Criteria andDesciptionNotIn(List<String> values) {
            addCriterion("desciption not in", values, "desciption");
            return (Criteria) this;
        }

        public Criteria andDesciptionBetween(String value1, String value2) {
            addCriterion("desciption between", value1, value2, "desciption");
            return (Criteria) this;
        }

        public Criteria andDesciptionNotBetween(String value1, String value2) {
            addCriterion("desciption not between", value1, value2, "desciption");
            return (Criteria) this;
        }

        public Criteria andSalerUserIsNull() {
            addCriterion("saler_user is null");
            return (Criteria) this;
        }

        public Criteria andSalerUserIsNotNull() {
            addCriterion("saler_user is not null");
            return (Criteria) this;
        }

        public Criteria andSalerUserEqualTo(String value) {
            addCriterion("saler_user =", value, "salerUser");
            return (Criteria) this;
        }

        public Criteria andSalerUserNotEqualTo(String value) {
            addCriterion("saler_user <>", value, "salerUser");
            return (Criteria) this;
        }

        public Criteria andSalerUserGreaterThan(String value) {
            addCriterion("saler_user >", value, "salerUser");
            return (Criteria) this;
        }

        public Criteria andSalerUserGreaterThanOrEqualTo(String value) {
            addCriterion("saler_user >=", value, "salerUser");
            return (Criteria) this;
        }

        public Criteria andSalerUserLessThan(String value) {
            addCriterion("saler_user <", value, "salerUser");
            return (Criteria) this;
        }

        public Criteria andSalerUserLessThanOrEqualTo(String value) {
            addCriterion("saler_user <=", value, "salerUser");
            return (Criteria) this;
        }

        public Criteria andSalerUserLike(String value) {
            addCriterion("saler_user like", value, "salerUser");
            return (Criteria) this;
        }

        public Criteria andSalerUserNotLike(String value) {
            addCriterion("saler_user not like", value, "salerUser");
            return (Criteria) this;
        }

        public Criteria andSalerUserIn(List<String> values) {
            addCriterion("saler_user in", values, "salerUser");
            return (Criteria) this;
        }

        public Criteria andSalerUserNotIn(List<String> values) {
            addCriterion("saler_user not in", values, "salerUser");
            return (Criteria) this;
        }

        public Criteria andSalerUserBetween(String value1, String value2) {
            addCriterion("saler_user between", value1, value2, "salerUser");
            return (Criteria) this;
        }

        public Criteria andSalerUserNotBetween(String value1, String value2) {
            addCriterion("saler_user not between", value1, value2, "salerUser");
            return (Criteria) this;
        }

        public Criteria andImgUrlsIsNull() {
            addCriterion("img_urls is null");
            return (Criteria) this;
        }

        public Criteria andImgUrlsIsNotNull() {
            addCriterion("img_urls is not null");
            return (Criteria) this;
        }

        public Criteria andImgUrlsEqualTo(String value) {
            addCriterion("img_urls =", value, "imgUrls");
            return (Criteria) this;
        }

        public Criteria andImgUrlsNotEqualTo(String value) {
            addCriterion("img_urls <>", value, "imgUrls");
            return (Criteria) this;
        }

        public Criteria andImgUrlsGreaterThan(String value) {
            addCriterion("img_urls >", value, "imgUrls");
            return (Criteria) this;
        }

        public Criteria andImgUrlsGreaterThanOrEqualTo(String value) {
            addCriterion("img_urls >=", value, "imgUrls");
            return (Criteria) this;
        }

        public Criteria andImgUrlsLessThan(String value) {
            addCriterion("img_urls <", value, "imgUrls");
            return (Criteria) this;
        }

        public Criteria andImgUrlsLessThanOrEqualTo(String value) {
            addCriterion("img_urls <=", value, "imgUrls");
            return (Criteria) this;
        }

        public Criteria andImgUrlsLike(String value) {
            addCriterion("img_urls like", value, "imgUrls");
            return (Criteria) this;
        }

        public Criteria andImgUrlsNotLike(String value) {
            addCriterion("img_urls not like", value, "imgUrls");
            return (Criteria) this;
        }

        public Criteria andImgUrlsIn(List<String> values) {
            addCriterion("img_urls in", values, "imgUrls");
            return (Criteria) this;
        }

        public Criteria andImgUrlsNotIn(List<String> values) {
            addCriterion("img_urls not in", values, "imgUrls");
            return (Criteria) this;
        }

        public Criteria andImgUrlsBetween(String value1, String value2) {
            addCriterion("img_urls between", value1, value2, "imgUrls");
            return (Criteria) this;
        }

        public Criteria andImgUrlsNotBetween(String value1, String value2) {
            addCriterion("img_urls not between", value1, value2, "imgUrls");
            return (Criteria) this;
        }

        public Criteria andPriceChangedIsNull() {
            addCriterion("price_changed is null");
            return (Criteria) this;
        }

        public Criteria andPriceChangedIsNotNull() {
            addCriterion("price_changed is not null");
            return (Criteria) this;
        }

        public Criteria andPriceChangedEqualTo(Integer value) {
            addCriterion("price_changed =", value, "priceChanged");
            return (Criteria) this;
        }

        public Criteria andPriceChangedNotEqualTo(Integer value) {
            addCriterion("price_changed <>", value, "priceChanged");
            return (Criteria) this;
        }

        public Criteria andPriceChangedGreaterThan(Integer value) {
            addCriterion("price_changed >", value, "priceChanged");
            return (Criteria) this;
        }

        public Criteria andPriceChangedGreaterThanOrEqualTo(Integer value) {
            addCriterion("price_changed >=", value, "priceChanged");
            return (Criteria) this;
        }

        public Criteria andPriceChangedLessThan(Integer value) {
            addCriterion("price_changed <", value, "priceChanged");
            return (Criteria) this;
        }

        public Criteria andPriceChangedLessThanOrEqualTo(Integer value) {
            addCriterion("price_changed <=", value, "priceChanged");
            return (Criteria) this;
        }

        public Criteria andPriceChangedIn(List<Integer> values) {
            addCriterion("price_changed in", values, "priceChanged");
            return (Criteria) this;
        }

        public Criteria andPriceChangedNotIn(List<Integer> values) {
            addCriterion("price_changed not in", values, "priceChanged");
            return (Criteria) this;
        }

        public Criteria andPriceChangedBetween(Integer value1, Integer value2) {
            addCriterion("price_changed between", value1, value2, "priceChanged");
            return (Criteria) this;
        }

        public Criteria andPriceChangedNotBetween(Integer value1, Integer value2) {
            addCriterion("price_changed not between", value1, value2, "priceChanged");
            return (Criteria) this;
        }

        public Criteria andPriceIsNull() {
            addCriterion("price is null");
            return (Criteria) this;
        }

        public Criteria andPriceIsNotNull() {
            addCriterion("price is not null");
            return (Criteria) this;
        }

        public Criteria andPriceEqualTo(Integer value) {
            addCriterion("price =", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotEqualTo(Integer value) {
            addCriterion("price <>", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThan(Integer value) {
            addCriterion("price >", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThanOrEqualTo(Integer value) {
            addCriterion("price >=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThan(Integer value) {
            addCriterion("price <", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThanOrEqualTo(Integer value) {
            addCriterion("price <=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceIn(List<Integer> values) {
            addCriterion("price in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotIn(List<Integer> values) {
            addCriterion("price not in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceBetween(Integer value1, Integer value2) {
            addCriterion("price between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotBetween(Integer value1, Integer value2) {
            addCriterion("price not between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andWatchCountIsNull() {
            addCriterion("watch_count is null");
            return (Criteria) this;
        }

        public Criteria andWatchCountIsNotNull() {
            addCriterion("watch_count is not null");
            return (Criteria) this;
        }

        public Criteria andWatchCountEqualTo(Integer value) {
            addCriterion("watch_count =", value, "watchCount");
            return (Criteria) this;
        }

        public Criteria andWatchCountNotEqualTo(Integer value) {
            addCriterion("watch_count <>", value, "watchCount");
            return (Criteria) this;
        }

        public Criteria andWatchCountGreaterThan(Integer value) {
            addCriterion("watch_count >", value, "watchCount");
            return (Criteria) this;
        }

        public Criteria andWatchCountGreaterThanOrEqualTo(Integer value) {
            addCriterion("watch_count >=", value, "watchCount");
            return (Criteria) this;
        }

        public Criteria andWatchCountLessThan(Integer value) {
            addCriterion("watch_count <", value, "watchCount");
            return (Criteria) this;
        }

        public Criteria andWatchCountLessThanOrEqualTo(Integer value) {
            addCriterion("watch_count <=", value, "watchCount");
            return (Criteria) this;
        }

        public Criteria andWatchCountIn(List<Integer> values) {
            addCriterion("watch_count in", values, "watchCount");
            return (Criteria) this;
        }

        public Criteria andWatchCountNotIn(List<Integer> values) {
            addCriterion("watch_count not in", values, "watchCount");
            return (Criteria) this;
        }

        public Criteria andWatchCountBetween(Integer value1, Integer value2) {
            addCriterion("watch_count between", value1, value2, "watchCount");
            return (Criteria) this;
        }

        public Criteria andWatchCountNotBetween(Integer value1, Integer value2) {
            addCriterion("watch_count not between", value1, value2, "watchCount");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNull() {
            addCriterion("update_time is null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNotNull() {
            addCriterion("update_time is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeEqualTo(Date value) {
            addCriterion("update_time =", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotEqualTo(Date value) {
            addCriterion("update_time <>", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThan(Date value) {
            addCriterion("update_time >", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("update_time >=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThan(Date value) {
            addCriterion("update_time <", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThanOrEqualTo(Date value) {
            addCriterion("update_time <=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIn(List<Date> values) {
            addCriterion("update_time in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotIn(List<Date> values) {
            addCriterion("update_time not in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeBetween(Date value1, Date value2) {
            addCriterion("update_time between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotBetween(Date value1, Date value2) {
            addCriterion("update_time not between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andTelNumIsNull() {
            addCriterion("tel_num is null");
            return (Criteria) this;
        }

        public Criteria andTelNumIsNotNull() {
            addCriterion("tel_num is not null");
            return (Criteria) this;
        }

        public Criteria andTelNumEqualTo(String value) {
            addCriterion("tel_num =", value, "telNum");
            return (Criteria) this;
        }

        public Criteria andTelNumNotEqualTo(String value) {
            addCriterion("tel_num <>", value, "telNum");
            return (Criteria) this;
        }

        public Criteria andTelNumGreaterThan(String value) {
            addCriterion("tel_num >", value, "telNum");
            return (Criteria) this;
        }

        public Criteria andTelNumGreaterThanOrEqualTo(String value) {
            addCriterion("tel_num >=", value, "telNum");
            return (Criteria) this;
        }

        public Criteria andTelNumLessThan(String value) {
            addCriterion("tel_num <", value, "telNum");
            return (Criteria) this;
        }

        public Criteria andTelNumLessThanOrEqualTo(String value) {
            addCriterion("tel_num <=", value, "telNum");
            return (Criteria) this;
        }

        public Criteria andTelNumLike(String value) {
            addCriterion("tel_num like", value, "telNum");
            return (Criteria) this;
        }

        public Criteria andTelNumNotLike(String value) {
            addCriterion("tel_num not like", value, "telNum");
            return (Criteria) this;
        }

        public Criteria andTelNumIn(List<String> values) {
            addCriterion("tel_num in", values, "telNum");
            return (Criteria) this;
        }

        public Criteria andTelNumNotIn(List<String> values) {
            addCriterion("tel_num not in", values, "telNum");
            return (Criteria) this;
        }

        public Criteria andTelNumBetween(String value1, String value2) {
            addCriterion("tel_num between", value1, value2, "telNum");
            return (Criteria) this;
        }

        public Criteria andTelNumNotBetween(String value1, String value2) {
            addCriterion("tel_num not between", value1, value2, "telNum");
            return (Criteria) this;
        }

        public Criteria andQualityIsNull() {
            addCriterion("quality is null");
            return (Criteria) this;
        }

        public Criteria andQualityIsNotNull() {
            addCriterion("quality is not null");
            return (Criteria) this;
        }

        public Criteria andQualityEqualTo(Integer value) {
            addCriterion("quality =", value, "quality");
            return (Criteria) this;
        }

        public Criteria andQualityNotEqualTo(Integer value) {
            addCriterion("quality <>", value, "quality");
            return (Criteria) this;
        }

        public Criteria andQualityGreaterThan(Integer value) {
            addCriterion("quality >", value, "quality");
            return (Criteria) this;
        }

        public Criteria andQualityGreaterThanOrEqualTo(Integer value) {
            addCriterion("quality >=", value, "quality");
            return (Criteria) this;
        }

        public Criteria andQualityLessThan(Integer value) {
            addCriterion("quality <", value, "quality");
            return (Criteria) this;
        }

        public Criteria andQualityLessThanOrEqualTo(Integer value) {
            addCriterion("quality <=", value, "quality");
            return (Criteria) this;
        }

        public Criteria andQualityIn(List<Integer> values) {
            addCriterion("quality in", values, "quality");
            return (Criteria) this;
        }

        public Criteria andQualityNotIn(List<Integer> values) {
            addCriterion("quality not in", values, "quality");
            return (Criteria) this;
        }

        public Criteria andQualityBetween(Integer value1, Integer value2) {
            addCriterion("quality between", value1, value2, "quality");
            return (Criteria) this;
        }

        public Criteria andQualityNotBetween(Integer value1, Integer value2) {
            addCriterion("quality not between", value1, value2, "quality");
            return (Criteria) this;
        }

        public Criteria andCategory1IsNull() {
            addCriterion("category_1 is null");
            return (Criteria) this;
        }

        public Criteria andCategory1IsNotNull() {
            addCriterion("category_1 is not null");
            return (Criteria) this;
        }

        public Criteria andCategory1EqualTo(String value) {
            addCriterion("category_1 =", value, "category1");
            return (Criteria) this;
        }

        public Criteria andCategory1NotEqualTo(String value) {
            addCriterion("category_1 <>", value, "category1");
            return (Criteria) this;
        }

        public Criteria andCategory1GreaterThan(String value) {
            addCriterion("category_1 >", value, "category1");
            return (Criteria) this;
        }

        public Criteria andCategory1GreaterThanOrEqualTo(String value) {
            addCriterion("category_1 >=", value, "category1");
            return (Criteria) this;
        }

        public Criteria andCategory1LessThan(String value) {
            addCriterion("category_1 <", value, "category1");
            return (Criteria) this;
        }

        public Criteria andCategory1LessThanOrEqualTo(String value) {
            addCriterion("category_1 <=", value, "category1");
            return (Criteria) this;
        }

        public Criteria andCategory1Like(String value) {
            addCriterion("category_1 like", value, "category1");
            return (Criteria) this;
        }

        public Criteria andCategory1NotLike(String value) {
            addCriterion("category_1 not like", value, "category1");
            return (Criteria) this;
        }

        public Criteria andCategory1In(List<String> values) {
            addCriterion("category_1 in", values, "category1");
            return (Criteria) this;
        }

        public Criteria andCategory1NotIn(List<String> values) {
            addCriterion("category_1 not in", values, "category1");
            return (Criteria) this;
        }

        public Criteria andCategory1Between(String value1, String value2) {
            addCriterion("category_1 between", value1, value2, "category1");
            return (Criteria) this;
        }

        public Criteria andCategory1NotBetween(String value1, String value2) {
            addCriterion("category_1 not between", value1, value2, "category1");
            return (Criteria) this;
        }

        public Criteria andCategory2IsNull() {
            addCriterion("category_2 is null");
            return (Criteria) this;
        }

        public Criteria andCategory2IsNotNull() {
            addCriterion("category_2 is not null");
            return (Criteria) this;
        }

        public Criteria andCategory2EqualTo(String value) {
            addCriterion("category_2 =", value, "category2");
            return (Criteria) this;
        }

        public Criteria andCategory2NotEqualTo(String value) {
            addCriterion("category_2 <>", value, "category2");
            return (Criteria) this;
        }

        public Criteria andCategory2GreaterThan(String value) {
            addCriterion("category_2 >", value, "category2");
            return (Criteria) this;
        }

        public Criteria andCategory2GreaterThanOrEqualTo(String value) {
            addCriterion("category_2 >=", value, "category2");
            return (Criteria) this;
        }

        public Criteria andCategory2LessThan(String value) {
            addCriterion("category_2 <", value, "category2");
            return (Criteria) this;
        }

        public Criteria andCategory2LessThanOrEqualTo(String value) {
            addCriterion("category_2 <=", value, "category2");
            return (Criteria) this;
        }

        public Criteria andCategory2Like(String value) {
            addCriterion("category_2 like", value, "category2");
            return (Criteria) this;
        }

        public Criteria andCategory2NotLike(String value) {
            addCriterion("category_2 not like", value, "category2");
            return (Criteria) this;
        }

        public Criteria andCategory2In(List<String> values) {
            addCriterion("category_2 in", values, "category2");
            return (Criteria) this;
        }

        public Criteria andCategory2NotIn(List<String> values) {
            addCriterion("category_2 not in", values, "category2");
            return (Criteria) this;
        }

        public Criteria andCategory2Between(String value1, String value2) {
            addCriterion("category_2 between", value1, value2, "category2");
            return (Criteria) this;
        }

        public Criteria andCategory2NotBetween(String value1, String value2) {
            addCriterion("category_2 not between", value1, value2, "category2");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}