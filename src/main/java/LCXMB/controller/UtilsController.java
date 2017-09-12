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
import java.io.IOException;
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
}
