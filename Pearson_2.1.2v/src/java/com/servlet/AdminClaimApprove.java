/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Claims;
import com.beans.Employee;
import com.dbops.EmailConfig;
import com.beans.Notifications;
import com.dbops.DBcon;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lakshan
 */
public class AdminClaimApprove extends HttpServlet {

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

        try {
            
            int claimId = Integer.parseInt(request.getParameter("claimid"));// both empid and claimid are integers
            int empId = Integer.parseInt(request.getParameter("empid"));
            String msg, receiver;
            DBcon dbcon = new DBcon();
            dbcon.getDbCon();// setup the database connection
            DBCollection coll = dbcon.getData("claims");

                    
            Notifications notifications = new Notifications();//notification beans
            notifications.setSender("Admin");//set the source location
            notifications.setMessage("Your Claim No: " + claimId + " has been Approved.");
            notifications.setRead(false);
            notifications.setClaimId(claimId);
            notifications.setUrl("home_page.jsp");

            BasicDBObject searchClaim = new BasicDBObject();
            List<BasicDBObject> sl = new ArrayList<BasicDBObject>();
            sl.add(new BasicDBObject("empid", empId));
            sl.add(new BasicDBObject("claimid", claimId));
            searchClaim.put("$and", sl);

            DBCursor cursor = coll.find(searchClaim);
            DBObject dbo = cursor.next();
            Claims claims = Claims.fromDBObject2(dbo);

            Date approvedDate = new Date();
            claims.setApprovedDate(approvedDate);

            BasicDBObject updated = new BasicDBObject();
            BasicDBObject temp = new BasicDBObject("status", "Approved");
            temp.append("approvedDate", approvedDate);
            updated.append("$set", temp);
            dbcon.updateData("claims", searchClaim, updated);

            notifications.setReceiver(claims.getEmail());
            BasicDBObject notifyObj = notifications.toDBObject();
            dbcon.updateData("notifications", new BasicDBObject("claimid", claimId), notifyObj);

            //send email to employee
            EmailConfig email = new EmailConfig();
            String text = "Your Claim Request No: " + claimId + " has been successfully approved by Finance Division.";
            text += "\n Approved Date: " + claims.getApprovedDate();
            text += "\n \nAdministrator,\nFinance Division,\nPearson Lanka(PVT)LTD,\nSri Lanka.";
            email.sendMail(claims.getEmail(), "Claim No: " + claimId + " has been Approved.", text);

        } catch (AddressException ex) {
            Logger.getLogger(AdminClaimApprove.class.getName()).log(Level.SEVERE, null, ex);
        } 

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
