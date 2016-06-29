<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.vote.service.*"%>


<% 


PrintService ps=new PrintService();
ps.printAll();
 session.setAttribute("atitle", "All");
response.sendRedirect("download.jsp");
%>
    

