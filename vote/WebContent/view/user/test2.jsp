<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@page import="com.vote.service.*"%>
<%@page import="com.vote.bean.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
    <%
	ObjectBean ob = ObjectBeanService.findPublishedObjectBeanByID(35);//查找发布后的问卷
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

</head>

<body>
<textarea id="txtarea" cols="100" rows="15"  readonly="true"><%=ob.getDiscribe()%></textarea>

<table width="98%" border="1" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
  <caption><h2>各小组的各项平均分</h2></caption>
  <tbody id="tbdy"></tbody>
  
</table>
<script type="text/javascript"> 
var arry=document.getElementById("txtarea").value.split( "\n ");

for(var i=0;i<arry.length;i++){
	//alert(arry[i]);

	var x=document.getElementById("tbdy").insertRow(i);

	var y=x.insertCell(0);

	//var z=x.insertCell(1);

	y.innerHTML=arry[i];

	//z.innerHTML="NEW CELL2";

}
</script> 
</body>
</html>