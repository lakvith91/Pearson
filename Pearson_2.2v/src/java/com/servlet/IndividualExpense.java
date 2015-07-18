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
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

/**
 *
 * @author Lakshan
 */
public class IndividualExpense extends HttpServlet {

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
            out.println("<title>Servlet IndividualExpense</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet IndividualExpense at " + request.getContextPath() + "</h1>");
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
         PrintWriter out = response.getWriter();
        DBcon dbcon = new DBcon();
        dbcon.getDbCon();
        JSONObject json = new JSONObject();
        DBCollection coll = dbcon.getData("claims");
   
        String searchid=request.getParameter("searchId");
        int empid=Integer.parseInt(searchid);
        BasicDBObject search=new BasicDBObject();
        search.append("status", "Approved");
        search.append("empid",empid);
        
        DBCursor cursor = coll.find(search);
         int foodSum = 0;
        int internetSum = 0;
        int otherSum=0;
        while (cursor.hasNext()) {
            DBObject obj = cursor.next();
            ArrayList li = (ArrayList) obj.get("details");

            if (!li.isEmpty()) {

                Iterator<BasicDBObject> intI = li.iterator();
                while (intI.hasNext()) {
                    BasicDBObject o = intI.next();
                    Claims cl = Claims.fromDBObject(o);
                    String billType = (String) cl.getBillType();
                    if (billType.equals("Food")) {
                        foodSum += (int)cl.getAmount();

                    } else if (billType.equals("Internet")) {
                        internetSum += (int)cl.getAmount();
                    }else{
                        otherSum+=(int)cl.getAmount();
                    }

                }

            }
        }
        json.put("foodsum", foodSum);
        json.put("internetsum",internetSum);
        json.put("othersum", otherSum);
         out.print(json);
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
