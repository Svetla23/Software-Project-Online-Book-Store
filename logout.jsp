<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

session.setAttribute("username", null);
session.invalidate();
response.sendRedirect("login.jsp");
response.setHeader("Cache-Control","no-cache");
  
%>