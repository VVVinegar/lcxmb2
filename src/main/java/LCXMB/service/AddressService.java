package LCXMB.service;

import LCXMB.pojo.Shipping_address;

import java.util.List;

public interface AddressService {

    public List<Shipping_address> findByUser(String username);

    public Shipping_address findById(int id);

    public int insert(Shipping_address address);

}
