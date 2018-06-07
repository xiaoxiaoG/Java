<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*,java.io.*"%>
<%
	String userName=request.getParameter("userName").trim();
	String password=request.getParameter("password");
    String filename = request.getSession().getServletContext().getRealPath("/user.txt"); 
	boolean find=false;
	try{
		Scanner cin=new Scanner(new File(filename));
		while(cin.hasNextLine()){
			String line=cin.nextLine();
			String ss[]=line.split("\\s+");
			if(ss[0].equals(userName)&&ss[1].equals(password)){
				find=true;
				break;
			}
		}
		cin.close();		

	}catch(Exception e){}



	if(find){
		session.setAttribute("user",userName);
		response.sendRedirect("index.jsp");
	
	}else{
		response.sendRedirect("login.html");
	}

%>