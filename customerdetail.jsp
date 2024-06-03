<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="customer.dao.CustomerDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <jsp:useBean id="customer"
  class="customer.bean.Customer" />

 <jsp:setProperty property="*" name="customer" />

 <%
 
 	CustomerDao customerDao = new CustomerDao();
   int status = customerDao.registerCustomer(customer);
   if (status > 0) {
    out.print("You are successfully registered");
    out.print("<a href='login.jsp'>click here to Login</a>");
   }
 %>
</body>
</html>