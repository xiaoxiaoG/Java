<%@ page import="java.io.*" %>


<html> 
  <head> 
    <title>Lion互动网络==》JSP中读文件和写文件的例子</title> 
  </head> 
  <body> 
   <% 

//写文件 
String userName=request.getParameter("userName");
String password=request.getParameter("password");
String str = userName+" "+password; 
String filename = request.getSession().getServletContext().getRealPath("/user.txt"); 
java.io.File f = new java.io.File(filename); 
if(!f.exists())//如果文件不存，则建立 
{ 
  f.createNewFile(); 
} 

try 
{ 
  PrintWriter pw = new PrintWriter(new FileOutputStream(filename)); 
  pw.println(str);//写内容 
  pw.close(); 
} 
catch(IOException e) 
{ 
  out.println(e.getMessage()); 
} 

//读文件 
java.io.FileReader fr = new java.io.FileReader(f); 
char[] buffer = new char[10]; 
int length; //读出的字符数(一个中文为一个字符) 
//读文件内容 
out.write(filename+"<br>"); 
while((length=fr.read(buffer))!=-1) 
{ 
  //输出 
  out.write(buffer,0,length); 
} 
fr.close(); 
%> 

  </body> 
</html>