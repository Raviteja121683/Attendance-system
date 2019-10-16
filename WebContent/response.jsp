<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%
String status=request.getParameter("dec");
String name=request.getParameter("name");
String email=request.getParameter("email");
out.println(status);
PreparedStatement ps = null;
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_attendance","root","dbms");
Statement smt= con.createStatement();
int i = smt.executeUpdate("update staff set status='"+status+"' where name='"+name+"' and email='"+email+"' ");
if(i!=0)
{
	response.sendRedirect("admin_home.jsp");
	}
%>
