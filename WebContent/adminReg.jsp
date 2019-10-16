<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminReg</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%
 String userid=request.getParameter("name");
String username=request.getParameter("email"); 
String useremail=request.getParameter("password"); 
String useremail1=request.getParameter("rpassword"); 
if (username!=null) {
	try{
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_attendance","root","dbms");
		Statement smt= con.createStatement();
		ResultSet rs=smt.executeQuery("select * from admin where email='"+username+"'");
		if(rs.next())
		{
			out.println("<script> alert('User is already exists');window.history.back();</script>");
		}
		
		if (!useremail.equals(useremail1)) {
			out.println("<script> alert('Passwords not matched!!'); window.history.back();</script>");
			//System.exit(0);
		}
		else  
		{
			int i = smt.executeUpdate("insert into admin(`name`,`email`,`password`,`rpassword`) values('"+userid+"','"+username+"','"+useremail+"','"+useremail1+"')");
			out.println("<script> alert('Registered is successfully'); window.location.href='admin-login.html';</script>");
		}
		   
		   
	   }
	   catch(Exception e)
	   {
	      out.print(e);
	      e.printStackTrace();
	   }
	}
//window.location.href='form-login.html';
    

%>
<br/>

</body>
</html>