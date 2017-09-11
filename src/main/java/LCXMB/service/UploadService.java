package LCXMB.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by 759517209@qq.com on 2017/9/11.
 */
public interface UploadService {
    public String uploadToLocal(MultipartFile file, String path, String fileName);
    public String uploadToQINiu(String localFilePath,String fileName);
}