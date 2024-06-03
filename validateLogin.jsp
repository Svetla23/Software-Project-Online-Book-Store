
<%@ page import ="java.sql.*" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
//out.println(name+" "+username+" "+password);
PreparedStatement statement;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","bookstoreapp","admin123");
	//String query = "insert into demologin values(?,?,?)"; //name,username,password
    statement = connection.prepareStatement("select * from users where username='" + username+ "' and password='" + password + "'");
    /*statement.setString(1, name);
	statement.setString(2,username);
	statement.setString(3, password);*/
	//statement.executeUpdate();
	//statement = connection.prepareStatement("select * from demologin");
    ResultSet rs = statement.executeQuery();
    if (rs.next()) {
        session.setAttribute("username", username);
        response.sendRedirect("home.jsp");
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
    statement.close();
    connection.close();
}catch(Exception e){
	e.printStackTrace();
}

%>