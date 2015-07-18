/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Employee;
import com.beans.PasswordHash;
import com.dbops.DBcon;
import com.dbops.EmailConfig;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import java.io.IOException;
import java.io.PrintWriter;
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
public class EditEmployeeAdmin extends HttpServlet {

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
            ;
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

        
            
            Employee emp = new Employee();
            
            emp.setEmpId(Integer.parseInt(request.getParameter("empid")));
            emp.setfName(request.getParameter("fname"));
            emp.setlName(request.getParameter("lname"));
           
            emp.setDesignation(request.getParameter("designation"));
            emp.setAgm(request.getParameter("agm"));
            emp.setProMan(request.getParameter("proman"));
            emp.setProject(request.getParameter("project"));
            emp.setEmail(request.getParameter("email"));
            
            DBcon dbcon = new DBcon();// create database connection
            dbcon.getDbCon();
            DBCollection coll = dbcon.getData("employee"); // select collection
            BasicDBObject updatedData = emp.toDBObject();//create database object
            
            //updated quary with database object
            BasicDBObject newDocument = new BasicDBObject();
            newDocument.append("$set", updatedData);
            
            //search quary
            BasicDBObject searchQuery = new BasicDBObject("empid", emp.getEmpId());
            coll.update(searchQuery, newDocument, true, true);
            

            response.sendRedirect("admin_view_edit_users.jsp");
            
        

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
