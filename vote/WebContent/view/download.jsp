<<<<<<< HEAD
<%@page language="java" contentType="application/x-msdownload" pageEncoding="UTF-8"%> 
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Date"%>
=======
<%@page language="java" contentType="application/x-msdownload" pageEncoding="gb2312"%> 
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Date;"%>
>>>>>>> ad2949df4407e55e49a25643eb7414ee04470278




    <%  
<<<<<<< HEAD
      //关于文件下载时采用文件流输出的方式处理：  
      //加上response.reset()，并且所有的％>后面不要换行，包括最后一个；  
      String title=(String)session.getAttribute("atitle");
      response.reset();//可以加也可以不加  
      response.setContentType("application/x-download");  
      
    //application.getRealPath("/main/mvplayer/CapSetup.msi");获取的物理路径  
=======
      //�����ļ�����ʱ�����ļ�������ķ�ʽ����  
      //����response.reset()���������еģ�>���治Ҫ���У��������һ����  
      String title=(String)session.getAttribute("atitle");
      response.reset();//���Լ�Ҳ���Բ���  
      response.setContentType("application/x-download");  
      
    //application.getRealPath("/main/mvplayer/CapSetup.msi");��ȡ������·��  
>>>>>>> ad2949df4407e55e49a25643eb7414ee04470278
      Date d=new Date(); 
    String filedownload = "D:\\testprint\\"+title+".xls";  
     String filedisplay = d+".xls";  
      URLEncoder.encode(filedisplay,"UTF-8"); 
      
      response.addHeader("Content-Disposition","attachment;filename=" + filedisplay);  
      
      java.io.OutputStream outp = null;  
      java.io.FileInputStream in = null;  
      try  
      {  
      outp = response.getOutputStream();  
      in = new FileInputStream(filedownload);  
      
      byte[] b = new byte[1024];  
      int i = 0;  
      
      while((i = in.read(b)) > 0)  
      {  
      outp.write(b, 0, i);  
      }  
    //    
    outp.flush();  
<<<<<<< HEAD
    //要加以下两句话，否则会报错  
=======
    //Ҫ���������仰������ᱨ��  
>>>>>>> ad2949df4407e55e49a25643eb7414ee04470278
    //java.lang.IllegalStateException: getOutputStream() has already been called for //this response    
    out.clear();  
    out = pageContext.pushBody();  
    }  
      catch(Exception e)  
      {  
      System.out.println("Error!");  
      e.printStackTrace();  
      }  
      finally  
      {  
      if(in != null)  
      {  
      in.close();  
      in = null;  
      }  
<<<<<<< HEAD
    //这里不能关闭    
=======
    //���ﲻ�ܹر�    
>>>>>>> ad2949df4407e55e49a25643eb7414ee04470278
    //if(outp != null)  
      //{  
      //outp.close();  
      //outp = null;  
      //}  
      }  
    %>  