

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" %>

<!--*
error.jsp
Sept 18, 2018
Melanie Roy-Plommer

@section Academic Integrity
* I certify that this work is solely my own and complies with
* NBCC Academic Integrity Policy (policy 1111)-->

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
    </head>
    <body>
        <!-- This displays the fully-qualified name of the exception and it's message -->
        <h3 style="color:red;"><%= exception.toString()%></h3>
        <!-- This displays the exception's descriptive message -->
        <h3 style="color:red;"><%= exception.getMessage()%></h3>
        <a href="home.jsp"><img class="error" src="oops.png"/></a>
        <!--        <h1>You dun goofed!</h1>-->



    </body>
</html>
