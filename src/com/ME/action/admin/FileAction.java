package com.ME.action.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.ME.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 
 * @author Administrator
 * 这个类是用于文件的上传下载使用
 *
 */

public class FileAction extends ActionSupport {
	
	//跟表单提交的input type = file 的name 保持一致
    private File picFile;
    
    //文件名称 (myFile+myFileFileName)固定格式
    private String picFileFileName;
    
    //文件类型 myFile+"ContentType"固定格式
    private String picFileContentType;
    
    private String id;

	public File getPicFile() {
		return picFile;
	}
	public void setPicFile(File picFile) {
		this.picFile = picFile;
	}
	public String getPicFileFileName() {
		return picFileFileName;
	}
	public void setPicFileFileName(String picFileName) {
		this.picFileFileName = picFileName;
	}
	public String getPicFileContentType() {
		return picFileContentType;
	}
	public void setPicFileContentType(String picFileContentType) {
		this.picFileContentType = picFileContentType;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String execute() {
		int isAddDianying = 0;
		if(this.getId() == null || this.getId().equals("")) {
			System.out.println("这是在添加电影的使用的操作！");
			DateUtil dateUtil = new DateUtil();
			String dianyignid = dateUtil.getRandomStr() + dateUtil.getDateStr();
			this.setId(dianyignid);
			isAddDianying = 1;
		}
		//目前的解决方案是把目标文件上传到项目uploud目录再进行执行。  
        // 设置上传文件目录    
       HttpServletRequest request=ServletActionContext.getRequest();                     
       String uploadPath = request.getRealPath("/") + "moviePic";  
       System.out.println(uploadPath+"============"+this.getId());
       //基于myFile创建一个文件输入流    
       String realPath = ""; 
       InputStream is;  
       try {  
           is = new FileInputStream(this.getPicFile());  
        
       // 设置目标文件    
       File toFile = new File(uploadPath, this.getId()+".jpg");   
       realPath = "/M&E/moviePic/"+this.getId()+".jpg";
       //System.out.println(toFile.getAbsolutePath()+"================================");
       toFile.createNewFile();   
       // 创建一个输出流    
       OutputStream os;  
       os = new FileOutputStream(toFile);          
       //设置缓存    
       byte[] buffer = new byte[1024];             
       int length = 0;             
       //读取myFile文件输出到toFile文件中              
           while ((length = is.read(buffer)) > 0) {    
               os.write(buffer, 0, length);    
           }  
           is.close();                    
           //关闭输出流                   
           os.close();  
       } catch (IOException e2) {  
           e2.printStackTrace();  
       }
	    if(isAddDianying == 1) {
	    	HttpServletResponse response = ServletActionContext.getResponse();
	        response.setContentType("text/html;charset=utf-8");
	        PrintWriter pw;
	 	 	try {
	 	 		pw = response.getWriter();
	 	 		pw.write(this.getId());
	 	 	    pw.flush();
	 	 	    pw.close();
	 	 	} catch (IOException e) {
	 	 		// TODO Auto-generated catch block
	 	 		e.printStackTrace();
	 	 	}
	    }else {
	    	HttpServletResponse response = ServletActionContext.getResponse();
	        response.setContentType("text/html;charset=utf-8");
	        PrintWriter pw;
	 	 	try {
	 	 		pw = response.getWriter();
	 	 		pw.write("isUpdateDianying");
	 	 	    pw.flush();
	 	 	    pw.close();
	 	 	} catch (IOException e) {
	 	 		// TODO Auto-generated catch block
	 	 		e.printStackTrace();
	 	 	}
	    }
       
       return "success";
	}

}
