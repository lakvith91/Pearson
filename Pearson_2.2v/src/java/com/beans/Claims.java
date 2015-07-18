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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import org.json.simple.JSONObject;

/**
 *
 * @author Lakshan
 */
public class Claims {

    private int empId;
    private String email;
    private Date date;
    private int claimId;//unique ID for each claim
    private int docId;//unique ID for each document under one claim
    
    private String billDate;
    private String description;
    private String billType;//type_of_claim food,internet
    private String claimGroup;//group or individual
    private String mealType="";//food type breakfast,lunch,dinner
    private String project;
    private double amount;
    private String attachment;
    private String status;
    private String empListId;
    private ArrayList details = new ArrayList();
    private String comment;
    private String proMan;
    private String agm;
    private double total;
    private Date approvedDate;
    private String rejectedBy;

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
    public void setBillDate(String billDate) throws ParseException {
       this.billDate=billDate;
        
        
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
    public double getAmount() {
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
    public String getDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(date);
    }

    /**
     * @param date the date to set
     */
    public void setDate(String d) {
        Date date= new Date();
        
        this.date = date;
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
        doc.put("email", email);
        doc.put("date", date);
        doc.put("claimid", claimId);
        doc.put("status", status);
        doc.put("approvedDate",approvedDate);
        doc.put("proman", proMan);
        doc.put("agm", agm);
        doc.put("total",total);
        doc.put("comment", comment);
        doc.put("rejectedby", rejectedBy);
        doc.put("details", getDetails());
        
        return doc;
    }

    public DBObject toDBObject() {


        ArrayList list = new ArrayList();//arraylist for details about claims

        BasicDBObject arraydoc = new BasicDBObject();
        arraydoc.put("docid",docId);
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
       


        return eachObject;
    }
public static JSONObject  toJsonObj(Claims dbo) throws Exception {
        JSONObject json = new JSONObject();

        json.put("docid", dbo.getDocId());
        json.put("billdate", dbo.getBillDate());
        json.put("description", dbo.getDescription());
        json.put("billtype", dbo.getBillType());
        json.put("claimgroup", dbo.getClaimGroup());
        json.put("mealtype", dbo.getMealType());
        json.put("project", dbo.getProject());
        json.put("attachment", dbo.getAttachment());
        json.put("amount", dbo.getAmount());
        json.put("empdetails", dbo.getEmpListId());
       

        return json;
    }
    public static Claims fromDBObject(BasicDBObject doc) {
        Claims claims = new Claims();

        claims.docId=(Integer)doc.get("docid");//unique ID for document
        claims.billDate = (String) doc.get("billdate");
        claims.claimGroup = (String) doc.get("claimgroup");
        claims.billType = (String) doc.get("billtype");
        claims.mealType = (String) doc.get("mealtype");
        claims.project = (String) doc.get("project");
        claims.description = (String) doc.get("description");
        claims.empListId = (String) doc.get("empdetails");
         claims.attachment = (String) doc.get("attachment");
        claims.amount = (Double) doc.get("amount");
        
        return claims;
    }

    public static Claims fromDBObject2(DBObject doc) {
        Claims claims = new Claims();

        
        claims.empId = (Integer) doc.get("empid");
        claims.email=(String)doc.get("email");
        claims.claimId = (Integer) doc.get("claimid");
        claims.status = (String) doc.get("status");
        claims.approvedDate=(Date)doc.get("approvedDate");
        claims.date = (Date) doc.get("date");
        claims.proMan=(String)doc.get("proman");
        claims.agm=(String)doc.get("agm");
        claims.total=(Double)doc.get("total");
        claims.comment=(String)doc.get("comment");
        claims.rejectedBy=(String)doc.get("rejectedby");
        claims.details=(ArrayList)doc.get("details");

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
       if(mealType.equals(null)){
          mealType="";
       }
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

    /**
     * @return the proMan
     */
    public String getProMan() {
        return proMan;
    }

    /**
     * @param proMan the proMan to set
     */
    public void setProMan(String proMan) {
        this.proMan = proMan;
    }

    /**
     * @return the agm
     */
    public String getAgm() {
        return agm;
    }

    /**
     * @param agm the agm to set
     */
    public void setAgm(String agm) {
        this.agm = agm;
    }

    /**
     * @return the total
     */
    public double getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal(double total) {
        this.total = total;
    }

    /**
     * @return the approvedDate
     */
    public String getApprovedDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(approvedDate);
        
    }

    /**
     * @param approvedDate the approvedDate to set
     */
    public void setApprovedDate(Date date) {
        
        this.approvedDate = date;
    }

    /**
     * @return the comment
     */
    public String getComment() {
        return comment;
    }

    /**
     * @param comment the comment to set
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    /**
     * @return the rejectedBy
     */
    public String getRejectedBy() {
        return rejectedBy;
    }

    /**
     * @param rejectedBy the rejectedBy to set
     */
    public void setRejectedBy(String rejectedBy) {
        this.rejectedBy = rejectedBy;
    }

    /**
     * @return the attachment
     */
    public String getAttachment() {
        return attachment;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
