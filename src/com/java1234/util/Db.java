package com.java1234.util;

import java.sql.*;

import net.sf.json.JSONObject;

public class Db {
	private static Connection conn = null;
	private static Statement s = null;
	private static ResultSet r = null;
	private static JSONObject result = new JSONObject();
	private static String str = new String();
	private static float num;
	
	public static float getdb() throws Exception{
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection("jdbc:mysql://localhost/db_water?user=root&password=121718");
			s = conn.createStatement();
			r = s.executeQuery("select * from t_atmos order by id desc limit 1");
			
			while (r.next()) {
				result.put("data", r.getObject(4));
			}
			
			str = result.getString("data");
			num = Float.parseFloat(str);
			java.text.DecimalFormat df = new java.text.DecimalFormat("#.000");
			df.format(num);
        } catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				r.close();
				s.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
		}
		return num;
	}
	
	public static void main(String args[]) throws Exception{
		float a = Db.getdb();
		System.out.println(a);
	}
}
