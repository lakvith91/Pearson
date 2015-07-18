/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbops;

import com.beans.Employee;
import com.beans.PasswordHash;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;

import java.net.UnknownHostException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Lakshan
 */
public class DBcon {

    static MongoClient mongoClient;
    static DB db;

    public DBcon getDbCon() throws UnknownHostException {
        try {
            Properties properties = new Properties();
            properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("Configuration.properties"));

            String host = properties.getProperty("dbhost");
            String port = properties.getProperty("dbport");
            //  if(port.equals("")){
            mongoClient = new MongoClient(host);
            //   }else{
            //    mongoClient = new MongoClient(host,Integer.parseInt(port));
            //  }

            String dbname = properties.getProperty("dbname");
            String dbuser = properties.getProperty("dbuser");
            String dbpassword = properties.getProperty("dbpassword");

            db = mongoClient.getDB(dbname);// database name
            db.authenticate(dbuser, dbpassword.toCharArray());
            boolean exist = db.collectionExists("employee");
            if (!exist) {
                createAdminAccount();
            }

        } catch (IOException ex) {
            Logger.getLogger(DBcon.class.getName()).log(Level.SEVERE, null, ex);
        }
        return new DBcon();
    }

    public void createAdminAccount() {

        try {
            
            Employee emp = new Employee();
            emp.setEmail("mailpearsonlanka@gmail.com");
            emp.setPassword(PasswordHash.createHash("admin"));
            emp.setDesignation("1");
            
            BasicDBObject dbo = emp.toDBObject();
            DBCollection coll = db.createCollection("employee", null);
            coll.insert(dbo);
            
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(DBcon.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InvalidKeySpecException ex) {
            Logger.getLogger(DBcon.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //create a collection and insert data  
    public void insertData(String tname, DBObject dbo) {

        DBCollection coll = db.getCollection(tname);
        if (coll == null) {
            coll = db.createCollection(tname, null);
        }
        coll.insert(dbo);//insert data object into collection 

    }

    //function for update data
    public void updateData(String tname, DBObject search, DBObject dbo) {
        DBCollection coll = db.getCollection(tname);
        if (coll == null) {
            coll = db.createCollection(tname, null);
        }

        coll.update(search, dbo);

    }

    public DBCollection getData(String tname) {

        DBCollection coll = db.getCollection(tname);
        if (coll == null) {
            coll = db.createCollection(tname, null);
        }

        return coll;
    }

    public void deleteData(String tname, DBObject search) {
        DBCollection coll = db.getCollection(tname);

        coll.remove(search);

    }

}
