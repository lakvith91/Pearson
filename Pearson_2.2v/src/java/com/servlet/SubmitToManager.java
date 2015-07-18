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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lakshan
 */
public class SubmitToManager extends HttpServlet {

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
            out.println("<title>Servlet SubmitToManager</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitToManager at " + request.getContextPath() + "</h1>");
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
        String receiver = "";
        String msg = "";
        Employee emp = (Employee) request.getSession().getAttribute("user");//current user
        //Claims cla = (Claims) request.getSession().getAttribute("c");//current claim

        int claimId = Integer.parseInt(request.getParameter("claimid"));// both empid and claimid are integers
        int empId = Integer.parseInt(request.getParameter("empid"));//claim owner's ID

        String designation = emp.getDesignation();//get designation of current user

        DBcon dbcon = new DBcon();
        dbcon.getDbCon();// setup the database connection
        DBCollection coll = dbcon.getData("claims");
        DBCollection notifyColl = dbcon.getData("notification");//collection for storing notifications
        DBCollection empColl=dbcon.getData("employee");
        
        Notifications notifications = new Notifications();//notification beans

        notifications.setSender(String.valueOf(empId));//set the source location
        
        notifications.setRead(false);
        notifications.setClaimId(claimId);

        BasicDBObject search = new BasicDBObject();
        List<BasicDBObject> sl = new ArrayList<BasicDBObject>();
        sl.add(new BasicDBObject("empid", empId));
        sl.add(new BasicDBObject("claimid", claimId));
        search.put("$and", sl);
        DBCursor cursor = coll.find(search);
        DBObject dbo = cursor.next();

        Claims c = Claims.fromDBObject2(dbo);// send data to claim object
        String pm = c.getProMan();
        String agm = c.getAgm();
        String rejectedManager=c.getRejectedBy();
        
        BasicDBObject updated = new BasicDBObject();
        if(c.getStatus().equals("Rejected")){//resubmited the rejected claim to rejected Manager
             if(rejectedManager.equals(pm)){
               updated.append("$set", new BasicDBObject("status", "On Approval PM"));
             }else if(rejectedManager.equals(agm)){
               updated.append("$set", new BasicDBObject("status", "On Approval AGM"));
             }else{
               updated.append("$set", new BasicDBObject("status", "On Approval Finance"));
             }
        
        
        }else if (designation.equals("4")) {
            updated.append("$set", new BasicDBObject("status", "On Approval PM"));
            receiver = pm;
            notifications.setUrl("claim_request.jsp");
            out.print("Your Request has been sent for Approval ");

        } else if (designation.equals("3")) {
            updated.append("$set", new BasicDBObject("status", "On Approval AGM"));
            receiver = agm;
            notifications.setUrl("claim_request.jsp");
            out.print("Your Request has been sent for Approval ");

        } else if (designation.equals("2")) {
            updated.append("$set", new BasicDBObject("status", "On Approval Finance"));
            receiver = "Admin";
            notifications.setUrl("admin_view_home.jsp");
            out.print("Your Request has been sent for Approval ");

        }

        dbcon.updateData("claims", search, updated);
        notifications.setReceiver(receiver);
        notifications.setMessage("Received a Claim Request from " + c.getEmail());
        BasicDBObject notifyObj = notifications.toDBObject();
        dbcon.updateData("notifications", new BasicDBObject("claimid", claimId), notifyObj);

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
