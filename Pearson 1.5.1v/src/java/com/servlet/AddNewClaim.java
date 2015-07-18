/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Claims;
import com.beans.Employee;
import com.dbops.DBcon;
import com.mongodb.*;
import java.io.IOException;
import java.io.PrintWriter;
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
    Claims claims = new Claims();
    static int a = 1;

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
            out.println("<title>Servlet AddNewClaim</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddNewClaim at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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

        //get parameter values from form
        int max = 1;
        claims.setEmpId(emp.getEmpId());
        claims.setDate(null);// set current date
      
        claims.setStatus("Pending");


        DBcon dbcon = new DBcon();
        dbcon.getDbCon();// set up the database connection


        DBCollection coll = dbcon.getData("claims");


        BasicDBObject basic = new BasicDBObject().append("empid", emp.getEmpId());
        long n = coll.count(basic);
        if (n > 0) {
            DBCursor cur = coll.find(basic).sort(new BasicDBObject("claimid", -1)).limit(1);
            DBObject ob = cur.next();

            max = (Integer) ob.get("claimid");
            max++;
            claims.setClaimId(max);

        } else {
            claims.setClaimId(max);

        }
        HttpSession session = request.getSession(true);	    
        session.setAttribute("c",claims); // create session for user
        DBObject obj = claims.toDBObject2();//create DBObject from data
        dbcon.insertData("claims", obj);// insert object into collection




       // response.sendRedirect("home_page_claim_add.jsp");

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
