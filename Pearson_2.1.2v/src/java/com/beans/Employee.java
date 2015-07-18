/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import java.awt.Image;
import org.json.simple.JSONObject;

import sun.security.util.Password;

/**
 *
 * @author Lakshan
 */
public class Employee {

    private int empId;
    private String fName = "";
    private String lName = "";
    private String gender = "";
    private String mobileno = "";
    private String NIC = "";
    private String birthday = "";
    private String project = "";
    private String proMan = "";
    private String agm = "";
    private String proPic = "";
    private String workSince = "";
    private String designation = "";
    private String password = "";
    private String email = "";

    

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
    public String getProPic() {

        return proPic;
    }

    /**
     * @param proPic the proPic to set
     */
    public void setProPic(String proPic) {
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
      //return passcrl.decrypt(password);
        return password;

    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
         //this.password=PasswordHash.createHash(password);
        //this.password = passcrl.encrypt(password);
         this.password=password;

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

    public BasicDBObject toDBObject() {
        BasicDBObject dbo = new BasicDBObject();//json

        //dbo.put("field name", Value)
        dbo.put("empid", empId);
        dbo.put("fname", fName);
        dbo.put("lname", lName);
        // dbo.put("gender",gender);
        dbo.put("email", email);
        //dbo.put("mob_no",mobileno);
        dbo.put("nic", NIC);
        dbo.put("password", password);
        dbo.put("designation", designation);
        dbo.put("propic", proPic);
        // dbo.put("worksince", workSince);
        dbo.put("agm", agm);
        dbo.put("proman", proMan);
        dbo.put("project", project);

        return dbo;
    }
    public static JSONObject toJsonObj(Employee dbo) throws Exception {
        JSONObject json = new JSONObject();

        json.put("empid", dbo.getEmpId());
        json.put("fname", dbo.getfName());
        json.put("lname", dbo.getlName());
        json.put("email", dbo.getEmail());
        json.put("nic", dbo.getNIC());
        json.put("password", dbo.getPassword());
        json.put("designation", dbo.getDesignation());
        if (dbo.getDesignation().equals("2")) {
            json.put("designationStr", "Assistant General Manager");
        } else if (dbo.getDesignation().equals("3")) {
            json.put("designationStr", "Project Manager");
        } else {
            json.put("designationStr", "Project Manager");
        }

        json.put("propic", dbo.getProPic());
        json.put("agm", dbo.getAgm());
        json.put("proman", dbo.getProMan());
        json.put("project", dbo.getProject());

        return json;
    }

    public static Employee fromDBObject(DBObject dbo) {
        Employee emp = new Employee();

        emp.empId = (Integer) dbo.get("empid");
        emp.fName = (String) dbo.get("fname");
        emp.lName = (String) dbo.get("lname");
        //emp.gender=(String)dbo.get("gender");
        emp.email = (String) dbo.get("email");
        // emp.mobileno=(String)dbo.get("mob_no");
        emp.NIC = (String) dbo.get("nic");

        emp.password = (String) dbo.get("password");
        emp.designation = (String) dbo.get("designation");
        emp.proPic = (String) dbo.get("propic");
        // emp.workSince=(String)dbo.get("worksince");
        emp.agm = (String) dbo.get("agm");
        emp.proMan = (String) dbo.get("proman");
        emp.project = (String) dbo.get("project");
        return emp;

    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the mobileno
     */
    public String getMobileno() {
        return mobileno;
    }

    /**
     * @param mobileno the mobileno to set
     */
    public void setMobileno(String mobileno) {
        this.mobileno = mobileno;
    }

    /**
     * @return the NIC
     */
    public String getNIC() {
        return NIC;
    }

    /**
     * @param NIC the NIC to set
     */
    public void setNIC(String NIC) {
        this.NIC = NIC;
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
     * @param dbo
     * @param proPic the proPic to set
     * @return
     * @throws java.lang.Exception
     */
    

}
