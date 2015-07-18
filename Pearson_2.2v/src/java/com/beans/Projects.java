/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.dbops.DBcon;
import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import java.io.IOException;
import java.net.UnknownHostException;

/**
 *
 * @author Lakshan
 */
public class Projects {
  private int projectID;
  private String projectName;
  private int noOfEmp;
  private int projNo;
    /**
     * @return the projectID
     */
    public int getProjectID() {
        return projectID;
    }

    /**
     * @param projectID the projectID to set
     */
    public void setProjectID(int projectID) {
        this.projectID = projectID;
    }

    /**
     * @return the projectName
     */
    public String getProjectName() {
        return projectName;
    }

    /**
     * @param projectName the projectName to set
     */
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    /**
     * @return the noOfEmp
     */
    public int getNoOfEmp() {
        return noOfEmp;
    }

    /**
     * @param noOfEmp the noOfEmp to set
     */
    public void setNoOfEmp(int noOfEmp) {
        this.noOfEmp = noOfEmp;
    }
    
    
    public BasicDBObject toDBObject(){
       BasicDBObject dbo=new BasicDBObject();
       dbo.put("projid",projectID);
       dbo.put("projname", projectName);
       dbo.put("projno",projNo);
       return dbo;
    
    }
    
    
    public static Projects fromDBObject(DBObject dbo){
       Projects proj=new Projects();
       
       proj.projectID=(Integer)dbo.get("projid");
       proj.projectName=(String)dbo.get("projname");
       proj.projNo=(Integer)dbo.get("projno");
       return proj; 
    }

    /**
     * @return the projNo
     */
    public int getProjNo() throws UnknownHostException {
      
        return projNo;
    }

    /**
     * @param projNo the projNo to set
     */
    public void setProjNo() throws UnknownHostException, IOException {
       DBcon dbcon=new DBcon();
       dbcon.getDbCon();
       
       DBCollection coll=dbcon.getData("projects");
       projNo=(int)coll.count();    
       projNo++; 
       
       
        this.projNo = projNo;
    }
}
