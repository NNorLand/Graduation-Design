package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.java1234.dao.NodeDao;
import com.java1234.dao.RoleDao;
import com.java1234.dao.SsDao;
import com.java1234.dao.UserDao;
import com.java1234.model.PageBean;
import com.java1234.model.Ss;
import com.java1234.model.User;
import com.java1234.util.C3P0Util;
import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

public class SsServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	C3P0Util dbUtil=new C3P0Util();
	SsDao ssDao=new SsDao();
	NodeDao roleDao=new NodeDao();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action=request.getParameter("action");
		if("list".equals(action)){
			list(request, response);
		}else if("save".equals(action)){
			save(request, response);
		}else if("delete".equals(action)){
			delete(request, response);
		}
	}

	private void list(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page=request.getParameter("page");
		String rows=request.getParameter("rows");
		Ss ss=new Ss();
		String s_ssName=request.getParameter("s_ssName");
		String s_nodeId=request.getParameter("s_nodeId");
		if(StringUtil.isNotEmpty(s_ssName)){
			ss.setSsName(s_ssName);
		}
		if(StringUtil.isNotEmpty(s_nodeId)){
			ss.setNodeId(Integer.parseInt(s_nodeId));
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(ssDao.List(con, pageBean,ss));
			int total=ssDao.Count(con,ss);
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
		String ssName=request.getParameter("ssName");
		String nodeId=request.getParameter("nodeId");
		String styleId=request.getParameter("styleId");
		String ssId=request.getParameter("ssId");
		Ss ss=new Ss(ssName, Integer.parseInt(nodeId), Integer.parseInt(styleId));
		if(StringUtil.isNotEmpty(ssId)){
			ss.setSsId(Integer.parseInt(ssId));
		}
		Connection con=null;
		try{
			JSONObject result=new JSONObject();
			con=dbUtil.getCon();
			int saveNums=0;
			if(StringUtil.isNotEmpty(ssId)){
				saveNums=ssDao.ssUpdate(con, ss);
			}else{
				if(ssDao.existSsWithSsName(con, ssName)){
					saveNums=-1;
				}else{
					saveNums=ssDao.ssAdd(con, ss);
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
			int delNums=ssDao.ssDelete(con, delIds);
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
