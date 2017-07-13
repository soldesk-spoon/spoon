package com.my.shop;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.view.AbstractView;

@Component
public class MultipartResolver {
    String fileName = "";
    
//  ������Ʈ �� ������ ��ο� ������ �����ϴ� �޼ҵ�
//  DB���� ���ε�� ��ü ��θ����θ� �����Ǳ� ������(���ε��� ���� ��ü�� ��ο� �����)
//  fileUpload() �޼ҵ忡�� ��ü ��θ� ���Ϲ޾� DB�� ��� �״�� ����   
    public String fileUpload(MultipartHttpServletRequest request,
                                        MultipartFile uploadFile, Object obj) {
        String path = "";
        String fileName = "";
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        try {
            fileName = uploadFile.getOriginalFilename();
            byte[] bytes = uploadFile.getBytes();
            path = getSaveLocation(request, obj);
            
            System.out.println("UtilFile fileUpload fileName : " + fileName);
            System.out.println("UtilFile fileUpload uploadPath : " + path);
            
            File file = new File(path);
            
//          ���ϸ��� �ߺ����� ������ ���
            if (fileName != null && !fileName.equals("")) {
                if (file.exists()) {
//                    ���ϸ� �տ� ���ε� �ð� �ʴ����� �ٿ� ���ϸ� �ߺ��� ����
                    fileName = System.currentTimeMillis() + "_" + fileName;
                    
                    file = new File(path + fileName);
                }
            }
            
            System.out.println("UtilFile fileUpload final fileName : " + fileName);
            System.out.println("UtilFile fileUpload file : " + file);
            
            out = new FileOutputStream(file);
            
            System.out.println("UtilFile fileUpload out : " + out);
            
            out.write(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
        return path + fileName;
    }
    
//  ���ε� ���� ���� ��� ��� �޼ҵ�
//  ���ε��� ������ ��ΰ� ������ ���� �޶�� �߱� ������ �������� ���� ���Ͽ� ���� ���� ���θ� �ٸ��� ������
    private String getSaveLocation(MultipartHttpServletRequest request, Object obj) {
        
        String uploadPath = request.getSession().getServletContext().getRealPath("/");
        String attachPath = "resources/files/";
        /*
//      Reward�� ���
        if (obj instanceof Reward) {
            attachPath += "reward/";
//      Approval�� ���
        } else if(obj instanceof Draft) {
            attachPath += "approval/";
//      Document�� ���            
        }*/       
        
        attachPath += "document/";
        
        
        System.out.println("UtilFile getSaveLocation path : " + uploadPath + attachPath);
        
        return uploadPath + attachPath;
    }
}


