<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stafflogin</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
//Random ran=new Random();
//int i=ran.nextInt(1000000);

	PreparedStatement ps = null;
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_attendance","root","dbms");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from admin where email='"+email+"' and password='"+password+"'");

String sql="Update admin set curtime=now() where email='"+email+"'";
ps = con.prepareStatement(sql);
int j = ps.executeUpdate();
if(rs.next()){
	if(rs.getString(2).equals(email) && rs.getString(3).equals(password)){
    session.setAttribute("email", email);
    response.sendRedirect("admin_home.jsp");
    
       
%>
<%
	}
}
else{
	//out.println("You entered wrong details.... Please check your Credentials ");
	out.println("<script> alert('Invalid User!'); window.location.href='admin-login.html';</script>");
}
%>


</body>
</html>