<%@ include file="head1.jsp" %>

<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<% 

String name=(String)session.getAttribute("email");
String rmg="";
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_attendance","root","dbms");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from staff where email='"+name+"'");
while(rs.next())
{
	rmg=rs.getString(4);
}

%>
<h1><font color="black">Welcome to User: <%=name %></font></h1>
<h2><font color="black">Randomkey: <%=rmg %></font></h2>
<a href="view.jsp"><button>view_attendance</button></a>
<a href="manual.html"><button>Manual_attendance</button></a>
