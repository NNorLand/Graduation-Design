package com.java1234.chart;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.AxisLocation;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.time.Day;
import org.jfree.data.time.Hour;
import org.jfree.data.time.Minute;
import org.jfree.data.time.RegularTimePeriod;
import org.jfree.data.time.Second;
import org.jfree.data.time.TimeSeries;
import org.jfree.data.time.TimeSeriesCollection;
import org.jfree.data.xy.XYDataset;
import org.jfree.date.SerialDate;
import org.jfree.ui.RectangleInsets;
import org.jfree.ui.TextAnchor;

import com.java1234.util.C3P0Util;

public class water_line1 extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            doPost(request,response);
        
    }
    
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	String page=request.getParameter("page");
    	int index=Integer.parseInt(page);
        PrintWriter out = response.getWriter();
        
        //画图
        JFreeChart chart = null;
		try {
			chart = getChart(index);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}        
        
        //将图片放到session里
        HttpSession session = request.getSession(true);    
        String filename = ServletUtilities.saveChartAsPNG(
                chart, //生成的chart
                700,  //图的宽度,单位是像素
                400,  //图的高度,单位是像素
                null,  //信息
                session //图片生命周期
        );
        
        //将生成图片的名字返回到客户端
        out.println(filename);
        
    }

/**
 * 画图
 * @param title
 * @param disRow
 * @param disCls
 * @param dataset
 * @return
 * @throws InterruptedException 
 */
    public JFreeChart getChart(int index) throws InterruptedException{
        
    	//设置曲线 
		TimeSeries timeseries = new TimeSeries("平均",Second.class);//时间的最小单位为分，线值名是“平均” 
		
		//连接数据库 
		try {
			C3P0Util dbUtil=new C3P0Util();
			Connection conn=dbUtil.getCon();
			Statement stmt=conn.createStatement(); 
			String sql="select * from t_water_line1 order by id limit "+index+",10"; 
			ResultSet rs=stmt.executeQuery(sql);
			
			//从数据库中取值，数据和时间 
			while(rs.next()) 
			{ 
				//纵坐标
				float y0=rs.getFloat("data"); 
				//String date=rs.getString("datetime"); 
				
				//横坐标
				String datetime=rs.getString("datetime"); 
				//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				//Date date= df.parse(datetime);
				//RegularTimePeriod x = new Day(date);
				//String date=df.format(new Date());
				//从yyyyMMddHHmm时间格式的char中取出年月日小时分设为int值 
				int x=Integer.parseInt(datetime.substring(0,4)); 
				int y=Integer.parseInt(datetime.substring(5,7)); 
				int z=Integer.parseInt(datetime.substring(8,10));
				
				//组合数据
				timeseries.add(new Second(0,new Minute(0,new Hour(0,new Day(z,y,x)))),y0);
				Thread.sleep(1000);
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		//连接曲线 
		TimeSeriesCollection dataset = new TimeSeriesCollection(); 
		dataset.addSeries(timeseries); 
		dataset.setDomainIsPointsInTime(true); 
		
		//设置曲线图 
		XYDataset xydataset = (XYDataset) dataset; 
		JFreeChart chart = ChartFactory.createTimeSeriesChart( 
																"水位走势图", 
																"时间", 
																"值", 
																xydataset, 
																true, 
																true, 
																true 
															); 
		chart.setBackgroundPaint(Color.white);//设置曲线图背景色 
		
		XYPlot plot = (XYPlot) chart.getPlot(); 
		XYLineAndShapeRenderer xylineandshaperenderer = (XYLineAndShapeRenderer)plot.getRenderer(); 
		plot.setBackgroundPaint(Color.white);//设置网格背景颜色 
		plot.setDomainGridlinePaint(Color.pink);//设置网格竖线颜色 
		plot.setRangeGridlinePaint(Color.pink);//设置网格横线颜色 
		plot.setAxisOffset(new RectangleInsets(0D, 0D, 0D, 10D));//设置曲线图与xy轴的距离，即曲线与xy轴贴近的距离 
		xylineandshaperenderer.setBaseShapesVisible(true);//设置曲线是否显示数据点 
		
        return chart;
        
    }
}
