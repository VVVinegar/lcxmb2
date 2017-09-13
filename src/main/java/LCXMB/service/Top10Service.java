package LCXMB.service;

import LCXMB.pojo.Product;

import java.util.List;

public interface Top10Service {
    public List<Product> getNewProducts();
    public List<Product> getHotProducts();
    public List<Product> getDescProducts();
}
