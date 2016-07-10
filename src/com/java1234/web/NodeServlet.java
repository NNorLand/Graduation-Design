package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.java1234.dao.NodeDao;
import com.java1234.dao.RoleDao;
import com.java1234.dao.SsDao;
import com.java1234.dao.UserDao;
import com.java1234.model.Node;
import com.java1234.model.PageBean;
import com.java1234.model.Role;
import com.java1234.model.User;
import com.java1234.util.C3P0Util;
import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

public class NodeServlet extends HttpServlet{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	C3P0Util dbUtil=new C3P0Util();
	NodeDao nodeDao=new NodeDao();
	SsDao ssDao=new SsDao();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action=request.getParameter("action");
		//System.out.print(action);
		if("comBoList".equals(action)){
			comBoList(request, response);
		}else if("list".equals(action)){
			nodeList(request, response);
		}else if("save".equals(action)){
			save(request, response);
		}else if("delete".equals(action)){
			delete(request, response);
		}
	}

	private void comBoList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONArray jsonArray=new JSONArray();
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("nodeId", "");
			jsonObject.put("tnodeName", "请选择...");
			jsonArray.add(jsonObject);
			jsonArray.addAll(JsonUtil.formatRsToJsonArray(nodeDao.nodeList(con,null,new Node())));
			ResponseUtil.write(response, jsonArray);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}


	private void nodeList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page=request.getParameter("page");
		String rows=request.getParameter("rows");
		Node node=new Node();
		String s_nodeName=request.getParameter("s_nodeName");
		String s_areaId=request.getParameter("s_areaId");
		if(StringUtil.isNotEmpty(s_nodeName)){
			node.setNodeName(s_nodeName);
		}
		if(StringUtil.isNotEmpty(s_areaId)){
			node.setAreaId(Integer.parseInt(s_areaId));
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(nodeDao.nodeList(con, pageBean,node));
			int total=nodeDao.Count(con,node);
			result.put("rows", jsonArray);
			result.put("total", total);
			ResponseUtil.write(response, result);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void save(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tnodeName=request.getParameter("tnodeName");
		String areaId=request.getParameter("areaId");
		String x=request.getParameter("x");
		String y=request.getParameter("y");
		String description=request.getParameter("description");
		String nodeId=request.getParameter("nodeId");
		System.out.print(tnodeName+"|"+areaId+"|"+x+"|"+y+"|"+description);
		Node node=new Node(tnodeName, Integer.parseInt(areaId), Integer.parseInt(x), Integer.parseInt(y),description);
		if(StringUtil.isNotEmpty(nodeId)){
			node.setNodeId(Integer.parseInt(nodeId));
		}
		Connection con=null;
		try{
			JSONObject result=new JSONObject();
			con=dbUtil.getCon();
			int saveNums=0;
			if(StringUtil.isNotEmpty(nodeId)){
				saveNums=nodeDao.nodeUpdate(con, node);
			}else{
				if(nodeDao.existNodeWithNodeName(con, tnodeName)){
					saveNums=-1;
				}else{
					saveNums=nodeDao.nodeAdd(con, node);
				}
			}
			if(saveNums==-1){
				result.put("success", true);
				result.put("errorMsg", "此用户名已经存在");
			}else if(saveNums==0){
				result.put("success", true);
				result.put("errorMsg", "保存失败");
			}else{
				result.put("success", true);
			}
			ResponseUtil.write(response, result);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String delIds=request.getParameter("delIds");
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			String str[]=delIds.split(",");
			for(int i=0;i<str.length;i++){
				boolean f=ssDao.existSsWithNodeId(con, str[i]);
				if(f){
					result.put("errorIndex", i);
					result.put("errorMsg", "节点下面有传感器，不能删除！");
					ResponseUtil.write(response, result);
					return;
				}
			}
			int delNums=nodeDao.nodeDelete(con, delIds);
			if(delNums>0){
				result.put("success", true);
				result.put("delNums", delNums);
			}else{
				result.put("errorMsg", "删除失败");
			}
			ResponseUtil.write(response, result);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				dbUtil.closeCon(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
