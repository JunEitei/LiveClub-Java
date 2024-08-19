package com.kitamura.club.controller;

import com.kitamura.system.api.domain.SysImageFile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.kitamura.common.core.domain.R;
import com.kitamura.common.core.utils.file.FileUtils;
import com.kitamura.club.service.MinioService;
import com.kitamura.system.api.domain.SysFile;

import java.util.LinkedList;
import java.util.List;

/**
 * 文件请求处理
 *
 * @author damao
 */
@RestController
public class MinioController
{

    private static final Logger log = LoggerFactory.getLogger(MinioController.class);

    @Autowired
    private MinioService sysFileService;

    /**
     * 文件上传请求
     */
    @PostMapping("upload")
    public R<SysFile> upload(MultipartFile file) {
        try {
            // 上传并返回访问地址
            String url = sysFileService.uploadFile(file);
            SysFile sysFile = new SysFile();
            sysFile.setName(FileUtils.getName(url));
            sysFile.setUrl(url);
            return R.ok(sysFile);
        } catch (Exception e) {
            log.error("上传文件失败", e);
            return R.fail(e.getMessage());
        }
    }

    // 批量上传
    @PostMapping("upload-multiple")
    public R<SysImageFile> bacthFileUpload(MultipartFile[] file) {
        try {
            List<String> images= new LinkedList<>();
            SysImageFile sysFile = new SysImageFile();
            sysFile.setImage_type("url");//暂定写死url类型，后续可能增加base64
            if (file.length>20){
                return R.fail("单次上传图片不能超过20张,请尝试分批上传");
            }
            // 上传并返回访问地址
            for (MultipartFile multipartFile : file) {
                String filename = multipartFile.getOriginalFilename();
                if (checkFile(filename)) {
                    String url = sysFileService.uploadFile(multipartFile);
                    images.add(url);
                }else{
                    throw new Exception("上传必须为图片类型png/jpg/jpge");
                }
            }
            sysFile.setImages(images);
            return R.ok(sysFile);
        } catch (Exception e) {
            log.error("上传文件失败", e);
            return R.fail(e.getMessage());
        }
    }

    /**
     * 多文件文件上传请求
     * 预留接口暂未使用
     */
    public R<List<SysFile>> moreFileUpload(MultipartFile[] file) {
        try {
            List<SysFile> sysFileList=new LinkedList<>();
            // 上传并返回访问地址
            for (MultipartFile multipartFile : file) {
                String url = sysFileService.uploadFile(multipartFile);
                SysFile sysFile = new SysFile();
                sysFile.setName(FileUtils.getName(url));
                sysFile.setUrl(url);
                sysFileList.add(sysFile);
            }
            return R.ok(sysFileList);
        } catch (Exception e) {
            log.error("上传文件失败", e);
            return R.fail(e.getMessage());
        }
    }
    /**
     * 判断是否为允许的上传文件类型,true表示允许
     */
    private boolean checkFile(String fileName) {
        //设置允许上传文件类型'png','PNG','JPG','JPGE','jpge','jpg'
        String suffixList = "png,PNG,JPG,JPGE,jpge,jpg";
        // 获取文件后缀
        String suffix = fileName.substring(fileName.lastIndexOf(".")
                + 1, fileName.length());
        if (suffixList.contains(suffix.trim().toLowerCase())) {
            return true;
        }
        return false;
    }

    /**
     * 判断是否为允许的上传文件类型,true表示允许
     */
    private boolean checkFileIsVideo(String fileName) {
        //设置允许上传文件类型'png','PNG','JPG','JPGE','jpge','jpg'
        String suffixList = "flv,mp4,wmv,avi,3gp,FLV,MP4,WMV,AVI,3GP";
        // 获取文件后缀
        String suffix = fileName.substring(fileName.lastIndexOf(".")
                + 1, fileName.length());
        if (suffixList.contains(suffix.trim().toLowerCase())) {
            return true;
        }
        return false;
    }

}