<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Registration</title>
        <link rel="stylesheet" href="style.css" />
    </head>

    <body>
        <form action="customerdetail.jsp" method="post">
            <h1>SIGN UP</h1>
      <div class="formcontainer">
      <div class="container">

        <label><strong>First name</strong></label>
        <input type="text" placeholder="Enter first name" name="firstname" required><br>
        <label><strong>Last name</strong></label>
        <input type="text" placeholder="Enter last name" name="lastname" required><br>
        <label><strong>Username</strong></label>
        <input type="text" placeholder="Enter Username" name="username" required><br>
        <label><strong>Password</strong></label>
        <input type="password" placeholder="Enter Password" name="password" required><br>
        <label><strong>Address</strong></label>
        <input type="text" placeholder="Enter address" name="address" required>
        <label><strong>Contact</strong></label>
        <input type="text" placeholder="Enter your mobile number" name="mobilenum" required>
      </div>
      <button type="submit"><strong>SIGN UP</strong></button>
      <div class="container" style="background-color: #eee">
       </div>
      <p class="last"> Already have an account? <a href="login.jsp">Click to Login</a></p>
      </div>
      </form>
    </body>

    </html>