package com.java1234.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.java1234.model.PageBean;
import com.java1234.model.Node;
import com.java1234.model.Ss;
import com.java1234.util.StringUtil;

public class NodeDao {

	public ResultSet nodeList(Connection con,PageBean pageBean,Node node)throws Exception{
		StringBuffer sb=new StringBuffer("select * from t_node u ,t_area r where u.areaid=r.areaid ");
		if(StringUtil.isNotEmpty(node.getNodeName())){
			sb.append(" and u.tnodeName like '%"+node.getNodeName()+"%'");
		}
		if(node.getAreaId()!=-1){
			sb.append(" and u.areaId="+node.getAreaId());
		}
		if(pageBean!=null){
			sb.append(" limit "+pageBean.getStart()+","+pageBean.getRows());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		return pstmt.executeQuery();
	}

	public int Count(Connection con,Node node)throws Exception{
		StringBuffer sb=new StringBuffer("select count(*) as total from t_node u ,t_area r where u.areaid=r.areaid ");
		if(StringUtil.isNotEmpty(node.getNodeName())){
			sb.append(" and u.tnodeName like '%"+node.getNodeName()+"%'");
		}
		if(node.getAreaId()!=-1){
			sb.append(" and u.nodeId="+node.getAreaId());
		}
		PreparedStatement pstmt=con.prepareStatement(sb.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("total");
		}else{
			return 0;
		}
	}

	public int nodeAdd(Connection con,Node node)throws Exception{
		String sql="insert into t_node values(null,?,?,?,?,?)";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, node.getNodeName());
		pstmt.setInt(2, node.getAreaId());
		pstmt.setFloat(3, node.getX());
		pstmt.setFloat(4, node.getY());
		pstmt.setString(5, node.getDescription());
		return pstmt.executeUpdate();
	}

	public int nodeUpdate(Connection con,Node node)throws Exception{
		String sql="update t_node set tnodeName=?,areaId=?,x=?,y=?,description=? where nodeId=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, node.getNodeName());
		pstmt.setInt(2, node.getAreaId());
		pstmt.setFloat(3, node.getX());
		pstmt.setFloat(4, node.getY());
		pstmt.setString(5, node.getDescription());
		pstmt.setInt(6, node.getNodeId());
		return pstmt.executeUpdate();
	}

	public int nodeDelete(Connection con,String delIds)throws Exception{
		String sql="delete from t_node where nodeId in ("+delIds+")";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeUpdate();
	}

	public boolean existNodeWithNodeName(Connection con,String tnodeName)throws Exception{
		String sql="select * from t_node where tnodeName=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, tnodeName);
		return pstmt.executeQuery().next();
	}
}
