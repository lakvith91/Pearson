/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbops;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.net.UnknownHostException;

/**
 *
 * @author Lakshan
 */

public class DBcon {
  
   static MongoClient mongoClient;
    static DB db;
    
     public DBcon() {
    }
    
   //Setup database connection 
 public DBcon getDbCon() throws UnknownHostException{
        mongoClient=new MongoClient();
        db=mongoClient.getDB("pearson");// database name
        return new DBcon();
    }
 
  //create a collection and insert data  
 public void insertData(String tname,DBObject dbo){
 
         DBCollection coll = db.getCollection(tname);
         if (coll == null) {
             coll = db.createCollection(tname, null);
         }
          coll.insert(dbo);//insert data object into collection 
    
    } 
 
 
 //function for update data
 public void updateData(String tname,DBObject search,DBObject dbo){
     DBCollection coll = db.getCollection(tname);
         if (coll == null) {
             coll = db.createCollection(tname, null);
         }
 
     coll.update(search, dbo);
 
 }
         
         
         
         
 public DBCollection getData(String tname){
      
       
     DBCollection coll = db.getCollection(tname);
     if (coll == null) {
             coll = db.createCollection(tname, null);
         }  
       
    
        return coll; 
 }
}
