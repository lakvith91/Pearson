/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Employee;
import com.beans.PasswordHash;
import com.dbops.DBcon;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lakshan
 */
@WebServlet(name = "EditEmployee", urlPatterns = {"/EditEmployee"})
public class EditEmployee extends HttpServlet {

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
        try {
            //This edit employee controller used only for user edit profiles
            Employee employee=(Employee)request.getSession().getAttribute("user");
            
            // Employee employee=new Employee();
            employee.setEmpId(employee.getEmpId());
            employee.setfName(request.getParameter("fname"));
            employee.setlName(request.getParameter("lname"));
            
            employee.setEmail(request.getParameter("email"));
            employee.setNIC(request.getParameter("nic"));
            
          //  employee.setPassword(PasswordHash.createHash(request.getParameter("password")));//encrypted password
            
            String designation=request.getParameter("designation");
            if(designation.equals("Assistant General Manager")){
                
                employee.setDesignation("2");
            }else if(designation.equals("Project Manager")){
                employee.setDesignation("3");
            }else {
                employee.setDesignation("4");
            }
            
            
            
            employee.setAgm(request.getParameter("agm"));
            employee.setProMan(request.getParameter("proman"));
            employee.setProject(request.getParameter("project"));
            //emp.setProPic(request.getParameter("img"));
            
            
            DBcon dbcon=new DBcon();// create database connection
            dbcon.getDbCon();
            DBCollection coll=dbcon.getData("employee"); // select collection
            BasicDBObject updatedData=employee.toDBObject();//create database object
            
            //updated quary with database object
            BasicDBObject newDocument= new BasicDBObject();
            newDocument.append("$set", updatedData);
            
            //search quary
            
            BasicDBObject searchQuery = new BasicDBObject("empid", employee.getEmpId());
            coll.update(searchQuery, newDocument,true,true);
            
            response.sendRedirect("edit_profile.jsp");
        } catch (Exception ex) {
            Logger.getLogger(EditEmployee.class.getName()).log(Level.SEVERE, null, ex);
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
