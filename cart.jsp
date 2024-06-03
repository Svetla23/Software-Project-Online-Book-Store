<%@page import="java.sql.*" %>
<%
    if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
%>
You are not logged in<br/>
<a href="login.jsp">Please Login</a>
<%} else {
%>

<html>

<head>
<title>LIST OF BOOKS</title>

<style>
#tb
{
background-color:lightgrey;
}
</style>
<link rel="stylesheet" href="style2.css"/>


</head>

<body bgcolor="lightyellow">
<center><h1>ONLINE BOOK STORE</h1></center>
<ul>
  <li><a href="home.jsp">Home</a></li>
  <li><a href="listbooks.jsp">LIST OF BOOKS</a></li>
  <li><a class="active" href="cart.jsp">CART</a></li>
  <li><a href="#orders">ORDERS</a></li>
  <li style="float:right;background-color:green"><a href="logout.jsp">LOGOUT</a></li>
</ul>
</body>

</html>
<%
String currUser = (String)session.getAttribute("username"); 
PreparedStatement pst;
Connection connection=null;
ResultSet rs=null;
ResultSet rs1=null;
int bookid=0;
String bookname="";
String author="";
String description="";
int isAdded=0;
int id=0;
float price=(float)0.0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","bookstoreapp","admin123");
	//pst = connection.prepareStatement("select username from users WHERE username=?");
	pst = connection.prepareStatement("select isaddedtocart,bookid from user_order WHERE username=?");
	pst.setString(1,currUser);
   // pst.executeUpdate();
    rs = pst.executeQuery();
    
 
	out.print("<br><table border='solid' cellpadding=25 id=tb>");

	out.print("<tr>");
	out.print("<th colspan=7 border=none>Catalog</th></tr>");
	out.print("<tr>");
	out.print("<th>Book ID</th>");
	out.print("<th>Book Name</th>");
	out.print("<th>Author</th>");
	out.print("<th>Description</th>");
	out.print("<th>Price </th>");
	out.print("<th>Remove from Cart </th>");
	out.print("<th>Buy now </th>");
	out.print("</tr>");
    while(rs.next()){
		id = rs.getInt(2);		
		//out.println(id);
		PreparedStatement pst1 = connection.prepareStatement("select bookid,bookname,author,description,price from books where bookid=?");
		pst1.setInt(1,id);
		rs1 = pst1.executeQuery();

    while(rs1.next()){
    	bookid = rs1.getInt(1);
    	bookname = rs1.getString(2);
    	author = rs1.getString(3);
    	description = rs1.getString(4);
    	price = rs1.getFloat(5);
    	//out.print(rs.getString(1)+" "+rs.getString(2));
    
	//out.print("<br>"+bookid+" "+bookname+" "+author+" "+description+" "+price);

	out.print("<tr>");
	out.print("<td>"+bookid+"</td>");
	out.print("<td>"+bookname+"</td>");
	out.print("<td>"+author+"</td>");
	out.print("<td>"+description+"</td>");
	out.print("<td>"+price+"</td>");
	out.print("<td><input type=button value=Remove onclick='add()'></td>");
	out.print("<td><input type=button value=Buy onclick='add()'></td>");
	out.print("</tr>");
    }
    }

	out.print("</table>");
    
    
}catch(Exception e){
	e.printStackTrace();
}

%>
<%
}
%>