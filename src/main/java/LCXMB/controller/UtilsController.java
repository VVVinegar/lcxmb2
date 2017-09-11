package LCXMB.controller;

import LCXMB.pojo.Msg;
import LCXMB.service.QiNiuImageStyleService;
import LCXMB.service.UploadService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

/**
 * Created by 759517209@qq.com on 2017/9/10.
 */
@Controller
@RequestMapping("/utils")
public class UtilsController {

    @Resource
    UploadService uploadService;
    QiNiuImageStyleService qiNiuImageStyleService;

    @RequestMapping(value = "/upload/{width}", method = RequestMethod.POST)
    @ResponseBody
    public Msg Upload(@RequestParam("file") MultipartFile file, HttpServletRequest request, @PathVariable String width) throws IOException {

        // 获得原始文件名
        String fileOriginalName = file.getOriginalFilename();
        String fileExt = fileOriginalName.substring(fileOriginalName.lastIndexOf(".")+1);
        String fileName =  UUID.randomUUID().toString().replaceAll("-", "") + "." + fileExt;
        System.out.println("原始文件名:" + fileName);

        // 获得项目的路径
        ServletContext sc = request.getSession().getServletContext();
        // 上传位置
        String realPath = sc.getRealPath("/static/imgUpload") + '/'; // 设定文件保存的目录

        String localFilePath = uploadService.uploadToLocal(file, realPath, fileName);
        //上传至骑七牛
        String QiNiuKey = uploadService.uploadToQINiu(localFilePath, fileName);

        width = width == null ? "200" : width;

        String imageUrl = qiNiuImageStyleService.getImageUrl(width, QiNiuKey);

        return Msg.success("hello").add("imageUrl", imageUrl);
    }
}
