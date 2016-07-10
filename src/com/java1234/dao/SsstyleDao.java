package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java1234.model.PageBean;
import com.java1234.model.Ssstyle;
import com.java1234.util.StringUtil;

public class SsstyleDao {
	public ResultSet ssstyleList(Connection con,PageBean pageBean,Ssstyle s)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_ssstyle ");
		if(StringUtil.isNotEmpty(s.getStyleName())){
			sb.append(" and styleName like '%"+s.getStyleName()+"%'");
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString().replaceFirst("and", "where"));
		return pstmt.executeQuery();
	}
	
	public int Count(Connection con)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_ssstyle ");
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}

}
