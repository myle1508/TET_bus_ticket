<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
    <link rel="icon" type="image/x-icon" href="img/1.png">
</head>
<body>
    <%
    session.invalidate(); 
    response.sendRedirect("index.jsp");
%>

</body>
</html>
