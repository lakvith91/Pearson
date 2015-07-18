/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Claims;
import com.beans.Employee;
import com.beans.Notifications;
import com.dbops.DBcon;
import com.mongodb.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lakshan
 */
public class AddNewClaim extends HttpServlet {

    MongoClient mongoClient;
    DB db;
   
    static int a = 1;

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
        Employee emp = (Employee) request.getSession().getAttribute("user");
       Claims claims = new Claims();
        //get parameter values from form
        int max = 1;
        claims.setEmpId(emp.getEmpId());
        claims.setEmail(emp.getEmail());
        claims.setDate(null);// set current date
        claims.setStatus("Pending");//set status as Pending
        claims.setProMan(emp.getProMan());// set reporting project manager
        claims.setAgm(emp.getAgm());// set reporting AGM
        claims.setTotal(0);
        claims.setComment("");
        claims.setRejectedBy("");
        DBcon dbcon = new DBcon();

        dbcon.getDbCon();// set up the database connection

        DBCollection coll = dbcon.getData("claims");
        DBCollection notifyColl = dbcon.getData("notification");//collection for storing notifications
        Notifications notifications = new Notifications();//notification beans
       

        long n = coll.count();

        if (n > 0) {
            // DBCursor cur = coll.find(basic).sort(new BasicDBObject("claimid", -1)).limit(1);
            DBCursor cur = coll.find().sort(new BasicDBObject("claimid", -1)).limit(1);
            DBObject ob = cur.next();

            max = (Integer) ob.get("claimid");
            max++;

            claims.setClaimId(max);

        } else {

            claims.setClaimId(max);

        }
        HttpSession session = request.getSession(true);
        session.setAttribute("c", claims); // create session for user
        DBObject obj = claims.toDBObject2();//create DBObject from data
        dbcon.insertData("claims", obj);// insert object into collection
        
         notifications.setClaimId(claims.getClaimId());
        BasicDBObject notifyObj = notifications.toDBObject();
        dbcon.insertData("notifications", notifyObj);//create empty notification table
       
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
