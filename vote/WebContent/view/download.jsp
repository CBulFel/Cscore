<%@page language="java" contentType="application/x-msdownload" pageEncoding="gb2312"%> 
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.FileDescriptor"%>




    <%  
      //�����ļ�����ʱ�����ļ�������ķ�ʽ����  
      //����response.reset()���������еģ�>���治Ҫ���У��������һ����  
      String title=(String)session.getAttribute("atitle");
      response.reset();//���Լ�Ҳ���Բ���  
      response.setContentType("application/x-download");  
      
    //application.getRealPath("/main/mvplayer/CapSetup.msi");��ȡ������·��  
    Date d=new Date(); 
    String filedownload = "D:\\testprint\\"+title+".xls";  
    String filedisplay = d+".xls";  
    FileDescriptor fd = null;
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
    //Ҫ���������仰������ᱨ��  
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
    //���ﲻ�ܹر�    
    //if(outp != null)  
      //{  
      //outp.close();  
      //outp = null;  
      //}  
      } 
    %>  