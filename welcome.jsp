<%@page import="java.sql.*" %>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>

<%
String currUser = (String)session.getAttribute("username"); 
PreparedStatement pst;
String fname="";
String lname="";
int empId=0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","chaitu","chaitu123");
    pst = connection.prepareStatement("select firstname,lastname from bookstore where username=?");
    pst.setString(1,currUser);
    pst.executeUpdate();
    ResultSet rs = pst.executeQuery();
    if(rs.next()){
    	fname = rs.getString(1);
    	lname = rs.getString(2);
    	empId = rs.getInt(3);
    	//out.print(rs.getString(1)+" "+rs.getString(2));
    }
	out.print("<h3>Hello "+fname+" "+lname+"</h3>");
}catch(Exception e){
	e.printStackTrace();
}

%>
<h3><a href='logout.jsp'>Log out</a></h3>
<%
}
%>
