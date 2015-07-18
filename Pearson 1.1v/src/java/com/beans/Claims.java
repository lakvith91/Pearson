/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import java.awt.Image;
import java.io.File;
import java.util.Date;

/**
 *
 * @author Lakshan
 */
public class Claims {
    private String empId;
    private int bulkId;
    private int claimId;
    private String billType;
    private String billDate;
    private String eventDate;
    private String project;
    private String amount;
    private Image attachment;
    private String status;

    /**
     * @return the empId
     */
    public String getEmpId() {
        return empId;
    }

    /**
     * @param empId the empId to set
     */
    public void setEmpId(String empId) {
        this.empId = empId;
    }

    /**
     * @return the bulkId
     */
    public int getBulkId() {
        bulkId=0;
        return bulkId;
    }

    /**
     * @param bulkId the bulkId to set
     */
    public void setBulkId(int bulkId) {
        this.bulkId = bulkId;
    }

    /**
     * @return the claimId
     */
    public int getClaimId() {
        
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
     * @return the eventDate
     */
    public String getEventDate() {
        return eventDate;
    }

    /**
     * @param eventDate the eventDate to set
     */
    public void setEventDate(String eventDate) {
        this.eventDate = eventDate;
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
    public String getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(String amount) {
        this.amount = amount;
    }

    /**
     * @return the attachment
     */
    public Image getAttachment() {
        return attachment;
    }

    /**
     * @param attachment the attachment to set
     */
    public void setAttachment(Image attachment) {
        this.attachment = attachment;
    }
    
    public BasicDBObject toDBObject(){
     BasicDBObject doc=new BasicDBObject();
     doc.put("empId", empId);
     doc.put("bulkId", bulkId);
     doc.put("claimId", claimId);
     doc.put("billDate", billDate);
     doc.put("eventDate", eventDate);
     doc.put("status", status);
     doc.put("billType", billType);
     doc.put("project", project);
     doc.put("amount", amount);
     doc.put("attach", attachment);
    return doc;
    }
    
    public static Claims fromDBObject(DBObject doc){
       Claims claims=new Claims();
       
       claims.empId=(String)doc.get("empId");
       claims.bulkId=(Integer)doc.get("bulkId");
       claims.claimId=(Integer)doc.get("claimId");
       claims.billDate=(String)doc.get("billDate");
       claims.eventDate=(String)doc.get("eventDate");
       claims.status=(String)doc.get("status");
       claims.billType=(String)doc.get("billType");
       claims.project=(String)doc.get("project");
       claims.amount=(String)doc.get("amount");
       claims.attachment=(Image)doc.get("attach");
       return claims;
    }

}
