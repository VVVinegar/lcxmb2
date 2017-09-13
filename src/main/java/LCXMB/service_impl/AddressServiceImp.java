package LCXMB.service_impl;

import LCXMB.dao.Shipping_addressMapper;
import LCXMB.pojo.Shipping_address;
import LCXMB.service.AddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("AddressService")
public class AddressServiceImp implements AddressService {
    @Resource
    Shipping_addressMapper shippingAddressMapper;

    public List<Shipping_address> findByUser(String username) {
        return null;
    }

    public Shipping_address findById(int id) {
        return shippingAddressMapper.selectByPrimaryKey(id);
    }

    public int insert(Shipping_address address) {
        return 0;
    }
}
