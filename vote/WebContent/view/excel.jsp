<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="check.jsp"%>
<%@page import="com.vote.service.*"%>
<%@page import="com.vote.bean.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
	
	<%
		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "excel.xls");
		}
		String id=(String)session.getAttribute("oid");
		//String id=(String)request.getAttribute("oid");
		//String id = request.getParameter("oid");
		System.out.println("oid="+id);
		
		int oid = Integer.parseInt(id);
		List listThead=ObjectBeanService.findThead(oid);
		List< ArrayList<Float> > listContent=ObjectBeanService.average(oid);
		
	%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>表格显示</title>
</head>
<body>

<table width="98%" border="1" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
  <caption><h2>各小组的各项平均分</h2></caption>
<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
 
<%
for(int i=0;i<listThead.size();i++){
	String str=(String)listThead.get(i);
%>
<td><h2><%=str %></h2></td>
<% } %>
</tr>

<% 
for(int k=0;k<listContent.size();k++){
	ArrayList<Float> array=listContent.get(k);
%>
<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
<% 
for(int i=0;i<array.size();i++){
	float str=(Float)array.get(i);
%>
<td><h3> <%=str%> </h3></td>
<% } %>
</tr>
<% } %>

</table>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</body>
</html>