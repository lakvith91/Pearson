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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.eclipse.jdt.internal.compiler.lookup.TypeIds;

/**
 *
 * @author Lakshan
 */
public class DeleteClaims extends HttpServlet {

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
            out.println("<title>Servlet DeleteClaims</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteClaims at " + request.getContextPath() + "</h1>");
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

        String idstr = request.getParameter("id"); // ID which is going to delete
        String claimstr = request.getParameter("claimid");// claim id
        String amountstr = request.getParameter("amount");// claim id

        DBcon dbcon = new DBcon();
        dbcon.getDbCon();
        int oid = Integer.parseInt(idstr);//parse string values to integer
        int claimId = Integer.parseInt(claimstr);
        double amount = Double.parseDouble(amountstr);

        BasicDBObject match = new BasicDBObject("docid", oid);//match the document id
        BasicDBObject push = new BasicDBObject("$pull", new BasicDBObject("details", match));
        BasicDBObject search = new BasicDBObject("claimid", claimId);// searched claim document

        dbcon.updateData("claims", search, push);

        DBCollection coll = dbcon.getData("claims");
        DBCursor cursor = coll.find(search);
        DBObject findObject = cursor.next();
        Claims mainClaimObject = Claims.fromDBObject2(findObject);//create a main claim object

        double total = mainClaimObject.getTotal();
        total -= amount;
        mainClaimObject.setTotal(total);//update the total claim amount
        DBObject mainObject=mainClaimObject.toDBObject2();//create DBObject 
        dbcon.updateData("claims", search, mainObject);//update the main claim

        //PrintWriter out = response.getWriter();
        //out.print(idstr + claimstr);
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
