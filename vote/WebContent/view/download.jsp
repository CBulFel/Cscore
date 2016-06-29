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
      //å…³äºŽæ–‡ä»¶ä¸‹è½½æ—¶é‡‡ç”¨æ–‡ä»¶æµè¾“å‡ºçš„æ–¹å¼å¤„ç†ï¼š  
      //åŠ ä¸Šresponse.reset()ï¼Œå¹¶ä¸”æ‰€æœ‰çš„ï¼…>åŽé¢ä¸è¦æ¢è¡Œï¼ŒåŒ…æ‹¬æœ€åŽä¸€ä¸ªï¼›  
      String title=(String)session.getAttribute("atitle");
      response.reset();//å¯ä»¥åŠ ä¹Ÿå¯ä»¥ä¸åŠ   
      response.setContentType("application/x-download");  
      
    //application.getRealPath("/main/mvplayer/CapSetup.msi");èŽ·å–çš„ç‰©ç†è·¯å¾„  
=======
      //¹ØÓÚÎÄ¼þÏÂÔØÊ±²ÉÓÃÎÄ¼þÁ÷Êä³öµÄ·½Ê½´¦Àí£º  
      //¼ÓÉÏresponse.reset()£¬²¢ÇÒËùÓÐµÄ£¥>ºóÃæ²»Òª»»ÐÐ£¬°üÀ¨×îºóÒ»¸ö£»  
      String title=(String)session.getAttribute("atitle");
      response.reset();//¿ÉÒÔ¼ÓÒ²¿ÉÒÔ²»¼Ó  
      response.setContentType("application/x-download");  
      
    //application.getRealPath("/main/mvplayer/CapSetup.msi");»ñÈ¡µÄÎïÀíÂ·¾¶  
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
    //è¦åŠ ä»¥ä¸‹ä¸¤å¥è¯ï¼Œå¦åˆ™ä¼šæŠ¥é”™  
=======
    //Òª¼ÓÒÔÏÂÁ½¾ä»°£¬·ñÔò»á±¨´í  
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
    //è¿™é‡Œä¸èƒ½å…³é—­    
=======
    //ÕâÀï²»ÄÜ¹Ø±Õ    
>>>>>>> ad2949df4407e55e49a25643eb7414ee04470278
    //if(outp != null)  
      //{  
      //outp.close();  
      //outp = null;  
      //}  
      }  
    %>  