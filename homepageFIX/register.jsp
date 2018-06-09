<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*,java.io.*"%>
<%
String userName=request.getParameter("userName").trim();
String password=request.getParameter("password").trim();
String str = userName+" "+password; 
	String filename = request.getSession().getServletContext().getRealPath("/user.txt"); 
	//写文件 
	java.io.File f = new java.io.File(filename); 
	if(!f.exists())//如果文件不存在，则建立 
	{ 
	  f.createNewFile(); 
	} 
	
	try 
	{ 
	  PrintWriter pw = new PrintWriter(new FileOutputStream(filename,true)); //true的作用是防止覆盖文件
	  pw.println(str);//写内容 
	  pw.close(); 
	} 
	catch(IOException e) 
	{ 
	  out.println(e.getMessage()); 
	} 
	response.sendRedirect("registerSuccess.html");
%>



