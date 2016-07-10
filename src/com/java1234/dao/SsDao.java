package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java1234.model.PageBean;
import com.java1234.model.Ss;
import com.java1234.model.Node;
import com.java1234.model.User;
import com.java1234.util.StringUtil;

public class SsDao {

	public ResultSet List(Connection con,PageBean pageBean,Ss ss)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_ss u ,t_node r ,t_ssstyle m where u.nodeid=r.nodeid and u.styleid=m.styleid ");
		if(StringUtil.isNotEmpty(ss.getSsName())){
			sb.append(" and u.ssName like '%"+ss.getSsName()+"%'");
		}
		if(ss.getNodeId()!=-1){
			sb.append(" and u.nodeId="+ss.getNodeId());
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}
	
	
	public int Count(Connection con,Ss ss)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_ss u ,t_node r ,t_ssstyle m where u.nodeId=r.nodeId and u.styleid=m.styleid ");
		if(StringUtil.isNotEmpty(ss.getSsName())){
			sb.append(" and u.ssName like '%"+ss.getSsName()+"%'");
		}
		if(ss.getNodeId()!=-1){
			sb.append(" and u.nodeId="+ss.getNodeId());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}
	
	
	public int ssAdd(Connection con,Ss ss)throws Exception{
		String sql="insert into t_ss values(null,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, ss.getSsName());
		pstmt.setInt(2, ss.getNodeId());
		pstmt.setInt(3, ss.getStyleId());
		return pstmt.executeUpdate();
	}
	
	public int ssUpdate(Connection con,Ss ss)throws Exception{
		String sql="update t_ss set ssName=?,nodeId=?,styleId=? where ssId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, ss.getSsName());
		pstmt.setInt(2, ss.getNodeId());
		pstmt.setInt(3, ss.getStyleId());
		pstmt.setInt(4, ss.getSsId());
		return pstmt.executeUpdate();
	}
	
	public int ssDelete(Connection con,String delIds)throws Exception{
		String sql="delete from t_ss where ssId in ("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}
	
	public boolean existSsWithSsName(Connection con,String ssName)throws Exception{
		String sql="select * from t_ss where ssName=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, ssName);
		return pstmt.executeQuery().next();
	}
	
	public boolean existSsWithNodeId(Connection con,String nodeId)throws Exception{
		String sql="select * from t_ss where nodeId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, nodeId);
		return pstmt.executeQuery().next();
	}
}
