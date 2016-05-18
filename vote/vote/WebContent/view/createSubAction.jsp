<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="check.jsp"%>
<%@page import="com.vote.service.*"%>
<%
String textPsw=request.getParameter("textPsw");
System.out.println("textPsw="+textPsw);
boolean flag=AdminService.insertSubpsw( (String)session.getAttribute("userName"), textPsw);
if(flag==true){
%>
<script type="text/javascript">
alert("创建密钥成功！");
window.location.href="./main.jsp";
</script>
<%
}
%>

