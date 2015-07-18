/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import java.awt.Image;
import sun.security.util.Password;

/**
 *
 * @author Lakshan
 */
public class Employee {

    private int empId;
    private String fName;
    private String lName;
    private String birthday;
    private String proMan;
    private String agm;
    private Image proPic;
    private String workSince;
    private String designation;
    private String password;
    private String email;

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
     * @return the fName
     */
    public String getfName() {
        return fName;
    }

    /**
     * @param fName the fName to set
     */
    public void setfName(String fName) {
        this.fName = fName;
    }

    /**
     * @return the lName
     */
    public String getlName() {
        return lName;
    }

    /**
     * @param lName the lName to set
     */
    public void setlName(String lName) {
        this.lName = lName;
    }

    /**
     * @return the birthday
     */
    public String getBirthday() {
        return birthday;
    }

    /**
     * @param birthday the birthday to set
     */
    public void setBirthday(String birthday) {
        this.birthday = birthday;
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
     * @return the proPic
     */
    public Image getProPic() {
        return proPic;
    }

    /**
     * @param proPic the proPic to set
     */
    public void setProPic(Image proPic) {
        this.proPic = proPic;
    }

    /**
     * @return the workSince
     */
    public String getWorkSince() {
        return workSince;
    }

    /**
     * @param workSince the workSince to set
     */
    public void setWorkSince(String workSince) {
        this.workSince = workSince;
    }

    /**
     * @return the designation
     */
    public String getDesignation() {
        return designation;
    }

    /**
     * @param designation the designation to set
     */
    public void setDesignation(String designation) {
        this.designation = designation;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
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
    
    public BasicDBObject toDBObject(){
      BasicDBObject dbo=new BasicDBObject();
      
      //dbo.put("field name", Value)
      dbo.put("fname", fName);
      dbo.put("lname",lName);
      dbo.put("password", password);
      dbo.put("empid",empId);
      dbo.put("designation", designation);
      dbo.put("agm", agm);
      dbo.put("proman", proMan);
     
      return dbo; 
    }

   public static Employee fromDBObject(DBObject dbo){
       Employee emp=new Employee();
       
       emp.fName=(String)dbo.get("fname");
       emp.lName=(String)dbo.get("lname");
       emp.password=(String)dbo.get("password");
       emp.empId=(Integer)dbo.get("empid");
       emp.designation=(String)dbo.get("designation");
       emp.agm=(String)dbo.get("agm");
       emp.proMan=(String)dbo.get("proman");
       
       return emp;
   
   }
}
