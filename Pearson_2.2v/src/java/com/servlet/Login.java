/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Employee;
import com.beans.LoginBeans;
import com.beans.PasswordHash;
import com.dbops.DBcon;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
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
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        LoginBeans login = new LoginBeans();// user bean for login inputs
        login.setUsername((String) request.getParameter("username"));//email ID
        login.setPassword((String) request.getParameter("password"));

        DBcon dbcon = new DBcon();// create database connection
        dbcon.getDbCon();
        DBCollection coll = dbcon.getData("employee"); // select collection

        try {
            BasicDBObject basic = new BasicDBObject();
            if (login.getUsername().contains("@")) {
                basic.put("email", login.getUsername());
            } else {
                basic.put("empid", Integer.parseInt(login.getUsername()));//database search quary
            }

            DBCursor cursor = coll.find(basic);

            DBObject dbo = cursor.next();
            Employee c = Employee.fromDBObject(dbo);// send data to employee bean

            if (PasswordHash.validatePassword(login.getPassword(), c.getPassword())) {

                HttpSession session = request.getSession(true);
                session.setAttribute("user", c); // create session for user
                  if(c.getDesignation().equals("1")){
                    response.sendRedirect("admin_view_home.jsp");// redirect to home
                  }else{
                   response.sendRedirect("home_page.jsp");// redirect to home
                  }
            } else {

                response.sendRedirect("index.jsp");// redirect to index

            }

        } catch (Exception e) {
            response.sendRedirect("index.jsp");// redirect to index

        }

        // processRequest(request, response);
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
