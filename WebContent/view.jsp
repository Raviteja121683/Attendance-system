<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view</title>
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

<% String userid = session.getAttribute("key").toString();
  int g=Integer.parseInt(userid);
  String gm = session.getAttribute("GM").toString();
%>
<form method="post">
<table border="3">
<tr>
<th>Student Name</th>
<th>Stduent ID</th>
<th>Branch</th>
<th>Class</th>
<th>Staff Random_key</th>
<th>Time-Stamp</th>
<th>Mac Address</th>
<th>Ip Address</th>
</tr>
<%
out.println("<h3>Attendance list for "+gm+"</h3>");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_attendance","root","dbms");
Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select distinct list.IDN,student.sname,list.Spassword,list.ran,student.curtime,student.branch,student.class,student.mac,student.ip from list,staff,student where list.ran='"+g+"' and list.IDN=student.id");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getInt(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(9) %></td>
</tr>
<%
}
%>
</table>
<%
rs.close();
st.close();
con.close();
%>
</form>
<center>
<button onclick="myFunction()">Print this page</button>
</center>
</body>
</html>