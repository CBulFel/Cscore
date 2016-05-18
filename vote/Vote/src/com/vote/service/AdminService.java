package com.vote.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.vote.bean.AdminBean;


public class AdminService {
	
	public AdminBean longin(String username,String password,String radioFlag) throws Exception {
		DBConnection dbcon = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		AdminBean admin=new AdminBean();
		String md5Psw = MD5Util.MD5Encrypt(password);
		String sql=null;
		String flag="1";
		if( radioFlag.equals(flag) );
		 sql = "select * from wj_admins where username =? and password =?";//防止SQL注入
		if( !radioFlag.equals(flag) )
		 sql = "select * from wj_admins where username =? and subpassword =?";//防止SQL注入
		try {
			dbcon=new DBConnection();
			con=dbcon.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, md5Psw);
			rs = ps.executeQuery();
			 while(rs.next()){
			String uname=rs.getString("username");
			String pwd=rs.getString("password");
			if( radioFlag.equals(flag) )
			    admin.setPassword(pwd);
			if( !radioFlag.equals(flag) )
				admin.setSubpassword(pwd);
			admin.setUsername(uname);
		}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			dbcon.closeAll(con, ps, rs);
		}
		return admin;
	}
	
	public static String getOldPsw(String username){
		DBConnection dbcon = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String psw ="";
		String	sql = "select * from wj_admins where username =?";
		try {
			dbcon=new DBConnection();
			con=dbcon.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
		    while(rs.next()){
		    	psw=rs.getString("password");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con, ps, rs);
		}
		return psw;
	}
	
	/**
	 * 修改密码
	 * @param username
	 * @param newpsw
	 * @return
	 * @throws Exception 
	 */
	public static boolean updatePassword(String username,String newpsw) throws Exception{
		DBConnection dbcon = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean flag = false;
		String md5Psw = MD5Util.MD5Encrypt(newpsw);
		String	sql = "update wj_admins set password = ? where username = ?";
		System.out.println(sql);
		//测试
		System.out.println("测试用户名："+username);
		System.out.println("测试密码："+md5Psw);
		//
		try {
			dbcon=new DBConnection();
			con=dbcon.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, md5Psw);
			ps.setString(2,username );
			ps.executeUpdate();
			flag=true;
			//测试
			System.out.println("密码更新成功");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con, ps, rs);
		}
		return flag;
	}
		//比较用户名是否一样
	public static boolean findUsername(String value){
		DBConnection dbcon = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String userValue=null;
		String	sql = "select username from wj_admins where username =?";
		try {
			dbcon=new DBConnection();
			con=dbcon.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, value);
			rs = ps.executeQuery();
		    while(rs.next()){
		    	userValue=rs.getString("username");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con, ps, rs);
		}
		
		if( userValue!=null )
			return true;
		else
			return false;
	}
	//插入新用户名和密码
	public boolean insertRegister(AdminBean ab){
		DBConnection dbcon = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean flag = false;
		String md5Psw = null;
		try {
			md5Psw = MD5Util.MD5Encrypt( ab.getPassword() );
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String	sql = "insert into wj_admins (username,password) values (?,?) ;";
		System.out.println(sql);
		//测试
		System.out.println("测试用户名："+ab.getUsername());
		System.out.println("测试密码："+ab.getPassword());
		//
		try {
			dbcon=new DBConnection();
			con=dbcon.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, ab.getUsername());
			ps.setString(2, md5Psw);
			ps.executeUpdate();
			flag=true;
			//测试
			System.out.println("插入成功");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con, ps, rs);
		}
		return flag;
	}
	//插入子用户名密钥
	public static boolean insertSubpsw(String username,String subpsw){
		DBConnection dbcon = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean flag = false;
		String md5Psw = null;
		try {
			md5Psw = MD5Util.MD5Encrypt(subpsw);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String	sql = "update wj_admins set subpassword = ? where username = ?";
		System.out.println(sql);
		//测试
		System.out.println("测试用户名："+username);
		System.out.println("测试密码："+md5Psw);
		//
		try {
			dbcon=new DBConnection();
			con=dbcon.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, md5Psw);
			ps.setString(2,username );
			ps.executeUpdate();
			flag=true;
			//测试
			System.out.println("密钥更新成功");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con, ps, rs);
		}
		return flag;
	}
	//查找子用户密钥
	public static String findSubpsw(String username){
		DBConnection dbcon = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String psw ="";
		String	sql = "select subpassword from wj_admins where username =?";
		try {
			dbcon=new DBConnection();
			con=dbcon.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
		    while(rs.next()){
		    	psw=rs.getString("subpassword");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbcon.closeAll(con, ps, rs);
		}
		return psw;
	}
}
