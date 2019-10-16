<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>StuLogin</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>



<%
InetAddress inetAddress;
StringBuilder sb = new StringBuilder();
String macAddress="";
//String ipAddress="";
String ipAddress=request.getParameter("ipadd");
int i=0;
try {
    inetAddress=InetAddress.getLocalHost();
    //ipAddress=inetAddress.getHostAddress();
    NetworkInterface network=NetworkInterface.getByInetAddress(inetAddress);
     byte[] hw=network.getHardwareAddress();
    for(i=0; i<hw.length; i++)
        sb.append(String.format("%02X%s", hw[i], (i < hw.length - 1) ? "-" : ""));   
    macAddress=sb.toString();
} catch(Exception e) {
    out.print("<br/>"+e.toString());
    macAddress="-";
}
//out.print("<br/>"+ipAddress);
//out.print("<br/>"+macAddress);

PreparedStatement ps = null;
//out.println(ipAddress);

//session.getAttribute("ipaddress").toString();
String ID=request.getParameter("id");
String pass=request.getParameter("password");
String KEY=request.getParameter("key");
int RKEY=Integer.parseInt(KEY);
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/stu_attendance","root","dbms");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select student.id,student.spass,staff.randomkey,student.sname from student,staff where student.id='"+ID+"' and student.spass='"+pass+"' and staff.randomkey='"+RKEY+"'");
String sql="Update student set curtime=now(),mac='"+macAddress+"',ip='"+ipAddress+"' where id='"+ID+"'";
ps = con.prepareStatement(sql);
int j = ps.executeUpdate();

if(rs.next()){
	if(rs.getString(1).equalsIgnoreCase(ID) && rs.getString(2).equals(pass)){
		//out.println("successfully login  ");
		
		if(rs.getInt(3)==RKEY){
			//out.println("<h3 style=\"color:green\">PRESENT<h3>");
			out.println("<script> alert('You Successfully Make Attendance!'); window.location.href='student-login.html';</script>");
			st.executeUpdate("insert into list(`IDN`,`SNAME`,`Spassword`,`ran`,`mac`,`ip`) values('"+ID+"','"+rs.getString(4)+"','"+pass+"','"+RKEY+"','"+macAddress+"','"+ipAddress+"')");
		}
		else{
			out.println("<script> alert('You Entered Invalid Details!'); window.location.href='student-login.html';</script>");
		}
	}
}
else{
	//out.println("you entered wrong details plz login with correct details "+ID+""+pass);
	out.println("<script> alert('You Entered Invalid Details!'); window.location.href='student-login.html';</script>");
}
%>
</body>
</html>	