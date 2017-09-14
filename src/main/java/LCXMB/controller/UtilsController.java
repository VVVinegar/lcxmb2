package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.pojo.Shipping_address;
import LCXMB.pojo.User_info;
import LCXMB.service.AddressService;
import LCXMB.service.QiNiuImageStyleService;
import LCXMB.service.UploadService;
import LCXMB.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
@Controller
@RequestMapping("/utils")
public class UtilsController {

    @Resource
    UploadService uploadService;

    @Resource
    QiNiuImageStyleService qiNiuImageStyleService;

    @Resource
    UserService userService;

    @Resource
    AddressService addressService;

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public Msg Upload(@RequestParam("file") MultipartFile file,
                      @RequestParam String width,
                      HttpServletRequest request) throws IOException {

        // 获得原始文件名
        String fileOriginalName = file.getOriginalFilename();
        String fileExt = fileOriginalName.substring(fileOriginalName.lastIndexOf(".") + 1);
        String fileName = UUID.randomUUID().toString().replaceAll("-", "") + "." + fileExt;

        // 获得项目的路径
        ServletContext sc = request.getSession().getServletContext();

        // 设定文件保存的目录
        String realPath = sc.getRealPath("/static/imgUpload") + '/';

        String localFilePath = uploadService.uploadToLocal(file, realPath, fileName);

        //上传至七牛
        String QiNiuKey = uploadService.uploadToQINiu(localFilePath, fileName);

        // 完成上传至七牛云后删除本地文件
        File uploadImg = new File(localFilePath);
        if (uploadImg.exists() && uploadImg.isFile()) {
            uploadImg.delete();
        }

        width = width == null ? "200" : width;

        String imageUrl = qiNiuImageStyleService.getImageUrl(width, QiNiuKey);

        return Msg.success("上传成功").add("imageUrl", imageUrl);
    }

    @RequestMapping(value = "/updateAvatar", method = RequestMethod.POST)
    @ResponseBody
    public Msg updateAvatar(String url, HttpSession session){

        String username = session.getAttribute("username").toString();

        User_info user_info = new User_info();
        user_info.setUsername(username);
        user_info.setAvatarUrl(url);

        if (userService.updateByPrimaryKeySelective(user_info)>0)
            return Msg.success("修改成功").add("status",0);

        return Msg.fail("服务器错误");
    }

    @RequestMapping(value = "/listAddress", method = RequestMethod.POST)
    @ResponseBody
    public Msg listAddress(HttpSession session){
        String username = session.getAttribute("username").toString();
        List<Shipping_address> addresses = addressService.findByUser(username);
        return Msg.success("查询成功").add("addresses", addresses);
    }

    @RequestMapping(value = "/addAddress", method = RequestMethod.POST)
    @ResponseBody
    public Msg addAddress(HttpSession session, String address, String tel){
        Shipping_address shipping_address = new Shipping_address();
        shipping_address.setUsername(session.getAttribute("username").toString());
        shipping_address.setAddress(address);

        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());

        shipping_address.setUpdateTime(timeStamp);
        shipping_address.setTel(tel);

        if (addressService.insert(shipping_address)>0) return Msg.success("新增成功").add("status",0);
        return Msg.fail("服务器错误");
    }

    @RequestMapping(value = "/defaultAddress", method = RequestMethod.POST)
    @ResponseBody
    public Msg defaultAddress(HttpSession session, Integer defaultAddress){
        Object username = session.getAttribute("username");
        if (username == null) {
            return Msg.fail("您还未登录，请先登录");
        } else {
            User_info user_info = new User_info();
            user_info.setUsername(username.toString());
            user_info.setDefaultAddress(defaultAddress);
            if (userService.updateByPrimaryKeySelective(user_info)>1)
                return Msg.success("已更新").add("status",0);
            return Msg.fail("服务器错误");
        }
    }
}
