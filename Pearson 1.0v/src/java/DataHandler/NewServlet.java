/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DataHandler;

import com.mongodb.DBObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lakshan
 */
public class NewServlet extends HttpServlet {

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
            
            response.sendRedirect("home_page_claim_add.jsp");
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
        
         String bulkId=request.getParameter("Bulk_ID");
         String project=request.getParameter("project");
         String claim_no=request.getParameter("claim_no");
         String select=request.getParameter("Select1");
         String billdate=request.getParameter("Bill_date");
         String amount=request.getParameter("amount");
         String eventdate=request.getParameter("event_date");
        //String project=request.getParameter("project");
        
         DataCon dacon=new DataCon();
         dacon.getDbCon();// setup the database connection
         
         
         DBObject insertdata=dacon.insertClaim(bulkId, project,claim_no,select,billdate,eventdate,amount);// insert data into emp table
         dacon.insertData("claim1", insertdata);
        
         //dacon.insertData(bulkId, project,claim_no,select,billdate,eventdate,amount);// insert data into emp table
        //processRequest(request, response);
         response.sendRedirect("home_page_claim_add.jsp");
        //PrintWriter out = response.getWriter();
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
