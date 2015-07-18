/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Employee;
import com.beans.Notifications;
import com.beans.PasswordHash;
import com.dbops.DBcon;
import com.dbops.EmailConfig;
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

/**
 *
 * @author Lakshan
 */
@WebServlet(name = "AddEmployee", urlPatterns = {"/AddEmployee"})
public class AddEmployee extends HttpServlet {

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
            out.print("Sucessfully created !");
            response.sendRedirect("admin_view_add_users.jsp");

        } finally {
            // out.close();
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
            Employee emp = new Employee();
            
            //get parameter values from index signUp form
            String password=request.getParameter("password");
            emp.setfName(request.getParameter("fname"));
            emp.setlName(request.getParameter("lname"));
            emp.setPassword(PasswordHash.createHash(password));
            emp.setProject(request.getParameter("project"));
            emp.setEmpId(Integer.parseInt(request.getParameter("empid")));// empid in integer
            emp.setDesignation(request.getParameter("designation"));
            emp.setAgm(request.getParameter("agm"));
            emp.setProMan(request.getParameter("proman"));
            emp.setEmail(request.getParameter("email"));
            
            DBcon dbcon = new DBcon();// create database connection
            dbcon.getDbCon();
            
            DBCollection notifyColl = dbcon.getData("notification");//collection for storing notifications
            Notifications notifications = new Notifications();//notification beans
            
            
            BasicDBObject dbo = emp.toDBObject();//create database object
            dbcon.insertData("employee", dbo);//insert database object to employee table
            //send email to new user
            EmailConfig email = new EmailConfig();
            String text="Your New Account has created by Administrator.";
            text+="\n\nYour Username: "+emp.getEmail();
            text+="\nYour Password: "+password;
           
            text+="\nPlease Login by using above Credentials and reset your password.";
            email.sendMail(emp.getEmail(), "Your New Account created", text);
            
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddEmployee.class.getName()).log(Level.SEVERE, null, ex);
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
