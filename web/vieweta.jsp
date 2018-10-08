<%-- 
    Document   : vieweta.jsp
    Created on : Sep 8, 2018, 11:04:47 AM
    Author     : melanie roy-plommer

* @section Academic Integrity
* I certify that this work is solely my own and complies with
* NBCC Academic Integrity Policy (policy 1111)
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View ETA</title>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf"%>
        <main>
            <div style="width: 35%; margin:auto;">
                <%!
                    Calendar cal1 = new GregorianCalendar();
                    Calendar cal2 = new GregorianCalendar();
                    Calendar cal3 = new GregorianCalendar();
                    Calendar cal4 = new GregorianCalendar();

                    Date today = new Date();

                    String severe = " ";
                    String high = " ";
                    String medium = " ";
                    String low = " ";
                %>

                <%
                    // creating dates and adding days to use for eta depending on severity
                    try {
                        cal1.add(Calendar.DATE, 3);
                        severe = cal1.getTime().toString();
                        cal2.add(Calendar.DATE, 4);
                        high = cal2.getTime().toString();
                        cal3.add(Calendar.DATE, 5);
                        medium = cal3.getTime().toString();
                        cal4.add(Calendar.DATE, 5);
                        low = cal4.getTime().toString();
                    } catch (Exception ex) {
                        ex.getMessage();
                    }
                %>
                <h2>Estimated Turnover Time</h2>
                <h3>Current Date: <%= today%></h3>
                <table class="w3-table w3-striped">
                    <tr>
                        <th>Severity</th>
                        <th>ETA</th>                
                    </tr>
                    <tr>
                        <td>Severe:</td>
                        <td><%= severe%></td>                
                    </tr>
                    <tr>
                        <td>High:</td>
                        <td><%= high%></td>

                    </tr>
                    <tr>
                        <td>Medium:</td>
                        <td><%= medium%></td>

                    </tr>
                    <tr>
                        <td>Low:</td>
                        <td><%= low%></td>

                    </tr>

                </table>

            </div>    
        </main>       
        <%@include file="/WEB-INF/jspf/footer.jspf"%>

    </body>
</html>
