package com.vote.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.vote.bean.ObjectBean;

public class ObjectBeanService {
	// 新建问卷
	public static int intsertObjectBean(ObjectBean bean) throws Exception {
		DBConnection db = new DBConnection();
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet rs = null;
		Timestamp currentTime = new Timestamp(System.currentTimeMillis());
		String sql = "";
		int id = 0;
		try {
			con = db.getConnection();
			sql = "insert into wj_object(title,discribe,createtime,state,remark,anonymousFlag,username,endtime) values(?,?,?,?,?,?,?,?)";
			System.out.println(sql);
			stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, bean.getTitle());
			stmt.setString(2, bean.getDiscribe());
			stmt.setTimestamp(3, currentTime);
			stmt.setInt(4, bean.getState());
			stmt.setString(5, bean.getRemark());
			stmt.setString(6, bean.getAnonymousFlag());
			stmt.setString(7, bean.getUsername());
			stmt.setString(8, bean.getDate());
			
			stmt.executeUpdate();
			rs = stmt.getGeneratedKeys();//可以获取刚刚插入自增ID值
			if(rs.next()) id = rs.getInt(1); 
			System.out.println("id:"+id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.closeAll(con, stmt,rs);
		}
		return id;
	}

	// 修改问卷
	public static int updateObjectBean(ObjectBean bean) {
		DBConnection dbcon = new DBConnection();
		String sql1 = "update wj_object set title = '" + bean.getTitle()
				+ "',discribe = '" + bean.getDiscribe() + "',anonymousFlag = '" + bean.getAnonymousFlag() + "'" +
				" where oid="+ bean.getOid();
		try {
			int i = dbcon.update(sql1, dbcon.getConnection());
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				dbcon.closeAll(dbcon.getConnection());
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}
	
	// 删除问卷
	public static boolean delObjectBean(int oid) throws Exception {
		DBConnection dbcon = new DBConnection();
		boolean flag = false;
		Connection conn = dbcon.getConnection();
		conn.setAutoCommit(false);
		String sql1 = "delete from wj_object where oid="+oid;
		String sql2 = "delete from wj_question where oid="+oid;
		String sql3 = "delete from wj_replay where oid="+oid;
		String sql4 = "delete from wj_answer where oid="+oid;
		String sql5 = "delete from wj_selecter where oid="+oid;
		try {
			dbcon.update(sql1, conn);
			dbcon.update(sql2, conn);
			dbcon.update(sql3, conn);
			dbcon.update(sql4, conn);
			dbcon.update(sql5, conn);
			conn.commit();
			flag = true;
		} catch (Exception e) {
			conn.rollback();
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
				dbcon.closeAll(conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	public static ObjectBean getObjectBean(int oid) {
		DBConnection dbcon = new DBConnection();
		Connection con = null;
		Statement stm = null;
		ResultSet rs = null;
		ObjectBean ob = null;
		int result = 0;
		try {
			con = dbcon.getConnection();
			stm = con.createStatement();
			String sql = " select * from wj_object where oid=" + oid;
			System.out.println(sql);
			rs = stm.executeQuery(sql);
			while (rs.next()) {
				String title = rs.getString("title");
				ob = new ObjectBean();
				ob.setOid(oid);
				ob.setTitle(title);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con, stm, rs);
		}
		return ob;
	}
    
	//	 查看问卷;
	public static List ListObjectBean(String username) {
		DBConnection dbcon = new DBConnection();
		Connection con = null;
		Statement stm = null;
		ResultSet rs = null;
		List objList=new LinkedList();
		try {
			String sql = "select oid,title,createtime,state,endtime from wj_object "
					+ "where username="
					+ "'"+username+"'"
					+ "order by oid desc ";
			con=dbcon.getConnection();
			stm=con.createStatement();
			rs = stm.executeQuery(sql);
			while(rs.next()){
				ObjectBean ob=new ObjectBean();
				int oid=rs.getInt("oid");
				String title=rs.getString("title");
				java.sql.Timestamp createtime=rs.getTimestamp("createtime");
				int state=rs.getInt("state");
				String endtime=rs.getString("endtime");
				ob.setOid(oid);
				ob.setTitle(title);
				ob.setCreateTime(createtime);
				ob.setState(state);
				ob.setDate(endtime);//数据库的endtime就是ob中的Date
				
				objList.add(ob);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
				dbcon.closeAll(con,stm,rs);
		}
		return objList;
	}

	// 根据编号查找标题和内容
	public static ObjectBean findObjectBeanByID(int ID) {
		DBConnection dbcon = new DBConnection();
		Connection con = null;
		Statement stm = null;
		ResultSet rs = null;
		ObjectBean ob=new ObjectBean();
		
		try {
			String sql = "select oid,title,discribe,state,anonymousFlag from wj_object where oid='" + ID
			+ "'";
			con=dbcon.getConnection();
			stm=con.createStatement();
			 rs = stm.executeQuery(sql);
			 while(rs.next()){
		     int oid = rs.getInt("oid");
			 String title = rs.getString("title");
			 String discribe = rs.getString("discribe");
			 String anonymousFlag = rs.getString("anonymousFlag");
			 int state=rs.getInt("state");
			 ob.setOid(oid);
			 ob.setState(state);
			 ob.setTitle(title);
			 ob.setDiscribe(discribe);
			 ob.setAnonymousFlag(anonymousFlag);
			 }
			
			return ob;
		} catch (Exception e) {
		
			e.printStackTrace();
			return null;
		} finally {
			dbcon.closeAll(con,stm,rs);
		}

	}
	
	//判断时间
	public static void autoEnd() throws Exception{
		DBConnection dbcon = new DBConnection();
		Connection con = null;
		Statement stm = null;
		
		
		con=dbcon.getConnection();
		stm=con.createStatement();
		
		Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
        String nowString = dateFormat.format( now );
		
		
		String sql="UPDATE wj_object SET state=2 WHERE endtime<"+"'"+nowString+"'";
		stm.execute(sql);
	}
	
	/**
	 * 查找发布后的问卷
	 * @param ID
	 * @return
	 */
	public static ObjectBean findPublishedObjectBeanByID(int ID) {
		DBConnection dbcon = new DBConnection();
		Connection con = null;
		Statement stm = null;
		ResultSet rs = null;
		ObjectBean ob=new ObjectBean();
		
		try {
			String sql = "select oid,title,discribe,state,anonymousFlag from wj_object where oid='" + ID
			+ "' and state in(1,2)";
			System.out.println("查询发布后的主题： "+sql);
			con=dbcon.getConnection();
			stm=con.createStatement();
			 rs = stm.executeQuery(sql);
			 while(rs.next()){
		     int oid = rs.getInt("oid");
			 String title = rs.getString("title");
			 String discribe = rs.getString("discribe");
			 String anonymousFlag = rs.getString("anonymousFlag");
			 int state=rs.getInt("state");
			 ob.setOid(oid);
			 ob.setState(state);
			 ob.setTitle(title);
			 ob.setDiscribe(discribe);
			 ob.setAnonymousFlag(anonymousFlag);
			 }
			
			return ob;
		} catch (Exception e) {
		
			e.printStackTrace();
			return null;
		} finally {
			dbcon.closeAll(con,stm,rs);
		}

	}

	
    //查找问卷一共几条数据(几个问题)
	public static int getCount(int oid) {
		DBConnection dbcon = new DBConnection();
		Connection con = null;
		Statement stm = null;
		ResultSet rs = null;
		int count=0;
		String sql = "select count(*) from wj_question where oid = '" + oid	+ "'";
		try {
			con=dbcon.getConnection();
			stm=con.createStatement();
			 rs = stm.executeQuery(sql);
			while(rs.next()){
				count=rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con, stm, rs);
		}
		return count;
	}
	static //寻找seSeq最大值
	int findseSeq(int oid){
		int mseSeq=0;
		DBConnection dbcon = new DBConnection();
		Connection con = null;
		Statement stm = null;
		ResultSet rs = null;
		String sql = "SELECT MAX(seSeq) FROM wj_answer  where oid = '" + oid	+ "'";
		try {
			con=dbcon.getConnection();
			stm=con.createStatement();
			 rs = stm.executeQuery(sql);
			while(rs.next()){
				mseSeq=rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con, stm, rs);
		}
		
		return mseSeq;
	}
	//计算出小组的总数　　qSeq最大值
	static
	private int findGroupCounter(int oid){
		int mSeq=0;
		DBConnection dbcon = new DBConnection();
		Connection con = null;
		Statement stm = null;
		ResultSet rs = null;
		String sql = "SELECT MAX(seq) FROM wj_question  where oid = '" + oid	+ "'";
		try {
			con=dbcon.getConnection();
			stm=con.createStatement();
			 rs = stm.executeQuery(sql);
			while(rs.next()){
				mSeq=rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con, stm, rs);
		}
		
		return mSeq;
	}
	//求本组评分表格的各项平均分和总平均分（内容）
	public static List average(int oid){
		int mseSeq=findseSeq(oid);
		int mSeq=findGroupCounter(oid);
		int seSeq;
		int qSeq=1;
		
		DBConnection dbcon = new DBConnection();
		Connection con = null;
		Statement stm = null;
		ResultSet rs = null;
		
		
		if(mseSeq==0)
			return null;
		else{
			List<ArrayList<Float>> lists=new ArrayList();
			for(qSeq=1;qSeq<=mSeq;qSeq++){
				ArrayList<Float> array=new ArrayList<Float>();
				
				array.add(new Float(qSeq));//组名
				
			for(seSeq=1;seSeq<=mseSeq;seSeq++){
		String sql = "SELECT AVG(seValue) FROM wj_answer  where oid = '" 
			+oid+ "'"+ " and "+ "seSeq= '"+seSeq+"'"+
				" and "+ "qSeq= '"+qSeq+"'"+ " and "+" seValue!= "+"'"+0+"'";
		try {
			con=dbcon.getConnection();
			stm=con.createStatement();
			rs = stm.executeQuery(sql);
			while(rs.next()){
				System.out.println("rs结果"+rs.getString(1) );
				if( rs.getString(1)==null ){
					array.add( new Float(0) );
				}
				else{
				    float temp=Float.parseFloat( rs.getString(1) );
				    System.out.println("avg="+temp);
				    array.add( temp );
				}
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con, stm, rs);
		}
			}//内 for
			float sum=0;
			for(int i=1;i<array.size();i++){
				sum=sum+(Float)array.get(i);
			}
			array.add(sum);//组总平均分
			lists.add(array);
			}//外 for
		
		return lists;
		}//else
	}
	//求出表格表头
	public static List findThead(int oid){
		List<String> list = new ArrayList();
		list.add("组号");
		DBConnection dbcon = new DBConnection();
		Connection con = null;
		Statement stm = null;
		ResultSet rs = null;
		String sql = "SELECT content FROM wj_selecter  where oid = '" + oid	+ "'"+" and "+" qSeq ="+"'"+1+"'";
		try {
			con=dbcon.getConnection();
			stm=con.createStatement();
			 rs = stm.executeQuery(sql);
			while(rs.next()){
				list.add(rs.getString(1));
				System.out.println("thead="+rs.getString(1));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con, stm, rs);
		}
		list.add("总平均分");
		return list;
	}
}
