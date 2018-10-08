/*
    Document   : CreateTicketServlet
    Created on : Sep 8, 2018, 11:04:47 AM
    Author     : melanie roy-plommer

* @section Academic Integrity
* I certify that this work is solely my own and complies with
* NBCC Academic Integrity Policy (policy 1111)
 */
package com.nbcc;

import com.nbcc.serviceticket.business.ServiceTicket;
import com.nbcc.serviceticket.business.ServiceTicketException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author melan
 */
public class CreateTicketServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateTicketServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateTicketServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/createticket.jsp";

        String message = "";

        //String action = request.getParameter("action");
        if (request.getParameter("submit") != null) {

            Date dateOpened = new Date();
            Date dateAction = new Date();
            GregorianCalendar dateOpenedCalendar = new GregorianCalendar();
            GregorianCalendar dateActionCalendar = new GregorianCalendar();

            // get Parameters from elements                    
            String desc = request.getParameter("desc");
            String assign = request.getParameter("assign");
            String state = request.getParameter("state");
            String status;

            if (request.getParameter("status").equals("open")) {
                status = "open";
            } else {
                status = "closed";
            }

            String severity = request.getParameter("severity");

            DateFormat df = new SimpleDateFormat("dd MM yyyy");

            String yearOpened = request.getParameter("yearOpened");
            String monthOpened = request.getParameter("monthOpened");
            String dayOpened = request.getParameter("dayOpened");
            String dateOpenString = dayOpened + " " + monthOpened + " " + yearOpened;

            String yearAction = request.getParameter("yearAction");
            String monthAction = request.getParameter("monthAction");
            String dayAction = request.getParameter("dayAction");
            String dateActionString = dayAction + " " + monthAction + " " + yearAction;

            try {
                // parse string into date format 
                Date date = df.parse(dateOpenString);
                dateOpenedCalendar.setTime(date);
                dateOpened = dateOpenedCalendar.getTime();

                // parse string into date format
                Date date2 = df.parse(dateActionString);
                dateActionCalendar.setTime(date2);
                dateAction = dateActionCalendar.getTime();

            } catch (ParseException ex) {
                //Logger.getLogger(CreateTicketServlet.class.getName()).log(Level.SEVERE, null, ex);
                message = "unable to parse date";
            }

            String longdesc = request.getParameter("longdesc");
            String diag = request.getParameter("diag");
            // END get Parameters from elements

            // Create new ticket from bean
            ServiceTicket ticket = new ServiceTicket();

            // Set fields in ticket through bean
            ticket.setShortDescription(desc);
            ticket.setAssignedTo(assign);
            ticket.setCurrentState(state);

            if (status.equals("open")) {
                ticket.setIsOpen(true);
            } else {
                ticket.setIsOpen(false);
            }

            ticket.setSeverity(severity);
            ticket.setDateOpened(dateOpened);
            ticket.setDateLastActioned(dateAction);
            ticket.setLongDescription(longdesc);
            ticket.setActionTaken(diag);
            // END set fields in ticket through bean

            try {
                // method for validation within the Service Ticket
                ticket.createServiceTicket();
                // post to ticketSummary page
                url = "/ticketSummary.jsp";
                // set all attributes for ticket summary page
                request.setAttribute("shortDesc", ticket.getShortDescription());
                request.setAttribute("assign", ticket.getAssignedTo());
                request.setAttribute("state", ticket.getCurrentState());
                request.setAttribute("status", status);
                request.setAttribute("severity", ticket.getSeverity());
                request.setAttribute("dateOpened", ticket.getDateOpened());
                request.setAttribute("dateAction", ticket.getDateLastActioned());
                request.setAttribute("eta", ticket.getDateETA());
                request.setAttribute("longDesc", ticket.getLongDescription());
                request.setAttribute("diag", ticket.getActionTaken());
                // END set all attributes for ticket summary page
            } catch (ServiceTicketException ex) {
                message = ex.getMessage();
            }

        }
        //set message string for exceptions
        request.setAttribute("message", message);

        //Forward our request to the set url
        getServletContext().getRequestDispatcher(url).forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
