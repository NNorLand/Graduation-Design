package com.java1234.chart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.java1234.util.*;
public class atmos extends HttpServlet {
	
	C3P0Util dbUtil=new C3P0Util();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String page=request.getParameter("index");
    	int index=Integer.parseInt(page);

		Connection conn = null;
		Statement s = null;
		ResultSet r = null;
		try {
			
			conn = dbUtil.getCon();
			s = conn.createStatement();
			r = s.executeQuery("select * from t_atmos order by id desc limit 1");
			JSONObject result=new JSONObject();
			while(r.next()){
				result.put("data", r.getObject(4));
			}
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(result.toString());
			out.flush();
			out.close();
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
	}
	
}
