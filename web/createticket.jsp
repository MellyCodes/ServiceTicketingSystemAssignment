<%-- 
    Document   : createticket.jsp
    Author     : melanie roy-plommer

* @section Academic Integrity
* I certify that this work is solely my own and complies with
* NBCC Academic Integrity Policy (policy 1111)
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create a Service Report Ticket</title>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf"%>
        <main>
            <div class="wrapper">
                <%
                    // create a calendar
                    Calendar cal = Calendar.getInstance();

                    int year;
                    // get the value of all the calendar date fields.
                    year = cal.get(Calendar.YEAR);


                %>

                <h2>Service Report Ticket</h2>
                <h3>Technician Service Report</h3>
                <h3 style="color: red;"><i>${message}</i></h3>
                <form action="CreateTicketServlet" method="post">
                    <div>
                        <table class="w3-table w3-striped">
                            <tr>
                                <td class="left">
                                    <label for="desc">Short Description:</label>
                                </td>
                                <td class="right">
                                    <input type="text" name="desc" id="desc">
                                </td>
                            </tr>
                            <tr>
                                <td class="left">
                                    <label for="assign">Assigned To:</label>
                                </td>
                                <td class="right"><select name="assign">
                                        <option value="none">--Select--</option>
                                        <option>Melanie Roy-Plommer</option>
                                        <option>John Smith</option>
                                        <option>Jane Doe</option>
                                    </select>               
                                </td>                            
                            </tr>
                            <tr>
                                <td class="left">
                                    <label for="state">Current State:</label>
                                </td>
                                <td class="right">
                                    <select name="state">
                                        <option value="none">--Select--</option>
                                        <option>Not currently working on it</option>
                                        <option>Thinking about it</option>
                                        <option>Actively fixing it</option>
                                    </select>
                                </td>                            
                            </tr>
                            <tr>
                                <td class="left">
                                    <label for="status">Status:</label>
                                </td>
                                <td class="right">
                                    <input type="radio" name="status" value="open"> Open
                                    <input type="radio" name="status" value="closed"> Closed
                                </td>                         
                            </tr>
                            <tr>
                                <td class="left">
                                    <label for="severity">Severity:</label>
                                </td>
                                <td class="right">
                                    <select name="severity">
                                        <option value="none">--Select--</option>
                                        <option name="low">Low</option>
                                        <option name="medium">Medium</option>
                                        <option name="high">High</option>
                                        <option name="severe">Severe</option>                    
                                    </select>
                                </td>                            
                            </tr>
                            <tr>
                                <td class="left">
                                    <label>Date Opened:</label>
                                </td>
                                <td class="right">
                                    <select name="monthOpened">
                                        <option>--Month--</option>
                                        <%                                                //gets months
                                            String[] months = new DateFormatSymbols().getMonths();
                                            for (int i = 0; i < months.length - 1; i++) {
                                        %>
                                        <option value="<%= i + 1%>"><%= months[i]%></option>                        
                                        <%
                                            }
                                        %>                                        
                                    </select>                                
                                    <select name="dayOpened">
                                        <option>--Day--</option>
                                        <%
                                            //gets days from 1 from 31
                                            for (int i = 1; i <= 31; i++) {
                                        %>
                                        <option value="<%= i%>"><%= i%></option>                        
                                        <%
                                            }
                                        %>
                                    </select>
                                    <select name="yearOpened">
                                        <option>--Year--</option>
                                        <%
                                            // gets previous, current and next year
                                            for (int i = year - 1; i <= year + 1; i++) {
                                        %>
                                        <option value="<%= i%>"><%= i%></option>                        
                                        <%
                                            }
                                        %>              
                                    </select>                            
                                </td>                            
                            </tr>
                            <tr>
                                <td class="left">
                                    <label>Date Last Actioned:</label>
                                </td>
                                <td class="right">
                                    <select name="monthAction">
                                        <option>--Month--</option>
                                        <%
                                            //gets months
                                            for (int i = 0; i < months.length - 1; i++) {
                                        %>
                                        <option value="<%= i + 1%>"><%= months[i]%></option>                        
                                        <%
                                            }
                                        %>                                        
                                    </select>                                
                                    <select name="dayAction">
                                        <option>--Day--</option>
                                        <%
                                            //gets days from 1 to 31
                                            for (int i = 1; i <= 31; i++) {
                                        %>
                                        <option value="<%= i%>"><%= i%></option>                        
                                        <%
                                            }
                                        %>
                                    </select>
                                    <select name="yearAction">
                                        <option>--Year--</option>
                                        <%
                                            // gets previous, current and next year
                                            for (int i = year - 1; i <= year + 1; i++) {
                                        %>
                                        <option value="<%= i%>"><%= i%></option>                        
                                        <%
                                            }
                                        %>              
                                    </select>     
                                </td>                            
                            </tr>
                            <tr>
                                <td class="left">
                                    <label for="longdesc">Long Description:</label>
                                </td>
                                <td class="right">
                                    <textarea name="longdesc" rows="5" cols="40"></textarea>
                                </td>                            
                            </tr>
                            <tr>
                                <td class="left">
                                    <label for="diag">Diagnosis and Actions Taken</label>
                                </td>
                                <td class="right">
                                    <textarea  name="diag" rows="5" cols="40"></textarea>
                                </td>                            
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <input type="reset" value="Reset"/><input type="submit" name="submit" value="Submit"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>

        </main>
        <%@include file="/WEB-INF/jspf/footer.jspf"%>   


    </body>
</html>
