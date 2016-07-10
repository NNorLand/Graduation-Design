package com.java1234.web;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.java1234.dao.AreaDao;
import com.java1234.dao.NodeDao;
import com.java1234.dao.RoleDao;
import com.java1234.dao.SsDao;
import com.java1234.dao.SsstyleDao;
import com.java1234.dao.UserDao;
import com.java1234.model.Area;
import com.java1234.model.Node;
import com.java1234.model.PageBean;
import com.java1234.model.Role;
import com.java1234.model.Ss;
import com.java1234.model.Ssstyle;
import com.java1234.util.C3P0Util;
import com.java1234.util.DbUtil;
import com.java1234.util.JsonUtil;
import com.java1234.util.ResponseUtil;
import com.java1234.util.StringUtil;

public class SsstyleServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	C3P0Util dbUtil=new C3P0Util();
	SsstyleDao ssstyleDao=new SsstyleDao();
	
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
		if("list".equals(action)){
			List(request, response);		
		}
	}

	private void List(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page=request.getParameter("page");
		String rows=request.getParameter("rows");
		Ssstyle s=new Ssstyle();
		String s_styleName=request.getParameter("s_styleName");
		if(StringUtil.isNotEmpty(s_styleName)){
			s.setStyleName(s_styleName);
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), Integer.parseInt(rows));
		Connection con=null;
		try{
			con=dbUtil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(ssstyleDao.ssstyleList(con, pageBean, s));
			int total=ssstyleDao.Count(con);
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
	
}
