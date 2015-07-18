/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Claims;
import com.beans.Employee;
import com.beans.Notifications;
import com.dbops.DBcon;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.management.Notification;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lakshan
 */
public class CancelSubmit extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            /*
             * TODO output your page here. You may use following sample code.
             */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CancelSubmit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CancelSubmit at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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

        PrintWriter out = response.getWriter();
        String rejectedBy = "";
        Notifications notification = new Notifications();
        Object user = request.getSession().getAttribute("user");
        if (user.equals("ADMIN")) {
            rejectedBy = "Admin";

        } else {
            Employee emp = (Employee) user;
            rejectedBy = emp.getEmail();

        }

        String claimId = request.getParameter("claimid");

        DBcon dbcon = new DBcon();
        dbcon.getDbCon();// setup the database connection
        DBCollection coll = dbcon.getData("claims");
        DBCollection NotifyColl = dbcon.getData("notifications");

        BasicDBObject data = new BasicDBObject("status", "Rejected").append("rejectedby", rejectedBy);
        BasicDBObject search = new BasicDBObject("claimid", Integer.parseInt(claimId));
        BasicDBObject update = new BasicDBObject("$set", data);
        dbcon.updateData("claims", search, update);

        DBCursor cursor = coll.find(search);
        DBObject dbo = cursor.next();
        Claims claims=Claims.fromDBObject2(dbo);
//create notification
        notification.setSender(rejectedBy);
        notification.setReceiver(claims.getEmail());
        notification.setClaimId(Integer.parseInt(claimId));
        notification.setRead(false);
        notification.setMessage("Your Claim Request No: "+claimId+"has been rejected by "+rejectedBy);
        notification.setUrl("claim_request.jsp");
        
        BasicDBObject notifyObj=notification.toDBObject();
        dbcon.updateData("notifications", search, notifyObj);
        
        

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
