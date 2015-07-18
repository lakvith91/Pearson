/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Claims;
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
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lakshan
 */
public class MonthlyClaimLimit extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MonthlyClaimLimit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MonthlyClaimLimit at " + request.getContextPath() + "</h1>");
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
        doPost(request, response);
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
        try {
            //int claimId = Integer.parseInt(request.getParameter("claimid"));// both empid and claimid are integers
            String email = request.getParameter("email");

            DBcon dbcon = new DBcon();
            dbcon.getDbCon();// setup the database connection
            DBCollection coll = dbcon.getData("claims");

            Date currentDate = new Date();//current date
            DateFormat formatter = new SimpleDateFormat("MM/yyyy");

            currentDate = formatter.parse(formatter.format(currentDate));
            Date start = currentDate;
            Calendar c = Calendar.getInstance();
            c.setTime(currentDate);
            c.add(Calendar.MONTH, 1);
            Date end = c.getTime();

            BasicDBObject searchMonthExpence = new BasicDBObject();
            searchMonthExpence.append("status", "Approved");
            searchMonthExpence.append("email", email);
            searchMonthExpence.append("date", new BasicDBObject("$gte", start).append("$lt", end)); //send notifications

            DBCursor Limitcursor = coll.find(searchMonthExpence);
            double currentMonthTotal = 0;

            while (Limitcursor.hasNext()) {
                DBObject dBObject = Limitcursor.next();
                Claims claims = Claims.fromDBObject2(dBObject);
                currentMonthTotal += claims.getTotal();

            }

           out.print(currentMonthTotal);
        } catch (ParseException ex) {
            Logger.getLogger(MonthlyClaimLimit.class.getName()).log(Level.SEVERE, null, ex);
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
