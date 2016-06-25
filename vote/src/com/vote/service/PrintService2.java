package com.vote.service;



import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;





import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;




public class PrintService2 {
	 boolean judge=false;
	 int countCol=0;//数据的列数
	 int countRow=0;//数据的行数（不包括第一行名字）
	 int indexCol=0;//目前所在列的位置
     int indexRow=0;
     int indexRow2=0; 
     int replayIndex=0;
     int countPeople=0;//多少个人投了这个问卷
     ArrayList<String> list=new ArrayList<String>();
     ArrayList<Integer> oidlist=new ArrayList<Integer>();
     ArrayList<String> answerList=new ArrayList<String>();
     ArrayList<String> selectList=new ArrayList<String>();
     ArrayList<String> replayList=new ArrayList<String>();
     int answerListSize=0;
     int current=0;
	public void printOneById(int oid)
	{ 
		
		DBConnection dbcon = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		ResultSet rs4 = null;
		ResultSet rs5 = null;
		ResultSet rs6 = null;
		String sql=null;
		HSSFWorkbook wb=new HSSFWorkbook();
		Statement stm=null;
		String wjTitle=null;
	
		String answer=null;
		
		try {
			
			/*sql = "select * from wj_object where oid =?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, oid);
			rs1 =ps.executeQuery(sql);
			String wjTitle=rs1.getString("title");
			System.out.println("wiTITLE"+wjTitle);*/
			sql = "select * from wj_object where oid='"+ oid + "'";
				dbcon=new DBConnection();
				con=dbcon.getConnection();
				stm=con.createStatement();
				 rs1 = stm.executeQuery(sql);
				 
				 while(rs1.next()){
					 
					 wjTitle = rs1.getString("title");
				 }
				//声明表
				//sheet = wb.createSheet(wjTitle);
				
		
			
			sql = "select content from wj_question where oid='"+ oid + "'";
			stm=con.createStatement();
			 rs2 = stm.executeQuery(sql);
			//声明行
				//HSSFRow row=sheet.createRow(0);
			while(rs2.next()){//写表名
				String groupName=rs2.getString("content");
			//String question=rs2.getString("content");//得到问题名字
		    //声明列
			//HSSFCell cell=row.createCell(indexCol);
			//indexCol++;//下一列
			//写问题名（列名）
			//cell.setCellValue(question);
			//countCol=countCol+1;
				
				 sql="SELECT studentId,studentName FROM wj_replay WHERE oid='"+oid+"'";
				 stm=con.createStatement();
				 rs6 = stm.executeQuery(sql);
				// indexRow2=1;//从第二行开始
				 while (rs6.next()) {
					 String stuId=rs6.getString("studentId");
					 String stuName=rs6.getString("studentName");
					 String nameAndId=stuId+stuName;
					 //HSSFRow row3=sheet.createRow(r);
					 //HSSFRow row3=sheet.createRow(indexRow2);
					 //HSSFCell cell3=row3.createCell(0);
					// cell3.setCellValue(nameAndId);
					// indexRow2++;
					 replayList.add(nameAndId);
				}
				
				
				
				
				
				System.out.println("********************************建表");
				HSSFSheet sheet = wb.createSheet(groupName);
				
				sql="SELECT content FROM wj_selecter WHERE oid='"+oid+"'"+" AND qseq='1'";
				stm=con.createStatement();
				rs3 = stm.executeQuery(sql);
				
				 HSSFRow row=sheet.createRow(0);
				 HSSFCell cell=row.createCell(0);
				 cell.setCellValue("评分人");
				 indexCol=1;//从第二列开始
				 while(rs3.next()){//写第一行
					 String question=rs3.getString("content");
					 cell=row.createCell(indexCol);
					 cell.setCellValue(question);
					 indexCol++;//列+1
					 countCol++;
		      }
	
			
			//sql = "SELECT content,seValue FROM wj_selecter,wj_answer WHERE wj_answer.oid=wj_selecter.oid AND wj_answer.qSeq=wj_selecter.qseq AND wj_answer.seSeq=wj_selecter.selseq AND wj_selecter.oid='"+ oid + "'"+"  order by replayId asc";
			//sql = "SELECT content,seValue FROM wj_selecter,wj_answer WHERE wj_answer.oid=wj_selecter.oid AND wj_answer.qSeq=wj_selecter.qseq AND wj_answer.seSeq=wj_selecter.selseq AND wj_selecter.oid='"+oid+"' ORDER BY replayId asc,wj_selecter.qseq ASC";
				 sql="SELECT seValue FROM wj_answer WHERE oid='"+oid+"'"+" ORDER BY qSeq ASC";
				 stm=con.createStatement();
				 rs4 = stm.executeQuery(sql);
				 if(!judge){
				 while (rs4.next()) {
					 
					 String answerValue=rs4.getString("seValue");
					 answerList.add(answerValue);
					answerListSize=answerList.size();
					judge=true;
					 
					//测试
					/*for(int i=0;i<answerListSize;i++)
					{
						System.out.println("========================="+answerList.get(i));
					}*/}
				}
				 sql="SELECT COUNT(*) FROM wj_replay WHERE oid='"+oid+"'";
				 stm=con.createStatement();
				 rs5 = stm.executeQuery(sql);
				 while (rs5.next()) {
					 countPeople=rs5.getInt(1);
				}
				 indexRow=1;//从第二行开始
				 indexCol=0;//从第一列开始
				 countRow=countPeople;
			  // for(int i=0;i<countPeople;i++){//读出多少个元素
				   
				   
				  
				   for(int r=1;r<=countPeople;r++){
						 HSSFRow row2=sheet.createRow(r);
						 HSSFCell cell5=row2.createCell(0);
						 
						 cell5.setCellValue(replayList.get(replayIndex));
						 replayIndex++;
						 for(int c=1;c<=countCol;c++){//从第二列开始
							 HSSFCell cell2=row2.createCell(c);
							
							 System.out.println("*************r c:"+r+c);
							 System.out.println("*************size:"+answerListSize);
							 System.out.println("*************"+current);
							 cell2.setCellValue(answerList.get(current));
							 current++;
							  
						 }
						 
						 
					 }
				   
				
				   
				   
			//   }
			   countCol=0;
			   countRow=0;
			   replayIndex=0;
			   sheet.autoSizeColumn((short)0); //调整第一列宽度
			 }
			
			
			
			/* while(rs3.next()){
				 
				 
				  
					String content=rs3.getString("content");
					String seValue=rs3.getString("seValue");
					if (content.equals(""))
						{answer=seValue;}
					else{answer=content;}
					list.add(answer);
					System.out.println("*******************************"+answer);
					
				
				 
				 }
			 */
			// indexRow=1;//从第一行开始
			 //indexCol=0;//从第0列开始
			 
			/* 
			 HSSFRow row2=sheet.createRow(1);
			
			 HSSFCell cell2=row2.createCell(0);
			  cell2.setCellValue(list.get(0));
			  
			 cell2=row2.createCell(1);
			 cell2.setCellValue(list.get(1));
			 
			 row2=sheet.createRow(2);
			 
			 cell2=row2.createCell(0);
			 cell2.setCellValue(list.get(2));
		
			 cell2=row2.createCell(1);
			 cell2.setCellValue(list.get(3));
			 */
			 /*
			 int listIndex=0;
			 countRow=list.size()/countCol;
			 
			 if(listIndex<list.size()){
				 for(int r=1;r<=countRow;r++){
					 HSSFRow row2=sheet.createRow(r);
					 for(int c=0;c<countCol;c++){
						 HSSFCell cell2=row2.createCell(c);
						 cell2.setCellValue(list.get(listIndex));
						 listIndex++;
						  
					 }
					 
					 
				 }
			 }*/
			 
			
			
		}
			
		 catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			dbcon.closeAll(con, ps, rs1);
			dbcon.closeAll(con, ps, rs2);
			dbcon.closeAll(con, ps, rs3);
		}
	
			try {
				FileOutputStream outputStream=new FileOutputStream("d:/testprint/"+wjTitle+".xls");
				try {
					wb.write(outputStream);//写入到xls
					outputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
        }
	
	
	public void printAll(){
		countCol=0;//数据的列数
		countRow=0;//数据的行数（不包括第一行名字）
		indexCol=0;//目前所在列的位置
	    indexRow=0;
		DBConnection dbcon = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		String sql=null;
		HSSFWorkbook wb=new HSSFWorkbook();
		Statement stm=null;
		String wjTitle=null;
		HSSFSheet sheet=null;
		String answer=null;
		try{
		sql="SELECT oid FROM wj_object";
		dbcon=new DBConnection();
		con=dbcon.getConnection();
		stm=con.createStatement();
		 rs = stm.executeQuery(sql);
		 while(rs.next()){
			 
			 int oid = rs.getInt("oid");
			 oidlist.add(oid);
			 
		 }
		 
		 
		 for(int i=0;i<oidlist.size();i++)
		 {
			 
	       
	       
		 /*sql = "select * from wj_object where oid =?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, oid);
			rs1 =ps.executeQuery(sql);
			String wjTitle=rs1.getString("title");
			System.out.println("wiTITLE"+wjTitle);*/
			sql = "select * from wj_object where oid='"+ oidlist.get(i) + "'";
				dbcon=new DBConnection();
				con=dbcon.getConnection();
				stm=con.createStatement();
				 rs1 = stm.executeQuery(sql);
				 
				 while(rs1.next()){
					 
					 wjTitle = rs1.getString("title");
				 }
				//声明表
				sheet = wb.createSheet(wjTitle);
				
		
			
			sql = "select content from wj_question where oid='"+ oidlist.get(i) + "'";
			stm=con.createStatement();
			 rs2 = stm.executeQuery(sql);
			//声明行
				HSSFRow row=sheet.createRow(0);
			while(rs2.next()){
			String question=rs2.getString("content");//得到问题名字
		    //声明列
			HSSFCell cell=row.createCell(indexCol);
			indexCol++;//下一列
			
			//写问题名（列名）
			cell.setCellValue(question);
			countCol=countCol+1;//获得列数
		      }
	
			
			//sql = "SELECT content,seValue FROM wj_selecter,wj_answer WHERE wj_answer.oid=wj_selecter.oid AND wj_answer.qSeq=wj_selecter.qseq AND wj_answer.seSeq=wj_selecter.selseq AND wj_selecter.oid='"+ oid + "'"+"  order by replayId asc";
			sql = "SELECT content,seValue FROM wj_selecter,wj_answer WHERE wj_answer.oid=wj_selecter.oid AND wj_answer.qSeq=wj_selecter.qseq AND wj_answer.seSeq=wj_selecter.selseq AND wj_selecter.oid='"+oidlist.get(i)+"' ORDER BY replayId asc,wj_selecter.qseq ASC";
			
			stm=con.createStatement();
			 rs3 = stm.executeQuery(sql);
			
			
			
			 while(rs3.next()){
				 
				 
				  
					String content=rs3.getString("content");
					String seValue=rs3.getString("seValue");
					if (content.equals(""))
						{answer=seValue;}
					else{answer=content;}
					list.add(answer);
					System.out.println("*******************************"+answer);
					
				
				 
				 }
			 
			 indexRow=1;//从第一行开始
			 indexCol=0;//从第0列开始
			 
			/* 
			 HSSFRow row2=sheet.createRow(1);

			 HSSFCell cell2=row2.createCell(0);
			  cell2.setCellValue(list.get(0));
			  
			 cell2=row2.createCell(1);
			 cell2.setCellValue(list.get(1));
			 
			 row2=sheet.createRow(2);
			 
			 cell2=row2.createCell(0);
			 cell2.setCellValue(list.get(2));
		
			 cell2=row2.createCell(1);
			 cell2.setCellValue(list.get(3));
			 */
			 int listIndex=0;
			 countRow=list.size()/countCol;
			 
			 if(listIndex<list.size()){
				 for(int r=1;r<=countRow;r++){
					 HSSFRow row2=sheet.createRow(r);
					 for(int c=0;c<countCol;c++){
						 HSSFCell cell2=row2.createCell(c);
						 cell2.setCellValue(list.get(listIndex));
						 listIndex++;
						  
					 }
					 
					 
				 }
			 }
			
		list.clear();
		countCol=0;
		countRow=0;
		}

		}
		catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			dbcon.closeAll(con, ps, rs);
			dbcon.closeAll(con, ps, rs1);
			dbcon.closeAll(con, ps, rs2);
			dbcon.closeAll(con, ps, rs3);
		}
		try {
			FileOutputStream outputStream=new FileOutputStream("d:/testprint/All.xls");
			try {
				wb.write(outputStream);//写入到xls
				outputStream.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    }
	}
