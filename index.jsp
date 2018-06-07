<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*,java.io.*"%>
<!doctype html>
<html lang="en">
<style>
	html {
	  height: 100%;
	  width: 100%;
	}
/*设置页面背景色*/
	body {
	  height: 95%;
	  width: 100%;
	  margin: 0;
	  background: linear-gradient(#d4fc79,#96e6a1);
	}
	
/*将搜索框置于页面正中间*/
  #div1 {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  -webkit-transform: translate3d(-50%, -50%, 0);
			  transform: translate3d(-50%, -50%, 0);
  }
/*消除div中元素之间的缝隙*/
  .inputSpan{
    font-size:0;
  }
/*使多个元素处于同一行*/
  .div-inline{
  	display:inline;
  }
/*设置选择框的样式*/
  .selsectStyle{
    border:solid #FFFFFF;
	background:#FFFFFF;
	border-width:17px;
	font-size:16px;
	color:#000000;
  }
/*设置文本框的样式*/
  .searchInputText{
    border:1px solid #ffffff;
	background:#FFFFFF;
	border-width:16px;
	font-size:16px;
  }
/*设置搜索按钮的样式*/
  .searchInputButton{
    border:1px solid #0099ff;
	background:#0099FF;
	border-width:16px;
	font-size:16px;
	color:#ffffff;
  }

/*设置SVG属性*/
  rect {
    fill: none;
    pointer-events: all;
}
/*挖空圆*/	
  circle {
    fill: none;
    stroke-width: 1px;
}

</style>
<head>
<meta charset="utf-8">
<title>我的主页</title>
<script src="https://d3js.org/d3.v3.min.js"></script><!--SVG粒子跟随-->
<!--<base target="_blank"><!--新页面打开-->
<link rel="Shortcut Icon" href="../picture/icon.jpg" type="image/x-icon"><!--浏览器icon图标-->
<%String user=(String)session.getAttribute("user");%>
</head>

<body onload="searchInputText.focus()"><!--让光标停在文本框中-->
<p>
    当前用户:
	<%=user%>
    &nbsp;
	<%
	if(user==null){
	
	out.println("<a href='login.html'>登陆</a>");
	
	}else
	{
	out.println("<a href='logout.jsp'>注销登陆</a>");
	}
	%>
</p>
<!--创建搜索模块-->
<div id="div1">
			<div class="div-inline inputSpan">
			  <select name="searchSelect" id="searchSelect" class="selsectStyle" style="outline:none">
				  <option value="https://www.baidu.com/s?wd=">百度</option>
				  <option value="https://s.taobao.com/search?q=">淘宝</option>
				  <option value="https://www.sogou.com/web?query=">搜狗</option>
			  </select>
			  <input type="text" plpaceholder="请输入搜索词" maxlength="100" id="searchInputText" class="searchInputText" onkeyup="onkeyup(event)" style="outline:none">
			  <input type="button" value="Search"  onclick="loading();" id="baiduClick" class="searchInputButton" style="outline:none">
			</div>
</div>
<script>
/*创建SVG粒子跟踪*/
var width = "100%",
    height = "100%";
var i = 0;
var svg = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height);
svg.append("rect")
    .attr("width", width)
    .attr("height", height)
    .on("ontouchstart" in document ? "touchmove" : "mousemove", particle);
function particle() {
  var m = d3.mouse(this);
  svg.insert("circle", "rect")
      .attr("cx", m[0])
      .attr("cy", m[1])
      .attr("r", 5) // 1e-6
      .style("stroke", d3.hsl(100, .1, .6))
      .style("stroke-opacity", 1)
    .transition()
      .duration(2000) 
      .ease(Math.sqrt)
      .attr("r", 50)
      .style("stroke-opacity", 1e-6)
    	.style("stroke-width",5)
      .remove();
  d3.event.preventDefault();
}
/*传入关键词，连接搜索引擎*/
function loading(){
       	var selectIndex=document.getElementById("searchSelect").selectedIndex;
		var selectValue=document.getElementById("searchSelect").options[selectIndex].value;
		var inputTextValue=document.getElementById("searchInputText").value;
        var url=selectValue+inputTextValue;
        window.open(url);
}
/*创建搜索框回车确认事件*/
document.onkeyup = function (e) {  
    if (window.event)//如果window.event对象存在，就以此事件对象为准  
        e = window.event;  
    var code = e.charCode || e.keyCode;  
    if (code == 13) {  
        //此处编写用户敲回车后的代码  
       	var selectIndex=document.getElementById("searchSelect").selectedIndex;
		var selectValue=document.getElementById("searchSelect").options[selectIndex].value;
		var inputTextValue=document.getElementById("searchInputText").value;
        var url=selectValue+inputTextValue;
        window.open(url);
    }  
} 

</script>
</body>
</html>
