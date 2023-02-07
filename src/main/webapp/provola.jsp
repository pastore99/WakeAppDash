<%@ page import="java.util.Base64" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.io.ObjectOutputStream" %><%--
  Created by IntelliJ IDEA.
  User: silve
  Date: 06/02/2023
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    byte[] file = (byte[]) request.getAttribute("audio");
    if(file == null) {
        response.sendRedirect("audio-control");
    } else {
%>
<html>
<head>
    <title>Audio</title>
</head>
<body>
<audio controls>
    <source src=<%=file%> type="audio/wav">
    Your browser does not support the audio element.
</audio>

</body>
</html>
<% } %>
