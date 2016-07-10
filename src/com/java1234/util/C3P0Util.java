package com.java1234.util;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class C3P0Util {
	public static ComboPooledDataSource cpds = new ComboPooledDataSource();
	//private static ComboPooledDataSource cpds = new ComboPooledDataSource("intergalactoApp");
	
	public static Connection getCon(){
		try {
			return cpds.getConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void closeCon(Connection con)throws Exception{
		if(con!=null){
			con.close();
		}
	}
	
//	public static void closeCon(ResultSet rs,Statement stmt,Connection conn){
//		if(rs!=null){
//			try {
//				rs.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			rs = null;
//		}
//		if(stmt!=null){
//			try {
//				stmt.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			stmt = null;
//		}
//		if(conn!=null){
//			try {
//				conn.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			conn = null;
//		}
//	}
	
	public static void main(String[] args) {
		C3P0Util dbUtil=new C3P0Util();
		try {
			dbUtil.getCon();
			System.out.println("数据库连接成功！");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("数据库连接失败！");
		}
	}
}
