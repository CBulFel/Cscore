<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.vote.service.*"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>



<% 
//下面查询是查询出对应标题 用标题用于下载（xls名字是对应标题名）
DBConnection dbcon = null;
Connection con = null;
PreparedStatement pres = null;
ResultSet rs1 = null;
String sql=null;
Statement stm=null;
String wjTitle=null;
String id=request.getParameter("oid");
int oid=Integer.parseInt(id);
sql = "select * from wj_object where oid='"+ oid + "'";
				dbcon=new DBConnection();
				con=dbcon.getConnection();
				stm=con.createStatement();
				 rs1 = stm.executeQuery(sql);
				 
				 while(rs1.next()){
					 
					 wjTitle = rs1.getString("title");
					 session.setAttribute("atitle", wjTitle);
					 
				 }
            

PrintService2 ps=new PrintService2();
ps.printOneById(oid);
response.sendRedirect("download.jsp");
%>
    
<%
 /* String path = "D:\testprint";//路径 ，比如d: 标示D盘
  
  BufferedReader br = new BufferedReader(fr); //建立BufferedReader对象,并设定由br对象变量引 
   
  br.close(); //关闭BufferedReader对象
  fr.close(); //关闭文件*/
%>
