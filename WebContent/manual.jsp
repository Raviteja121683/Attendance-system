<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manual</title>
<script>
function myFunction() {
    window.print();
}
</script>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%
String id=request.getParameter("id");
//String texts[] = new String(request.getParameter("id")).split(",");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_attendance","root","dbms");
Statement smt= con.createStatement();
//out.println(id);
String [] arrOfStr = id.split(",");	 
for (String a : arrOfStr)
{	
	smt.executeUpdate("insert into manual(`id`) values('"+a+"')");
	out.println(a+"</br>");
}

%>
<center>
<button onclick="myFunction()">Print this page</button>
</center>
</body>
</html>