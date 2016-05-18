<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.vote.service.*"%>
<%
    String userName = request.getParameter("username");
	boolean isExit = AdminService.findUsername(userName);
	System.out.println("用户名： "+userName); 
	if(isExit) out.println("用户名已存在！");
	else out.println("用户名可用！");
%>