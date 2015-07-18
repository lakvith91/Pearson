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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lakshan
 */
@WebServlet(name = "AddClaim", urlPatterns = {"/AddClaim"})
public class AddClaim extends HttpServlet {

    MongoClient mongoClient;
    DB db;
    Claims claims = new Claims();
    // static int a = 1;

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
        Claims cla=(Claims)request.getSession().getAttribute("c"); 

        int claimId = Integer.parseInt(request.getParameter("claimid"));

        claims.setClaimGroup(request.getParameter("claim_group"));
        claims.setBillType(request.getParameter("type_of_claim"));//bill type
        claims.setMealType(request.getParameter("food_type"));//meal type
        claims.setBillDate(request.getParameter("bill_date"));
        
        claims.setAmount(Double.parseDouble(request.getParameter(("amount"))));
        claims.setProject(request.getParameter("project"));
        claims.setDescription(request.getParameter("description"));
        claims.setEmpListId(request.getParameter("employeesId"));
        
       


        DBcon dbcon = new DBcon();
        dbcon.getDbCon();// set up the database connection

        DBObject obj = claims.toDBObject();//create DBObject from data
       

        BasicDBObject search = new BasicDBObject();
        search.put("empid", emp.getEmpId());
         search.put("claimid", claimId);

        dbcon.updateData("claims", search, obj);


       
        response.sendRedirect("home_page_claim_add.jsp");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
