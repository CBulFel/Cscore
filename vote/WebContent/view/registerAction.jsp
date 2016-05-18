<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.vote.service.*"%>
<%@page import="com.vote.bean.*"%>
<%
String registerName = request.getParameter("registerName");//注册用户名
String registerPassword = request.getParameter("registerPassword");//注册的密码
//测试
System.out.println("测试用户名："+registerName);
System.out.println("测试密码："+registerPassword);
//
AdminBean ab=new AdminBean();
ab.setUsername(registerName);
ab.setPassword(registerPassword);
AdminService as=new AdminService();
boolean flag = as.insertRegister(ab);
if(flag==true){
%>
<script type="text/javascript">
	alert("注册成功！");
	window.location.href="./login.jsp";
</script>
<%
}
%>
