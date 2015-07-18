/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DataHandler;

import com.mongodb.*;
import java.net.UnknownHostException;

/**
 *
 * @author Lakshan
 */
public class DataCon {

    static MongoClient mongoClient;
    static DB db;

    public DataCon() {
    }

 public DataCon getDbCon() throws UnknownHostException {

        mongoClient = new MongoClient();
        db = mongoClient.getDB("testDB");
        return new DataCon();

    }
    
 
    public void insertData(String tname,DBObject dbo){
    
          DBCollection coll = db.getCollection(tname);
          coll.insert(dbo);
    
    }
    /*
    public void insertData(String bulkID, String project, String claim_no, String Select1, String billdate, String eventdate, String amount) {


        DBCollection coll = db.getCollection("emp1");
        BasicDBObject doc = new BasicDBObject("Bulk_ID", bulkID).append("project", project).append("claim_no", claim_no).append("Select1", Select1).append("Bill_date", billdate)
        .append("event_date", eventdate).append("amount", amount);
        coll.insert(doc);

    }*/

    public DBObject insertClaim(String bulkID, String project, String claim_no, String Select1, String billdate, String eventdate, String amount){
       
        BasicDBObject doc = new BasicDBObject("Bulk_ID", bulkID).append("project", project).append("claim_no", claim_no).append("Select1", Select1).append("Bill_date", billdate)
        .append("event_date", eventdate).append("amount", amount);
        //coll.insert(doc);
        
        return doc;
    }
    
    public DBObject NewUser(String fname,String lname,String password,String signature,String proman,String empid,String agm){
       BasicDBObject doc=new BasicDBObject();
       doc.put("fname", fname);
       doc.put("lname",lname);
       doc.put("password",password);
       doc.put("signature",signature);
       doc.put("proman",proman);
       doc.put("empid",empid);
       doc.put("agm",agm);
       return doc;
    }
    public DBCursor getData(String tname) {

        DBCollection coll = db.getCollection(tname);
        DBCursor myDoc = coll.find();
       // while (myDoc.hasNext()) {
       //  DBObject dBObject = myDoc.next();
       //    System.out.println(dBObject);
       // }
        return myDoc;
    }
}
