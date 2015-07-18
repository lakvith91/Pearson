/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Claims;
import com.beans.Employee;
import com.dbops.DBcon;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
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
public class AddClaim extends HttpServlet {

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
            out.println("<title>Servlet AddClaim</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddClaim at " + "Coooooooooooool" + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //variable declaration
        FileItem item = null;
        String fieldName = "";
        String fieldValue = "";
        String fileName = "";

        //current sessions
        Employee emp = (Employee) request.getSession().getAttribute("user");
        Claims cla = (Claims) request.getSession().getAttribute("c");

        //bean object
        Claims claims = new Claims();

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (isMultipart) {

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {

                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();

                while (iterator.hasNext()) {
                    item = (FileItem) iterator.next();
                    if (!item.isFormField()) { // check for regular form field 
                        fileName = item.getName();
                        if (!fileName.equals("")) {

                            String root = getServletContext().getRealPath("/");
                            response.getWriter().write(root);
                            File path = new File(root + "/images/uploads/Claims/"+ cla.getClaimId());

                            String filePath = "images/uploads/Claims/" + cla.getClaimId() + "/" + fileName;
                            filePath = filePath.replace("\\", "/");
                            if (!path.exists()) {
                                boolean status = path.mkdirs();
                            }
                            //File uploadedFile = new File(path + "/" + fileName);  // for copy file
                            File uploadedFile = new File(path + "/" + fileName);  // for copy file

                            item.write(uploadedFile);
                            claims.setAttachment(filePath);//save the url in databse
                        } else {
                            claims.setAttachment("");
                        }

                    } else {

                        fieldName = item.getFieldName();// field name of current File item
                        fieldValue = item.getString();
                        if (fieldName.equals("claim_group")) {
                            claims.setClaimGroup(fieldValue);
                        } else if (fieldName.equals("type_of_claim")) {//bill type
                            claims.setBillType(fieldValue);
                        } else if (fieldName.equals("food_type")) {//meal type
                            claims.setMealType(fieldValue);
                        } else if (fieldName.equals("bill_date")) {
                            claims.setBillDate(fieldValue);
                        } else if (fieldName.equals("bill_date")) {
                            claims.setBillDate(fieldValue);
                        } else if (fieldName.equals("amount")) {
                            claims.setAmount(Double.parseDouble(fieldValue));
                        } else if (fieldName.equals("project")) {
                            claims.setProject(fieldValue);
                        } else if (fieldName.equals("description")) {
                            claims.setDescription(fieldValue);
                        } else if (fieldName.equals("employeesId")) {
                            claims.setEmpListId(fieldValue);
                        }
                        ////////////////////

                    }

                }//end of while
                DBcon dbcon = new DBcon();
                dbcon.getDbCon();// set up the database connection
                DBCollection coll = dbcon.getData("claims");

                BasicDBObject search = new BasicDBObject();
                search.put("empid", emp.getEmpId());
                search.put("claimid", cla.getClaimId());

                DBCursor cursor = coll.find(search);
                DBObject findObject = cursor.next();

                Claims mainClaimObject = Claims.fromDBObject2(findObject);//create a main claim object

                double total = mainClaimObject.getTotal();
                total += claims.getAmount();
                mainClaimObject.setTotal(total);//update the total claim amount
                ArrayList list = mainClaimObject.getDetails();

                int sizeOfArray = list.size();//return the array size
                int maxdocid = 0;
                if (sizeOfArray > 0) {
                    BasicDBObject returnObj = (BasicDBObject) list.get(sizeOfArray - 1);
                    maxdocid = (Integer) returnObj.get("docid");
                }

                claims.setDocId(++maxdocid);//set the document ID

                DBObject mainObject = mainClaimObject.toDBObject2();//create DBObject 

                DBObject obj = claims.toDBObject();//create DBObject from data
                DBObject modifiedObject = new BasicDBObject();
                modifiedObject.put("$push", new BasicDBObject().append("details", obj));

                dbcon.updateData("claims", search, mainObject);//update the main claim
                dbcon.updateData("claims", search, modifiedObject);//update the new document 

                //BasicDBObject updateTotal = new BasicDBObject("$set", new BasicDBObject("total", total));
                //dbcon.updateData("claims", search, updateTotal);
                response.sendRedirect("home_page_claim_add.jsp");

            } catch (FileUploadException e) {

                e.printStackTrace();
            } catch (Exception e) {

                e.printStackTrace();
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
