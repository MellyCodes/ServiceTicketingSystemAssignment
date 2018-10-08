<%-- 
    Document   : home.jsp
    Created on : Sep 8, 2018, 10:58:34 AM
    Author     : melanie roy-plommer

* @section Academic Integrity
* I certify that this work is solely my own and complies with
* NBCC Academic Integrity Policy (policy 1111)
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="WelcomeTag" uri="WEB-INF/tlds/welcome.tld" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf"%>
        <main>
            <h1>Web Application for Call Center</h1> 

            <WelcomeTag:Welcome/>

        </main>
        <%@include file="/WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
