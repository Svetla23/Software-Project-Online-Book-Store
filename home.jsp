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
	Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","bookstoreapp","admin123");
    pst = connection.prepareStatement("select firstname,lastname from bookstore where username=?");
    pst.setString(1,currUser);
   // pst.executeUpdate();
    ResultSet rs = pst.executeQuery();
    if(rs.next()){
    	fname = rs.getString(1);
    	lname = rs.getString(2);
    	//out.print(rs.getString(1)+" "+rs.getString(2));
    }
	//out.print("<br><h3>Hello "+fname+" "+lname+"</h3>");
}catch(Exception e){
	e.printStackTrace();
}

%>
<html>
<head>
<link rel="stylesheet" href="style2.css"/>

</head>
<body>
<center><h1>ONLINE BOOK STORE</h1></center>
<ul>
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="listbooks.jsp">LIST OF BOOKS</a></li>
  <li><a href="#cart">CART</a></li>
  <li><a href="#profile">ORDERS</a></li>
  <li style="float:right;background-color:green"><a href="logout.jsp">LOGOUT</a></li>
</ul><br>
<img src="books.jpg" alt="books"/>
<center><h2 style="font-family:Segoe Print">"A Room without books is like a body without soul - CICERO"</h2>
</center>
</body>
</html>
<%
}
%>