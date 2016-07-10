<!DOCTYPE html>
<html>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%     
      //图片路径
      String graphURL = request.getContextPath() + "/DisplayChart?filename=" ;
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="water.css" type="text/css" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=6264cf086a746d594535fe8f1b99d500"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
<script type="text/javascript" src="jquery-1.9.1.js"></script>
<script type="text/javascript" src="highcharts.js"></script>
<title>添加普通标注点</title>

</head>
<body>
        <div id="allmap"></div>
        <div id="map_manager">
        	<div title="区域选中">
            	<img src="img/manager/manager11.png">
                <img class="btu_hide" src="img/manager/manager12.png">
            </div>	
            <div title="添加坐标">
            	<img src="img/manager/manager21.jpg">
                <img class="btu_hide" src="img/manager/manager22.jpg">
            </div>
            <div title="坐标搜索">
            	<img src="img/manager/manager31.jpg">
                <img class="btu_hide" src="img/manager/manager32.jpg">
            </div>
            <div title="地图控件">
            	<img src="img/manager/manager41.png">
                <img class="btu_hide" src="img/manager/manager42.png">
            </div>
            <div title="文件下载">
            	<img src="img/manager/manager51.png">
                <img class="btu_hide" src="img/manager/manager52.png">
            </div>
        </div>
        <div class="moreblock">
            <img class="close" src="img/close.jpg" onclick=closeyou()>
            <p class="more_title">历史信息</p>
            <div class="more_content">
                <div class="spot1">气温信息<img id='spot11' src='temper.png' width=290 height=200 border=0/>说明：<br>气温历史信息</div>
                <div class="spot2">水温信息<img id='spot22' src='wind.png' width=290 height=200 border=0/>说明：<br>水温历史信息</div>
                <div class="spot3">湿度信息<img id='spot33' src='dampness.png' width=290 height=200 border=0/>说明：<br>湿度历史信息</div>
				<div class="spot4">待添加信息<img id='spot44' src='dampness.png' width=290 height=200 border=0/>说明：<br>水位历史信息</div>
				<div class="spot5">烟雾信息<img id='spot55' src='dampness.png' width=290 height=200 border=0/>说明：<br>烟雾历史信息</div>
				<div class="spot6">大气压强信息<img id='spot66' src='dampness.png' width=290 height=200 border=0/>说明：<br>大气压强历史信息</div>
				<div class="spot7">降水量信息<img id='spot77' src='dampness.png' width=290 height=200 border=0/>说明：<br>降水量历史信息</div>
                <div class="choose_spot1">坐标点1</div>
                <div class="choose_spot2">坐标点2</div>
                <div class="choose_spot3">坐标点3</div>
				<div class="choose_spot4">坐标点4</div>
				<div class="choose_spot5">坐标点5</div>
				<div class="choose_spot6">坐标点6</div>
				<div class="choose_spot7">坐标点7</div>
            </div>
        </div>
        <div id="research">
            <input id="lng" type="text" value="经度">
            <input id="lat" type="text" value="纬度">
            <input id="sub" type="submit" value="查询">
        </div>
        <input type="hidden" id="hidText" value="<%=graphURL %>">
	<script type="text/javascript">
	//JavaScript Document 制作人：班宏伟
	//百度地图API功能
		var i=j=0;
		
		var map = new BMap.Map("allmap");
		map.centerAndZoom(new BMap.Point(114.382, 38.233), 12);

		var point1=new BMap.Point(114.281713, 38.234134);//创建坐标
		var point2=new BMap.Point(114.250682, 38.230392);//创建坐标
		var point3=new BMap.Point(114.283868, 38.210959);//创建坐标
		var marker1 = new BMap.Marker(point1);  // 创建标注1
		var marker2 = new BMap.Marker(point2);  // 创建标注2
		var marker3 = new BMap.Marker(point3);  // 创建标注3
	
		map.addOverlay(marker1);              // 将标注添加到地图中
		map.addOverlay(marker2);              // 将标注添加到地图中
		map.addOverlay(marker3);              // 将标注添加到地图中


		//经纬度搜索
		var contents = [point1,point2,point3];
		var one_over;
		$("#sub").click(function(){ 
			var get_lng=document.getElementById("lng").value;
			var get_lat=document.getElementById("lat").value;
			var ishave=0;
		
			for(i=0;i<contents.length;i++){
				if(contents[i].lng==get_lng&&contents[i].lat==get_lat){map.setCenter(contents[i]);ishave=1;}
				}
			if(ishave==0){alert("您搜索的设备不存在");}
		});
		
		map.enableScrollWheelZoom();		  //启用滚轮放大缩小，默认禁用。 
		map.disableDoubleClickZoom();         //禁用双击放大,默认启用。
		map.enableKeyboard();				  //启用键盘操作，默认禁用。键盘的上、下、左、右键可连续移动地图。同时按下其中两个键可使地图进行对角移。PgUp、PgDn、Home和End键会使地图平移其1/2的大小。+、-键会使地图放大或缩小一级。
		
		
	;(function(){
		//信息窗
		var sContent ="<p class='content'>经度:"+contents[0].lng+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp纬度:"+contents[0].lat+
					"</p><input type=button value='气温' id=btn_test1 onclick=getJFreeChar1()>"+
					"<input type=button value='水温' id=btn_test2 onclick=getJFreeChar2()>"+
					"<input type=button value='湿度' id=btn_test3 onclick=getJFreeChar3()>"+
					"<input type=button value='待添加' id=btn_test4 onclick=getJFreeChar4()>"+
					"<input type=button value='烟雾' id=btn_test5 onclick=getJFreeChar5()>"+
					"<input type=button value='大气压强' id=btn_test6 onclick=getJFreeChar6()>"+
					"<input type=button value='降水量' id=btn_test7 onclick=getJFreeChar7()>"+
					"<input type=button value='历史' class='btn_test8'>"+
					"<div>"+
					"<img id='temp0' src='temper.png' width=500 height=250 border=0/>"+
					"<div id='temp1' width=500 height=250 style='border:1px red;'></div>"+
					"<div id='temp2' width=500 height=250 style='border:1px red;'></div>"+
					"<div id='temp3' width=500 height=250 style='border:1px red;'></div>"+
					"<div id='temp4' width=500 height=250 style='border:1px red;'></div>"+
					"<div id='temp5' width=500 height=250 style='border:1px red;'></div>"+
					"<div id='temp6' width=500 height=250 style='border:1px red;'></div>"+
					"<div id='temp7' width=500 height=250 style='border:1px red;'></div>"+
					"</div>";
		var opts = {
		width : 500,     // 信息窗口宽度
		height: 350,     // 信息窗口高度
		enableAutoPan: false
		}
		//创建信息窗口
		var infoWindow1 = new BMap.InfoWindow(sContent,opts);
		var temporaryListener=false;//临时监听变量
		marker1.addEventListener("click", function(){
			map.setZoom(13);
			map.panTo(new BMap.Point(marker1.getPosition().lng+0.1, marker1.getPosition().lat+0.03));
			this.openInfoWindow(infoWindow1);
			if(temporaryListener==false){
				infoWindow1.addEventListener("open",function ifw1(){//当地图打开后再添加监听，调整执行顺序
					var $moreblock=$(".moreblock");
					$('.btn_test8').click(function(){
						$moreblock.css("display","block");
						});  
					});
				//打开一次操作完里面的监听，就要删除外部监听，目的是为了实现内部监听，当内部坚挺绑定好立即删除外部监听 
				infoWindow1.removeEventListener("open",ifw1());
				temporaryListener=true;
				}
			
			});	
		})();		
	
		
		
		//坐标点实时信息
		var ajax,ajax1,ajax2,ajax3,ajax4,ajax5,ajax6,i1=i2=i3=i4=i5=i6=i7=0;
		
		function getJFreeChar1(){  
			$(".spot1").css("display","block");
			$(".spot1").siblings().css("display","none");
			$("#temp1").css("display","block");
			$("#temp1").siblings().css("display","none");
			document.getElementById("spot11").src = document.getElementById("hidText").value + ajax;
				$(document).ready(function() {
					Highcharts.setOptions({
						global: {
							useUTC: false
						}
					});
				
					var chart;
					$('#temp1').highcharts({
						chart: {
							//width:480,
                    		height:240,
							type: 'spline',
							animation: Highcharts.svg, // don't animate in old IE
							marginRight: 10,
							events: {
								load: function() {
				
									// set up the updating of the chart each second
									var series = this.series[0];
									var i = 1;
									var ajax;
									setInterval(function() {
										i++;
										$.post('../tem_gas',{index:i},function(ajaxdata){
											ajax=ajaxdata.data;
						    		    },"json");
										var x = (new Date()).getTime(), // current time
											y = Math.random()*10+20;
										if(i>3){
											y = ajax;
										}
										series.addPoint([x, y], true, true);
									}, 2000);
								}
							}
						},
						title: {
							text: '气温'
						},
						xAxis: {
							type: 'datetime',
							tickPixelInterval: 100,
						},
						yAxis: {
							title: {
								text: 'Value'
							},
							plotLines: [{
								value: 0,
								width: 1,
								color: '#808080'
							}]
						},
						tooltip: {
							formatter: function() {
									return '<b>'+ this.series.name +'</b><br/>'+
									Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
									Highcharts.numberFormat(this.y, 2);
							}
						},
						legend: {
							enabled: false
						},
						exporting: {
							enabled: false
						},
						series: [{
							name: '气温',
							data: (function() {
								// generate an array of random data
								var data = [],
									time = (new Date()).getTime(),
									i;
				
								for (i = -19; i <= 0; i++) {
									data.push({
										x: time + i * 2000,
										y: Math.random()*10+20
									});
								}
								return data;
							})()
						}]
					});
				});
		}
		function getJFreeChar2(){                     
			$(".spot2").css("display","block");
			$(".spot2").siblings().css("display","none");
			$("#temp2").css("display","block");
			$("#temp2").siblings().css("display","none");
			document.getElementById("spot22").src = document.getElementById("hidText").value + ajax1;
				$(document).ready(function() {
					Highcharts.setOptions({
						global: {
							useUTC: false
						}
					});
				
					var chart;
					$('#temp2').highcharts({
						chart: {
							width:480,
                    		height:240,
							type: 'spline',
							animation: Highcharts.svg, // don't animate in old IE
							marginRight: 10,
							events: {
								load: function() {
				
									// set up the updating of the chart each second
									var series = this.series[0];
									var i = 1;
									var ajax;
									setInterval(function() {
										i++;
										$.post('../tem_water',{index:i},function(ajaxdata){
											ajax=ajaxdata.data;
						    		    },"json");
										var x = (new Date()).getTime(), // current time
											y = 20;//Math.random()*10+20;
										if(i>3){
											y = ajax;
										}
										series.addPoint([x, y], true, true);
									}, 2000);
								}
							}
						},
						title: {
							text: '水温'
						},
						xAxis: {
							type: 'datetime',
							tickPixelInterval: 100,
						},
						yAxis: {
							title: {
								text: 'Value'
							},
							plotLines: [{
								value: 0,
								width: 1,
								color: '#808080'
							}]
						},
						tooltip: {
							formatter: function() {
									return '<b>'+ this.series.name +'</b><br/>'+
									Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
									Highcharts.numberFormat(this.y, 2);
							}
						},
						legend: {
							enabled: false
						},
						exporting: {
							enabled: false
						},
						series: [{
							name: '水温',
							data: (function() {
								// generate an array of random data
								var data = [],
									time = (new Date()).getTime(),
									i;
				
								for (i = -19; i <= 0; i++) {
									data.push({
										x: time + i * 2000,
										y: 20//Math.random()*10+20
									});
								}
								return data;
							})()
						}]
					});
				});
		}
		function getJFreeChar3(){            
	       	$(".spot3").css("display","block");
			$(".spot3").siblings().css("display","none");
			$("#temp3").css("display","block");
			$("#temp3").siblings().css("display","none");
			document.getElementById("spot33").src = document.getElementById("hidText").value + ajax2;
					$(document).ready(function() {
					Highcharts.setOptions({
						global: {
							useUTC: false
						}
					});
				
					var chart;
					$('#temp3').highcharts({
						chart: {
							width:480,
                    		height:240,
							type: 'spline',
							animation: Highcharts.svg, // don't animate in old IE
							marginRight: 10,
							events: {
								load: function() {
				
									// set up the updating of the chart each second
									var series = this.series[0];
									var i = 1;
									var ajax;
									setInterval(function() {
										i++;
										$.post('../hum',{index:i},function(ajaxdata){
											ajax=ajaxdata.data;
						    		    },"json");
										var x = (new Date()).getTime(), // current time
											y = Math.random()*10+20;
										if(i>3){
											y = ajax;
										}
										series.addPoint([x, y], true, true);
									}, 2000);
								}
							}
						},
						title: {
							text: '湿度'
						},
						xAxis: {
							type: 'datetime',
							tickPixelInterval: 100,
						},
						yAxis: {
							title: {
								text: 'Value'
							},
							plotLines: [{
								value: 0,
								width: 1,
								color: '#808080'
							}]
						},
						tooltip: {
							formatter: function() {
									return '<b>'+ this.series.name +'</b><br/>'+
									Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
									Highcharts.numberFormat(this.y, 2);
							}
						},
						legend: {
							enabled: false
						},
						exporting: {
							enabled: false
						},
						series: [{
							name: '湿度',
							data: (function() {
								// generate an array of random data
								var data = [],
									time = (new Date()).getTime(),
									i;
				
								for (i = -19; i <= 0; i++) {
									data.push({
										x: time + i * 2000,
										y: Math.random()*10+20
									});
								}
								return data;
							})()
						}]
					});
				});
		}
		/*function getJFreeChar4(){             
	       	$(".spot4").css("display","block");
			$(".spot4").siblings().css("display","none");
			$("#temp4").css("display","block");
			$("#temp4").siblings().css("display","none");
			document.getElementById("spot44").src = document.getElementById("hidText").value + ajax3;
				$(document).ready(function() {
					Highcharts.setOptions({
						global: {
							useUTC: false
						}
					});
				
					var chart;
					$('#temp4').highcharts({
						chart: {
							width:480,
                    		height:240,
							type: 'spline',
							animation: Highcharts.svg, // don't animate in old IE
							marginRight: 10,
							events: {
								load: function() {
				
									// set up the updating of the chart each second
									var series = this.series[0];
									var i = 1;
									var ajax;
									setInterval(function() {
										i++;
										$.post('../water_line',{index:i},function(ajaxdata){
											ajax=ajaxdata.data;
						    		    },"json");
										var x = (new Date()).getTime(), // current time
											y = Math.random()*10+20;
										if(i>3){
											y = ajax;
										}
										series.addPoint([x, y], true, true);
									}, 2000);
								}
							}
						},
						title: {
							text: '水位'
						},
						xAxis: {
							type: 'datetime',
							tickPixelInterval: 100,
						},
						yAxis: {
							title: {
								text: 'Value'
							},
							plotLines: [{
								value: 0,
								width: 1,
								color: '#808080'
							}]
						},
						tooltip: {
							formatter: function() {
									return '<b>'+ this.series.name +'</b><br/>'+
									Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
									Highcharts.numberFormat(this.y, 2);
							}
						},
						legend: {
							enabled: false
						},
						exporting: {
							enabled: false
						},
						series: [{
							name: '水位',
							data: (function() {
								// generate an array of random data
								var data = [],
									time = (new Date()).getTime(),
									i;
				
								for (i = -19; i <= 0; i++) {
									data.push({
										x: time + i * 2000,
										y: Math.random()*10+20
									});
								}
								return data;
							})()
						}]
					});
				});
		}*/
		function getJFreeChar5(){            
	       	$(".spot5").css("display","block");
			$(".spot5").siblings().css("display","none");
			$("#temp5").css("display","block");
			$("#temp5").siblings().css("display","none");
			document.getElementById("spot55").src = document.getElementById("hidText").value + ajax4;
					$(document).ready(function() {
					Highcharts.setOptions({
						global: {
							useUTC: false
						}
					});
				
					var chart;
					$('#temp5').highcharts({
						chart: {
							width:480,
                    		height:240,
							type: 'spline',
							animation: Highcharts.svg, // don't animate in old IE
							marginRight: 10,
							events: {
								load: function() {
				
									// set up the updating of the chart each second
									var series = this.series[0];
									var i = 1;
									var ajax;
									setInterval(function() {
										i++;
										$.post('../somke',{index:i},function(ajaxdata){
											ajax=ajaxdata.data;
						    		    },"json");
										var x = (new Date()).getTime(), // current time
											y = Math.random()*10+40;
										if(i>3){
											y = ajax;
										}
										series.addPoint([x, y], true, true);
									}, 2000);
								}
							}
						},
						title: {
							text: '烟雾'
						},
						xAxis: {
							type: 'datetime',
							tickPixelInterval: 100,
						},
						yAxis: {
							title: {
								text: 'Value'
							},
							plotLines: [{
								value: 0,
								width: 1,
								color: '#808080'
							}]
						},
						tooltip: {
							formatter: function() {
									return '<b>'+ this.series.name +'</b><br/>'+
									Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
									Highcharts.numberFormat(this.y, 2);
							}
						},
						legend: {
							enabled: false
						},
						exporting: {
							enabled: false
						},
						series: [{
							name: '烟雾',
							data: (function() {
								// generate an array of random data
								var data = [],
									time = (new Date()).getTime(),
									i;
				
								for (i = -19; i <= 0; i++) {
									data.push({
										x: time + i * 2000,
										y: Math.random()*10+40
									});
								}
								return data;
							})()
						}]
					});
				});
		}
		function getJFreeChar6(){             
	       	$(".spot6").css("display","block");
			$(".spot6").siblings().css("display","none");
			$("#temp6").css("display","block");
			$("#temp6").siblings().css("display","none");
			document.getElementById("spot66").src = document.getElementById("hidText").value + ajax5;
					$(document).ready(function() {
					Highcharts.setOptions({
						global: {
							useUTC: false
						}
					});
				
					var chart;
					$('#temp6').highcharts({
						chart: {
							width:480,
                    		height:240,
							type: 'spline',
							animation: Highcharts.svg, // don't animate in old IE
							marginRight: 10,
							events: {
								load: function() {
				
									// set up the updating of the chart each second
									var series = this.series[0];
									var i = 1;
									var ajax;
									setInterval(function() {
										i++;
										$.post('../atmos',{index:i},function(ajaxdata){
											ajax=ajaxdata.data;
						    		    },"json");
										var x = (new Date()).getTime(), // current time
											y = Math.random()*0.01+1;
										if(i>3){
											y = ajax;
										}
										series.addPoint([x, y], true, true);
									}, 2000);
								}
							}
						},
						title: {
							text: '大气压强'
						},
						xAxis: {
							type: 'datetime',
							tickPixelInterval: 100,
						},
						yAxis: {
							title: {
								text: 'Value'
							},
							plotLines: [{
								value: 0,
								width: 1,
								color: '#808080'
							}]
						},
						tooltip: {
							formatter: function() {
									return '<b>'+ this.series.name +'</b><br/>'+
									Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
									Highcharts.numberFormat(this.y, 2);
							}
						},
						legend: {
							enabled: false
						},
						exporting: {
							enabled: false
						},
						series: [{
							name: '大气压强',
							data: (function() {
								// generate an array of random data
								var data = [],
									time = (new Date()).getTime(),
									i;
				
								for (i = -19; i <= 0; i++) {
									data.push({
										x: time + i * 2000,
										y: Math.random()*0.01+1
									});
								}
								return data;
							})()
						}]
					});
				});
		}
		function getJFreeChar7(){             
	       	$(".spot7").css("display","block");
			$(".spot7").siblings().css("display","none");
			$("#temp7").css("display","block");
			$("#temp7").siblings().css("display","none");
			document.getElementById("spot77").src = document.getElementById("hidText").value + ajax6;
					$(document).ready(function() {
					Highcharts.setOptions({
						global: {
							useUTC: false
						}
					});
				
					var chart;
					$('#temp7').highcharts({
						chart: {
							width:480,
                    		height:240,
							type: 'spline',
							animation: Highcharts.svg, // don't animate in old IE
							marginRight: 10,
							events: {
								load: function() {
				
									// set up the updating of the chart each second
									var series = this.series[0];
									var i = 1;
									var ajax;
									setInterval(function() {
										i++;
										$.post('../prec',{index:i},function(ajaxdata){
											ajax=ajaxdata.data;
						    		    },"json");
										var x = (new Date()).getTime(), // current time
											y = Math.random()*100+Math.random()*10+3700;
										if(i>3){
											y = ajax;
										}
										series.addPoint([x, y], true, true);
									}, 2000);
								}
							}
						},
						title: {
							text: '降水量'
						},
						xAxis: {
							type: 'datetime',
							tickPixelInterval: 100,
						},
						yAxis: {
							title: {
								text: 'Value'
							},
							plotLines: [{
								value: 0,
								width: 1,
								color: '#808080'
							}]
						},
						tooltip: {
							formatter: function() {
									return '<b>'+ this.series.name +'</b><br/>'+
									Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
									Highcharts.numberFormat(this.y, 2);
							}
						},
						legend: {
							enabled: false
						},
						exporting: {
							enabled: false
						},
						series: [{
							name: '降水量',
							data: (function() {
								// generate an array of random data
								var data = [],
									time = (new Date()).getTime(),
									i;
				
								for (i = -19; i <= 0; i++) {
									data.push({
										x: time + i * 2000,
										y: Math.random()*100+Math.random()*10+3700
									});
								}
								return data;
							})()
						}]
					});
				});
		}
		$(function(){
			$.post('../tem_gas1',{page:0},function(data){
				ajax = data;
			});
			$.post('../tem_water1',{page:0},function(data){
				ajax1 = data;
			});
			$.post('../hum1',{page:0},function(data){
				ajax2 = data;
			});
//			$.post('../water_line1',{page:0},function(data){
//				ajax3 = data;
//			});
			$.post('../somke1',{page:0},function(data){
				ajax4 = data;
			});
			$.post('../atmos1',{page:0},function(data){
				ajax5 = data;
			});
			$.post('../prec1',{page:0},function(data){
				ajax6 = data;
			});
			
		//关闭右部窗口
		;(function(){
			$(".close").click(function(){
				$(".moreblock").css("display","none");
				});
			
		})();	
		
		
		
		//信息窗
		var new_content ="<div class='newMarkerBlock'><p class='newMarkerTitle'>请选择传感器类型</p><div class='turn_left'><img src='img/button/left.png'/></div><div class='newMarkerConfirm'>添加</div><div class='turn_right'><img src='img/button/right.png'/></div><div class='newMarkerContent'><ul class='newMarkerScroll'><li>温度传感器</li><li>湿度传感器</li><li>水质检测器</li><li>风向传感器</li><li>光学传感器</li><li>PM2.5传感器</li></ul></div></div>";
		var new_opts = {
		width : 220,     // 信息窗口宽度
		height: 140,     // 信息窗口高度
		enableMessage:false
		}
		
		//创建信息窗口
		//var new_infoWindow1 = new BMap.InfoWindow(new_content,new_opts);
		//marker1.addEventListener("click", function(){this.openInfoWindow(infoWindow1);});
		

	
		//地图工具
		var $btn = $("#map_manager");
		var btn_manager3=0;
		var navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT});//添加默平移缩放控件（包括平移、缩放按钮和滑块）。改默认为右上角
		$btn.children(":eq(0)").click(function(){//为范围查询按钮添加事件
			map_manager_btu_style($(this));
			drawingManager.open();//开启地图绘制功能
			});
		
		$btn.children(":eq(1)").click(function(){//为添加坐标点按钮添加事件
			map_manager_btu_style($(this));
			map.addEventListener("click",newpoint=function(e){
				var leixing;
				var lng,lat;
				var newmarker = new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat));
				map.addOverlay(newmarker);
				var new_infoWindow = new BMap.InfoWindow(new_content,new_opts);	
				
				new_infoWindow.addEventListener("open", abc=function(){
					var $scroll = $('.newMarkerContent ul');
					var $left = $('.turn_left');
					var $right = $('.turn_right');	
					var $confirm = $('.newMarkerConfirm');
					var left=0;
					$left.click(function(){
						if(left>=-4){
							$scroll.animate({"left":"-=180px"},500);
							left--;
							document.title=left;
							}
						});
					$right.click(function(){
						if(left<0){
						$scroll.animate({"left":"+=180px"},500);
							left++;
							document.title=left;
							}
						});
					$confirm.mouseenter(function(){$confirm.css("color","#F00")});
					$confirm.mouseleave(function(){$confirm.css("color","#000")});
					$confirm.click(function(){ 
						switch (left){
							case 0: $.post("../db",{leixing:0,lng:e.point.lng,lat:e.point.lat}); break;
							case -1: $.post("../db",{leixing:1,lng:e.point.lng,lat:e.point.lat}); break;
							case -2: $.post("../db",{leixing:2,lng:e.point.lng,lat:e.point.lat}); break;
							case -3: $.post("../db",{leixing:3,lng:e.point.lng,lat:e.point.lat}); break;
							case -4: $.post("../db",{leixing:4,lng:e.point.lng,lat:e.point.lat}); break;
							case -5: $.post("../db",{leixing:5,lng:e.point.lng,lat:e.point.lat}); break;
							default: break;
							}
						new_infoWindow=null;
						newmarker.closeInfoWindow(new_infoWindow);
						new_infoWindow.removeEventListener(abc);
						})
					});
				newmarker.openInfoWindow(new_infoWindow);
				map.removeEventListener("click",newpoint);
				map_manager_btu_clear();//按钮样式恢复原色
				});
			});
		$btn.children(":eq(2)").click(function(){//为查询坐标点按钮添加事件
			map_manager_btu_style($(this));
			$("#research").toggle();
			map_manager_btu_clear();
			});
		$btn.children(":eq(3)").click(function(){//为查询坐标点按钮添加事件
			
			if(btn_manager3==0){map.addControl(navigation);map_manager_btu_style($(this));btn_manager3=1;}
			else{map.removeControl(navigation);map_manager_btu_clear();btn_manager3=0;}	
			
			});
		$btn.children(":eq(4)").click(function(){//文件下载
			map_manager_btu_style($(this));
			});
		function map_manager_btu_style(this_btu){
			for(j=0;j<4;j++){//按钮样式
				if(this_btu.index()==j){$btn.children(":eq("+j+")").children(":eq(0)").hide();$btn.children(":eq("+j+")").children(":eq(1)").show();}
				else{$btn.children(":eq("+j+")").children(":eq(0)").show();$btn.children(":eq("+j+")").children(":eq(1)").hide();}
				}
			}
		function map_manager_btu_clear(){
			for(j=0;j<4;j++){//清空所有按钮按下的样式	
				$btn.children(":eq("+j+")").children(":eq(0)").show();$btn.children(":eq("+j+")").children(":eq(1)").hide();
				}
			}
		
		
	
		//范围搜索矩形绘制
		var styleOptions = {
	     strokeColor:"red",    //边线颜色。
	     fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
	     strokeWeight: 3,       //边线的宽度，以像素为单位。
	     strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
	     fillOpacity: 0.2,      //填充的透明度，取值范围0 - 1。
	     strokeStyle: 'solid' //边线的样式，solid或dashed。
	 	}
		var drawingManager = new BMapLib.DrawingManager(map,{ rectangleOptions: styleOptions}); //矩形的样式
		drawingManager.setDrawingMode(BMAP_DRAWING_RECTANGLE);//开启矩形绘制功能
		drawingManager.addEventListener('rectanglecomplete', function(Polygon){    //为范围搜索绘图添加事件,当矩形完成后触发事件
			one_over=Polygon;
			var sw_lng=Polygon.getBounds().getSouthWest().lng;    //获得矩形西南角精度
			var sw_lat=Polygon.getBounds().getSouthWest().lat;    //获得矩形西南角纬度
			var ne_lng=Polygon.getBounds().getNorthEast().lng;    //获得矩形东北角精度
			var ne_lat=Polygon.getBounds().getNorthEast().lat;    //获得矩形东北角精度
			drawingManager.close();
			map.removeOverlay(one_over);//清除自己画的矩形覆盖物
			map_manager_btu_clear();//按钮样式恢复原色
			$(".more_content").children().css("display","none");
			for(i=0;i<contents.length;i++){
				if(contents[i].lng>sw_lng&&contents[i].lat>sw_lat&&contents[i].lng<ne_lng&&contents[i].lat<ne_lat){
						$(".more_content").children(":eq("+(i+3)+")").css("display","block");
						$(".more_content").children(":eq("+(i+3)+")").text("坐标点"+i+"     经度："+contents[i].lng+"     纬度："+contents[i].lat)
					}
				}
			});
			
		});
	</script>
</body>
</html>



