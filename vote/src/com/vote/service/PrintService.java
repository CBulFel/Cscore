package com.vote.service;



import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;





import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;




public class PrintService {
	
	 int countCol=0;//数据的列数
	 int countRow=0;//数据的行数（不包括第一行名字）
	 int indexCol=0;//目前所在列的位置
     int indexRow=0;
     ArrayList<String> list=new ArrayList<String>();
     ArrayList<Integer> oidlist=new ArrayList<Integer>();
	public void printOneById(int oid)
	{ 
		
		DBConnection dbcon = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		String sql=null;
		HSSFWorkbook wb=new HSSFWorkbook();
		Statement stm=null;
		String wjTitle=null;
		HSSFSheet sheet=null;
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
				sheet = wb.createSheet(wjTitle);
				
		
			
			sql = "select content from wj_question where oid='"+ oid + "'";
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
			countCol=countCol+1;
		      }
	
			
			//sql = "SELECT content,seValue FROM wj_selecter,wj_answer WHERE wj_answer.oid=wj_selecter.oid AND wj_answer.qSeq=wj_selecter.qseq AND wj_answer.seSeq=wj_selecter.selseq AND wj_selecter.oid='"+ oid + "'"+"  order by replayId asc";
			sql = "SELECT content,seValue FROM wj_selecter,wj_answer WHERE wj_answer.oid=wj_selecter.oid AND wj_answer.qSeq=wj_selecter.qseq AND wj_answer.seSeq=wj_selecter.selseq AND wj_selecter.oid='"+oid+"' ORDER BY replayId asc,wj_selecter.qseq ASC";
			
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
			 
			 HSSFRow row3=sheet.createRow(countRow+1);
			 HSSFCell cell3= row3.createCell(0);
			 cell3.setCellValue("平均分");
			
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
			 HSSFRow row3=sheet.createRow(countRow+1);
			 HSSFCell cell3= row3.createCell(0);
			 cell3.setCellValue("平均分");
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
