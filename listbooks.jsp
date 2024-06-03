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
<script>
function add()
{
alert('Added this book');
}
</script>
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
  <li><a class="active" href="listbooks.jsp">LIST OF BOOKS</a></li>
  <li><a href="cart.jsp">CART</a></li>
  <li><a href="#orders">ORDERS</a></li>
  <li style="float:right;background-color:green"><a href="logout.jsp">LOGOUT</a></li>
</ul>
</body>

</html>
<%
String currUser = (String)session.getAttribute("username"); 
PreparedStatement pst;
int bookid=0;
String bookname="";
String author="";
String description="";
float price=(float)0.0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","bookstoreapp","admin123");
    pst = connection.prepareStatement("select bookid,bookname,author,description,price from books");
   // pst.executeUpdate();
    ResultSet rs = pst.executeQuery();
	out.print("<br><table border='solid' cellpadding=25 id=tb>");

	out.print("<tr>");
	out.print("<th colspan=6 border=none>Catalog</th></tr>");
	out.print("<tr>");
	out.print("<th>Book ID</th>");
	out.print("<th>Book Name</th>");
	out.print("<th>Author</th>");
	out.print("<th>Description</th>");
	out.print("<th>Price </th>");
	out.print("<th>Add to cart </th>");
	out.print("</tr>");
    while(rs.next()){
    	bookid = rs.getInt(1);
    	bookname = rs.getString(2);
    	author = rs.getString(3);
    	description = rs.getString(4);
    	price = rs.getFloat(5);
    	//out.print(rs.getString(1)+" "+rs.getString(2));
    
	//out.print("<br>"+bookid+" "+bookname+" "+author+" "+description+" "+price);


	out.print("<tr>");
	out.print("<td>"+bookid+"</td>");
	out.print("<td>"+bookname+"</td>");
	out.print("<td>"+author+"</td>");
	out.print("<td>"+description+"</td>");
	out.print("<td>"+price+"</td>");
	out.print("<td><input type=button value=Add onclick='add()'></td>");
	out.print("</tr>");
    }

	out.print("</table>");
}catch(Exception e){
	e.printStackTrace();
}

%>
<%
}
%>