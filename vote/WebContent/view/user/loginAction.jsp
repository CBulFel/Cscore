<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.vote.service.*"%>
<%@page import="com.vote.bean.*"%>
<%

 String username = request.getParameter("username");
 String password = request.getParameter("password");
 String radioFlag= request.getParameter("radioFlag");//标记是否为管理员
 
 System.out.println("radioFlag="+radioFlag);
 AdminService as=new AdminService();
 AdminBean admin=as.longin(username,password,radioFlag);//**
 if(username.equals(admin.getUsername())) {
   String chk="true";
   session.setAttribute("Enter",chk);
   session.setAttribute("userName",username);
   session.setAttribute("radioFlag",radioFlag);//**
   String flag="1";
   if( radioFlag.equals(flag) )//**
    response.sendRedirect("../index.jsp");
   if( !radioFlag.equals(flag) )//**
    response.sendRedirect("../wjList.jsp");
 } else {
  String errmsg="error1";
  response.sendRedirect("../login.jsp?errmsg="+errmsg);
 }
%>