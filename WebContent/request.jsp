<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>request</title>

	<link rel="stylesheet" href="assets/demo.css">
	<link rel="stylesheet" href="assets/form-login.css">

</head>
<body>
	<header>
		<h1 style="padding-left:29%;font-size:50px" >Attendance Management</h1>
        
    </header>
 <ul>
 		 <li class="dropdown">
          <a href="javascript:void(0)" class="dropbtn">Admin</a>
				<div class="dropdown-content">
				  <a href="admin-reg.html">Admin Registration</a>
				  <a href="admin-login.html">Admin Login</a>
				</div>
         </li>
		
         
    </ul>


<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%

PreparedStatement ps = null;
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_attendance","root","dbms");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from staff where status is null ");
%>

<table style="width:60%" border="2">
<tr><th>Name</th>
<th>email</th>
<th>Desicion</th>
<th>submit</th></tr>
<tr>
<%
while(rs.next())
{
	%><td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<form action="response.jsp" method="post">
	<input type="hidden" name="name" value="<%= rs.getString(1) %>   ">
	<input type="hidden" name="email" value="<%= rs.getString(2) %>   ">
	<td><select name="dec" >
	<option value="accept">Accept</option>
	<option value="reject">Reject</option>
	</select>
	</td>
	<td><button type="submit">Submit</button></td>
	</form>
	</tr>
	<%	}
%>


</table>

  
</body>

</html>
