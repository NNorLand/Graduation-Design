package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java1234.model.Area;
import com.java1234.model.Node;
import com.java1234.model.PageBean;
import com.java1234.util.StringUtil;

public class AreaDao {
	public ResultSet areaList(Connection con,PageBean pageBean,Area area)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_area ");
		if(StringUtil.isNotEmpty(area.getAreaName())){
			sb.append(" and areaName like '%"+area.getAreaName()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	
	public int Count(Connection con)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_area ");
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}

}
