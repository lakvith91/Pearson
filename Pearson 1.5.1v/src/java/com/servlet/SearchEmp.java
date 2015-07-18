/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Employee;
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
import javax.servlet.http.HttpSession;
import org.apache.catalina.Session;

/**
 *
 * @author Lakshan
 */
public class SearchEmp extends HttpServlet {

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
            response.sendRedirect("admin_view_edit_users.jsp");
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
        
       String name= request.getParameter("searchname");
        
       DBcon dbcon=new DBcon();
       dbcon.getDbCon();
       
       DBCollection coll=dbcon.getData("employee");
       
       BasicDBObject basic=new BasicDBObject();
       basic.put("fname", name); 
        
       DBCursor cursor=coll.find(basic);
       DBObject obj=cursor.next();
        
       Employee emp=Employee.fromDBObject(obj); 
       
       HttpSession session = request.getSession(true);	    
       session.setAttribute("semp",emp); // create session for user
        
       /*
       PrintWriter out = response.getWriter();
        out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet1</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet1 at " +  ((Employee) request.getSession().getAttribute("searchemp")).getfName() + "</h1>");
            out.println("</body>");
            out.println("</html>");
      
      */
       processRequest(request, response);
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
