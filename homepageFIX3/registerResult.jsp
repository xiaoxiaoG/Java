<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*,java.io.*"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- TemplateBeginEditable name="doctitle" -->
<title>注册结果</title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
<style>
	html {
	  height: 100%;
	  width: 100%;
	}
/*设置页面背景色*/
	body {
	  height: 100%;
	  width: 100%;
	  margin: 0;
	  background: linear-gradient(#d4fc79,#96e6a1);
	}
	
/*将搜索框置于页面正中间*/
  .div1 {
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  -webkit-transform: translate3d(-50%, -50%, 0);
			  transform: translate3d(-50%, -50%, 0);
  }
</style>
<%String result=(String)session.getAttribute("result");%>
</head>

<body>
<div class="div1">
	<%
	if(result=="success")
	{
		out.println("<h2>注册成功，2秒后<a href='login.html'>跳转</a></h2>");
	}
	if(result=="fail")
	{
		out.println("<h2>注册失败，用户已存在，2秒后<a href='register.html'>跳转</a></h2>");
	}
	%>
</div>
<script language="javascript">
if("<%=session.getAttribute("result")%>"=="success")
  window.setTimeout("window.location='login.html'",2000);
if("<%=session.getAttribute("result")%>"=="fail")
  window.setTimeout("window.location='register.html'",2000);
</script>
</body>
</html>
