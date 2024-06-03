<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN</title>
<link rel="stylesheet" href="style.css" />
</head>
<body>
<form method="post" action="validateLogin.jsp">
    <h1>ONLINE BOOK STORE</h1>
      <div class="formcontainer">
      <div class="container">
        <label><strong>Username</strong></label>
        <input type="text" placeholder="Enter Username" name="username" required>
        <label><strong>Password</strong></label>
        <input type="password" placeholder="Enter Password" name="password" required>
       
      </div>
      <button type="submit"><strong>LOGIN</strong></button>
      <div class="container" style="background-color: #eee">
       
      <p class="last"> Don't have an account? <a href="customerRegister.jsp">Click to Register</a></p>

</form>
</body>
</html>