<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
request.getSession(false);
session.invalidate();
response.sendRedirect("index.jsp");
%>
 
