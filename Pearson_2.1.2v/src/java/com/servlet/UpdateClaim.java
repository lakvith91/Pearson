/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.beans.Claims;
import com.beans.Employee;
import com.dbops.DBcon;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Lakshan
 */
public class UpdateClaim extends HttpServlet {

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
            out.println("<title>Servlet UpdateClaim</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateClaim at " + request.getContextPath() + "</h1>");
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
        double total=0;
        //variable declaration
        FileItem item = null;
        String fieldName = "";
        String fieldValue = "";
        String fileName = "";
        boolean isImageExist = false;
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
                            File path = new File(root + "/images/uploads" + File.separator + "Claims" + File.separator + cla.getClaimId());

                            String filePath = "images/uploads/Claims/" + cla.getClaimId() + "/" + fileName;
                            filePath = filePath.replace("\\", "/");
                            if (!path.exists()) {
                                boolean status = path.mkdirs();
                            }
                            //File uploadedFile = new File(path + "/" + fileName);  // for copy file
                            File uploadedFile = new File(path + "/" + fileName);  // for copy file

                            item.write(uploadedFile);
                            isImageExist = true;
                            claims.setAttachment(filePath);//save the url in databse

                        } else {
                            isImageExist = false;

                        }

                    } else {

                        fieldName = item.getFieldName();// field name of current File item
                        fieldValue = item.getString();
                        if (fieldName.equals("docid")) {
                            claims.setDocId(Integer.parseInt(fieldValue));
                        } else if (fieldName.equals("claim_group")) {
                            claims.setClaimGroup(fieldValue);
                        } else if (fieldName.equals("type_of_claim")) {//bill type
                            claims.setBillType(fieldValue);
                        } else if (fieldName.equals("food_type")) {//meal type
                            claims.setMealType(fieldValue);
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

                BasicDBObject search = new BasicDBObject("claimid", cla.getClaimId());
                search.append("details.docid", claims.getDocId());

                DBObject obj = claims.toDBObject();//create DBObject from data

                BasicDBObject update = new BasicDBObject();
                update.append("details.$.claimgroup", claims.getClaimGroup());
                update.append("details.$.billtype", claims.getBillType());
                update.append("details.$.mealtype", claims.getMealType());
                update.append("details.$.bill_date", claims.getBillDate());
                update.append("details.$.amount", claims.getAmount());
                update.append("details.$.project", claims.getProject());
                update.append("details.$.description", claims.getDescription());
                update.append("details.$. employeesId", claims.getEmpListId());
                if (isImageExist) {
                    update.append("details.$.attachment", claims.getAttachment());
                }

                BasicDBObject push = new BasicDBObject("$set", update);
                dbcon.updateData("claims", search, push);//update the new document 
                
                DBCursor cursor = coll.find(search);
                DBObject findMainObject = cursor.next();
                Claims mainClaimObject = Claims.fromDBObject2(findMainObject);//create a main claim object
                ArrayList list = mainClaimObject.getDetails();

                Iterator<BasicDBObject> intI = list.iterator();
                while (intI.hasNext()) {
                    BasicDBObject o = intI.next();
                    Claims cl = Claims.fromDBObject(o);
                    total+=cl.getAmount();
                }
                   
                  
                mainClaimObject.setTotal(total);//update the total claim amount*/
                DBObject mainObject=mainClaimObject.toDBObject2();
                dbcon.updateData("claims", search, mainObject);//update the new document    
                response.sendRedirect("home_page_claim_add.jsp");

                }catch (FileUploadException e) {

                e.printStackTrace();
            }catch (Exception e) {

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
