/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Employee;
import com.dbops.DBcon;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.*;

/**
 *
 * @author Lakshan
 */
public class UploadProPicture extends HttpServlet {

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
            out.print("done");
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
        Employee employee = (Employee) request.getSession().getAttribute("user");

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        PrintWriter out = response.getWriter();

        if (isMultipart) {
            // Create a factory for disk-based file items
            FileItemFactory factory = new DiskFileItemFactory();
            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                // Parse the request
                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while (iterator.hasNext()) {

                    FileItem item = (FileItem) iterator.next();

                    if (!item.isFormField()) {

                        String fileName = item.getName();

                        String root = getServletContext().getRealPath("/");

                        File path = new File(root + "/images/uploads" + File.separator + "profile Pictures" + File.separator + employee.getEmpId());


                        if (!path.exists()) {

                            boolean status = path.mkdirs();

                        }
                       


                        File uploadedFile = new File(path + "/" + fileName);
                        
                        item.write(uploadedFile);
                        
                        String profilePicPath="images/uploads/profile Pictures/"+employee.getEmpId()+"/"+fileName;
                       
                        
                        profilePicPath = profilePicPath.replace("\\", "/");
                        DBcon dbcon = new DBcon();// create database connection
                        dbcon.getDbCon();
                        DBCollection coll = dbcon.getData("employee"); // select collection
                        employee.setProPic(profilePicPath);
                        BasicDBObject updatedData = employee.toDBObject();//create database object
                        BasicDBObject newDocument = new BasicDBObject();
                        newDocument.append("$set", updatedData);
                        coll.update(new BasicDBObject("empid", employee.getEmpId()), newDocument);
                        out.print("Sucessfully Uploaded!");

                        request.getSession(true).setAttribute("user", employee);




                    }

                }

            } catch (FileUploadException e) {

                e.printStackTrace();

            } catch (Exception e) {

                e.printStackTrace();

            }

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
