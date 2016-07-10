// JavaScript Document 制作人：班宏伟
// 百度地图API功能
$(function(){
var i=j=0;

var map = new BMap.Map("allmap");
map.centerAndZoom(new BMap.Point(114.282, 38.233), 14);



var point1=new BMap.Point(114.281713, 38.234134);//创建坐标
var point2=new BMap.Point(114.276682, 38.230392);//创建坐标
var point3=new BMap.Point(114.283868, 38.230959);//创建坐标
var marker1 = new BMap.Marker(point1);  // 创建标注1
var marker2 = new BMap.Marker(point2);  // 创建标注2
var marker3 = new BMap.Marker(point3);  // 创建标注3
var marker_size =new BMap.Size(17,25);									//图标大小
var anchor_size =new BMap.Size(9,25);									//图标偏移位置左上角相对于定位点
var marker_icon1=new BMap.Icon("img/marker/111.png",marker_size);		//创建一个自定义标注点图标
/*
var marker_icon2=new BMap.Icon("img/marker/111.png",marker_size);		//创建一个自定义标注点图标
var marker_icon3=new BMap.Icon("img/marker/111.png",marker_size);		//创建一个自定义标注点图标
var marker_icon4=new BMap.Icon("img/marker/111.png",marker_size);		//创建一个自定义标注点图标
var marker_icon5=new BMap.Icon("img/marker/111.png",marker_size);		//创建一个自定义标注点图标
var marker_icon6=new BMap.Icon("img/marker/111.png",marker_size);		//创建一个自定义标注点图标
var marker_icon7=new BMap.Icon("img/marker/111.png",marker_size);		//创建一个自定义标注点图标
var marker_icon8=new BMap.Icon("img/marker/111.png",marker_size);		//创建一个自定义标注点图标
var marker_icon9=new BMap.Icon("img/marker/111.png",marker_size);		//创建一个自定义标注点图标
*/
marker_icon1.setAnchor(anchor_size);
marker2.setIcon(marker_icon1);
marker3.setIcon(marker_icon1);
marker3.getOffset();

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
  




//信息窗
var sContent ="<p class='content'>精度:"+contents[0].lng+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp纬度:"+contents[0].lat+"</p>"
				+"<img id='temp1' src='temp1.png' width=400 height=230 border=0/>";
var opts = {
  width : 400,     // 信息窗口宽度
  height: 300,     // 信息窗口高度
  title : "温度传感器" , // 信息窗口标题
}
//创建信息窗口
var infoWindow1 = new BMap.InfoWindow(sContent,opts);
marker1.addEventListener("click", function(){this.openInfoWindow(infoWindow1);});

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
		map.removeEventListener("click",newpoint);//清除其他带选中功能
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
	drawingManager.addEventListener('rectanglecomplete', function(Polygon){    //为范围搜索绘图添加事件
		one_over=Polygon;
		var sw_lng=Polygon.getBounds().getSouthWest().lng;    //获得矩形西南角精度
		var sw_lat=Polygon.getBounds().getSouthWest().lat;    //获得矩形西南角纬度
		var ne_lng=Polygon.getBounds().getNorthEast().lng;    //获得矩形东北角精度
		var ne_lat=Polygon.getBounds().getNorthEast().lat;    //获得矩形东北角精度
		drawingManager.close();
		map.removeOverlay(one_over);//清除自己画的矩形覆盖物
		map_manager_btu_clear();//按钮样式恢复原色
		for(i=0;i<contents.length;i++){
			if(contents[i].lng>sw_lng&&contents[i].lat>sw_lat&&contents[i].lng<ne_lng&&contents[i].lat<ne_lat){
				}
			}
		});
		
		
		
		
		
	




	});