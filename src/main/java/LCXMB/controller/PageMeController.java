package LCXMB.controller;

import LCXMB.dao.ProductMapper;
import LCXMB.pojo.OrderAndProducts;
import LCXMB.pojo.User_info;
import LCXMB.service.AddressService;
import LCXMB.service.CollectionService;
import LCXMB.service.OrdersService;
import LCXMB.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
@Controller
@RequestMapping("")
public class PageMeController {

    @Resource
    UserService userService;
    @Resource
    ProductMapper productMapper;
    @Resource
    AddressService addressService;
    @Resource
    CollectionService collectionService;
    @Resource
    OrdersService ordersService;

    public User_info getUserinfo(String username){
        return userService.findById(username);
    }

    @RequestMapping(value = "/me")
    public String index(){
        return "redirect:/me/product";
    }

    @RequestMapping(value = "/me/product")
    public String product(HttpSession httpSession, ModelMap model){
        Object username = httpSession.getAttribute("username");
        if(username != null) {
            User_info user = getUserinfo(username.toString());
            int addressId = user.getDefaultAddress();
            model.addAttribute("address", addressService.findById(addressId));
            model.addAttribute("user", user);
        } else {
            return "/login";
        }

        List products = productMapper.PageMeShowed(username.toString());

        model.addAttribute("subsite", "product");
        model.addAttribute("products", products);

        return "/me";
    }

    @RequestMapping(value = "/me/order")
    public String order(HttpSession httpSession, ModelMap model){
        Object username = httpSession.getAttribute("username");
        if(username != null) {
            User_info user = getUserinfo(username.toString());
            int addressId = user.getDefaultAddress();
            model.addAttribute("address", addressService.findById(addressId));
            model.addAttribute("user", user);
        } else {
            return "/login";
        }

        List<OrderAndProducts> orders = ordersService.selectOrderAndProductsByUsername(username.toString());

        model.addAttribute("orders", orders);
        model.addAttribute("subsite", "order");

        return "/me";
    }

    @RequestMapping(value = "/me/message")
    public String message(HttpSession httpSession, ModelMap model){
        Object username = httpSession.getAttribute("username");
        if(username != null) {
            model.addAttribute("user", getUserinfo(username.toString()));
        } else {
            return "/login";
        }

        model.addAttribute("subsite", "message");

        return "/me";
    }

    @RequestMapping(value = "/me/collect")
    public String collect(HttpSession httpSession, ModelMap model){
        Object username = httpSession.getAttribute("username");
        if(username != null) {
            User_info user = getUserinfo(username.toString());
            int addressId = user.getDefaultAddress();
            model.addAttribute("address", addressService.findById(addressId));
            model.addAttribute("user", user);
        } else {
            return "/login";
        }

        List collections = collectionService.findProductsByUser(username.toString());
        
        model.addAttribute("subsite", "collect");
        model.addAttribute("collections", collections);

        return "/me";
    }
}
