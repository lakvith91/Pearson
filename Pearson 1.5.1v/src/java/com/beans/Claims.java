/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import java.math.BigDecimal;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Lakshan
 */
public class Claims {

    private int empId;
    private Date date;
    private int claimId;
    //itarative array element
    private String billDate;
    private String description;
    private String billType;//type_of_claim food,internet
    private String claimGroup;//group or individual
    private String mealType;//food type breakfast,lunch,dinner
    private String project;
    private double amount;
    private String attachment;
    private String status;
    private String empListId;
    private ArrayList details = new ArrayList();
    private int docId;

    /**
     * @return the empId
     */
    public int getEmpId() {
        return empId;
    }

    /**
     * @param empId the empId to set
     */
    public void setEmpId(int empId) {
        this.empId = empId;
    }

    /**
     * @return the bulkId
     */
    /**
     * @return the claimId
     */
    public int getClaimId() throws UnknownHostException {

        return claimId;
    }

    /**
     * @param claimId the claimId to set
     */
    public void setClaimId(int claimId) {

        this.claimId = claimId;
    }

    /**
     * @return the billDate
     */
    public String getBillDate() {
        return billDate;
    }

    /**
     * @param billDate the billDate to set
     */
    public void setBillDate(String billDate) {
        this.billDate = billDate;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the project
     */
    public String getProject() {
        return project;
    }

    /**
     * @param project the project to set
     */
    public void setProject(String project) {
        this.project = project;
    }

    /**
     * @return the billType
     */
    public String getBillType() {
        return billType;
    }

    /**
     * @param billType the billType to set
     */
    public void setBillType(String billType) {
        this.billType = billType;
    }

    /**
     * @return the amount
     */
    public  double getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(double amount) {
        this.amount = amount;
    }

    /**
     * @return the date
     */
    public Date getDate() {

        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        DateFormat dateFormat = new SimpleDateFormat("DD/MM/yyyy");
        Date d = new Date();
        dateFormat.format(d);

        this.date = d;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @param attachment the attachment to set
     */
    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public DBObject toDBObject2() {
        BasicDBObject doc = new BasicDBObject();
        doc.put("empid", empId);
        doc.put("date", date);
        doc.put("claimid", claimId);
        doc.put("status", status);
        doc.put("details", getDetails());
        return doc;
    }

    public DBObject toDBObject() {


        ArrayList list = new ArrayList();//arraylist for details about claims

        BasicDBObject arraydoc = new BasicDBObject();
        //arraydoc.put("id",docId);
        arraydoc.put("billdate", billDate);
        arraydoc.put("description", description);
        arraydoc.put("billtype", billType);//food/internet/other
        arraydoc.put("claimgroup", claimGroup);//claim type-group or individual
        arraydoc.put("mealtype", mealType);// breakfast/lunch/dinner
        arraydoc.put("project", project);
        arraydoc.put("attachment", attachment);
        arraydoc.put("amount", amount);// flaot value
        arraydoc.put("empdetails", getEmpListId());

        list.add(arraydoc);//add array doc to the array


        DBObject eachObject = new BasicDBObject();
        eachObject.put("$each", list);
        DBObject modifiedObject = new BasicDBObject();
        modifiedObject.put("$push", new BasicDBObject().append("details", eachObject));


        return modifiedObject;
    }

    public static Claims fromDBObject(BasicDBObject doc) {
         Claims claims = new Claims();


        claims.billDate = (String) doc.get("billdate");
        claims.claimGroup = (String) doc.get("claimgroup");
        claims.billType = (String) doc.get("billtype");
        claims.mealType = (String) doc.get("mealtype");
        claims.project = (String) doc.get("project");
        claims.description = (String) doc.get("description");
        claims.empListId = (String) doc.get("empdetails");
        claims.amount=(Double)doc.get("amount");
      /*  
        
        claims.amount = (Float) doc.get("amount");
        
        //  claims.setAttachment((Image)doc.get("attach"));*/
        return claims;
    }

    

    public static Claims fromDBObject2(DBObject doc) {
        Claims claims = new Claims();


        claims.empId = (Integer) doc.get("empid");
        claims.claimId = (Integer) doc.get("claimid");
        claims.status = (String) doc.get("status");
        claims.date = (Date) doc.get("date");


        return claims;
    }

    /**
     * @return the claimGroup
     */
    public String getClaimGroup() {
        return claimGroup;
    }

    /**
     * @param claimGroup the claimGroup to set
     */
    public void setClaimGroup(String claimGroup) {
        this.claimGroup = claimGroup;
    }

    /**
     * @return the mealType
     */
    public String getMealType() {
        return mealType;
    }

    /**
     * @param mealType the mealType to set
     */
    public void setMealType(String mealType) {
        this.mealType = mealType;
    }

    /**
     * @return the empListId
     */
    public String getEmpListId() {
        return empListId;
    }

    /**
     * @param empListId the empListId to set
     */
    public void setEmpListId(String empListId) {
        this.empListId = empListId;
    }

    /**
     * @return the docId
     */
    public int getDocId() {
        return docId;
    }

    /**
     * @param docId the docId to set
     */
    public void setDocId(int docId) {
        
        this.docId = docId;
    }

    /**
     * @return the details
     */
    public ArrayList getDetails() {
        return details;
    }
}
