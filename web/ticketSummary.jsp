<%-- 
    Document   : ticketSummary
    Author     : melan


* @section Academic Integrity
* I certify that this work is solely my own and complies with
* NBCC Academic Integrity Policy (policy 1111)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Ticket Summary</title>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf"%>
        <h3>Service Report Ticket was created</h3>
        <div style="width:50%;margin:auto;">
            <table class="w3-table w3-striped">
                <tr>
                    <td>Short Description: </td>
                    <td>${shortDesc}</td>  
                </tr>
                <tr>
                    <td>Assigned To: </td>
                    <td>${assign}</td>
                </tr>
                <tr>
                    <td>Current State: </td>
                    <td>${state}</td>
                </tr>
                <tr>
                    <td>Status: </td> <!--Get Status-->
                    <td>${status}</td>
                </tr>
                <tr>
                    <td>Severity: </td>
                    <td>${severity}</td>
                </tr>
                <tr>
                    <td>Date Opened: </td>
                    <td>${dateOpened}</td>
                </tr>
                <tr>
                    <td>Date of Last Action: </td>
                    <td>${dateAction}</td>
                </tr>
                <tr>
                    <td>ETA: </td>
                    <td>${eta}</td>
                </tr>
                <tr>
                    <td>Long Description: </td>
                    <td>${longDesc}</td>
                </tr>
                <tr>
                    <td>Diagnosis and Actions Taken</td>
                    <td>${diag}</td>
                </tr>
            </table>
        </div>
        <%@include file="/WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
