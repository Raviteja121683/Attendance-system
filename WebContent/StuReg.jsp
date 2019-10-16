<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>StuReg</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%
 String NAME=request.getParameter("name");
String ID=request.getParameter("id"); 
String BRANCH=request.getParameter("branch"); 
String CLASS=request.getParameter("class"); 
String PASSWORD=request.getParameter("password"); 
String RPASSWORD=request.getParameter("rpassword"); 
if(ID!=null)
{
	try{
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_attendance","root","dbms");
		Statement smt= con.createStatement();
		ResultSet rs=smt.executeQuery("select * from student where id='"+ID+"'");
		if(rs.next())
		{
			out.println("<script> alert('User is already exists');window.history.back();</script>");
		}
		if (!PASSWORD.equals(RPASSWORD)) {
			out.println("<script> alert('Passwords not matched!!'); window.history.back();</script>");
			
		}
		else{
			int i = smt.executeUpdate("insert into student(`sname`,`id`,`spass`,`spass1`,`branch`,`class`) values('"+NAME+"','"+ID+"','"+PASSWORD+"','"+RPASSWORD+"','"+BRANCH+"','"+CLASS+"')");
			out.println("<script> alert('You Registered successfully!'); window.location.href='student-login.html';</script>");
			
		}
		

	}
	catch(Exception e)
	   {
	      out.print(e);
	      e.printStackTrace();
	   }
	
	}

%>


</body>
</html>