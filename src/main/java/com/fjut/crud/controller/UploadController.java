package com.fjut.crud.controller;


import com.fjut.crud.bean.BaseVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.UUID;

/**
 * @auther: raoyu
 * @Title:
 * @Description:
 * @Date: 2019/4/22 14:49
 * @param:
 * @return:
 * @throws:
 */
@RestController
public class UploadController {

        @RequestMapping("/execUploadss")
        public BaseVo execUpload(MultipartFile file , String fileName, HttpServletRequest request) throws IOException {
        BaseVo vo = new BaseVo();

        String oFileName = file.getOriginalFilename();

       //获取文件类型
        String fileType =oFileName.substring(oFileName.lastIndexOf("."),oFileName.length());

        /**
         * 获取项目webapp目录下的upload的路径
         * E:\IdeaProjects\SSM\src\main\webapp\statics
         */
        //String prePath  = request.getSession().getServletContext().getRealPath("statics");
        String prePath  ="D:\\IdeaProjects\\SSM\\src\\main\\webapp\\statics";
        System.out.println("prePath:" + prePath);

        /**
         * 上传保存后新的文件名称
         */
        String newFileName = UUID.randomUUID().toString() + fileType;
        System.out.println("newFileName:" + newFileName);
        /**
         * 复制流,或者，IOUtils.copy(input, output);
         */
        InputStream inputStream = file.getInputStream();
        File newFile = new File(prePath + File.separator + newFileName);
        OutputStream outputStream = new FileOutputStream(newFile);
        byte[] b = new byte[inputStream.available()] ;
        inputStream.read(b);
        outputStream.write(b);
        inputStream.close();
        outputStream.close();
        System.out.println("upload e ...");
        vo.setPath(newFileName);
        return vo;
   }
}
