package poly.util;

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

 
// @Component > @Service
//              : 스프링 프레임워크가 관리하는 컴포넌트의 일반적 타입 
//              : 개발자가 직접 조작이 가능한 클래스의 경우 해당 어노테이션을 붙임
//              : ( <=> @Bean : 개발자가 조작이 불가능한 외부 라이브러리를 Bean으로 등록시 사용)
@Component
public class UtilFile {
    String fileName = "";
    
//  프로젝트 내 지정된 경로에 파일을 저장하는 메소드
//  DB에는 업로드된 전체 경로명으로만 지정되기 때문에(업로드한 파일 자체는 경로에 저장됨)
//  fileUpload() 메소드에서 전체 경로를 리턴받아 DB에 경로 그대로 저장   
    public String fileUpload(MultipartHttpServletRequest request,
                                        MultipartFile uploadFile) {
        String path = "";
        String fileName = "";
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        try {
            fileName = uploadFile.getOriginalFilename();
            byte[] bytes = uploadFile.getBytes();
            path = getSaveLocation(request);
            
            System.out.println("UtilFile fileUpload fileName : " + fileName);
            System.out.println("UtilFile fileUpload uploadPath : " + path);
            
            File file = new File(path);
            
//          파일명이 중복으로 존재할 경우
            if (fileName != null && !fileName.equals("")) {
                if (file.exists()) {
//                    파일명 앞에 업로드 시간 초단위로 붙여 파일명 중복을 방지
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
        
        return "/stu_photo/" + fileName;
    }
    
//  업로드 파일 저장 경로 얻는 메소드
    
//  업로드한 파일의 경로가 도메인 별로 달라야 했기 때문에 도메인의 형을 비교하여 파일 저장 정로를 다르게 지정함
    private String getSaveLocation(MultipartHttpServletRequest request) {
        
        String uploadPath = request.getSession().getServletContext().getRealPath("/");
        String attachPath = "stu_photo/";
        
        System.out.println("UtilFile getSaveLocation path : " + uploadPath + attachPath);
        
        return uploadPath + attachPath;
    }
}
