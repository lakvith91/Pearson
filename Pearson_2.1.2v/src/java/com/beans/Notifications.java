/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

/**
 *
 * @author Lakshan
 */
public class Notifications {

    private String sender;
    private String receiver;
    private String message;
    private boolean read;
    private String url;
    private int claimId;

    /**
     * @return the sender
     */
    public String getSender() {
        return sender;
    }

    /**
     * @param sender the sender to set
     */
    public void setSender(String sender) {
        this.sender = sender;
    }

    /**
     * @return the receiver
     */
    public String getReceiver() {
        return receiver;
    }

    /**
     * @param receiver the receiver to set
     */
    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the read
     */
    public boolean isRead() {
        return read;
    }

    /**
     * @param read the read to set
     */
    public void setRead(boolean read) {
        this.read = read;
    }

    /**
     * @return the url
     */
    public String getUrl() {
        return url;
    }

    /**
     * @param url the url to set
     */
    public void setUrl(String url) {
        this.url = url;
    }

    public BasicDBObject toDBObject() {
        BasicDBObject obj = new BasicDBObject();
        obj.put("sender", sender);
        obj.put("receiver", receiver);
        obj.put("message", message);
        obj.put("read", read);
        obj.put("claimid", claimId);
        obj.put("url", url);

        return obj;

    }

    public static Notifications fromDBObject(DBObject dbo) {
        Notifications n = new Notifications();
        n.sender = (String) dbo.get("sender");
        n.receiver = (String) dbo.get("receiver");
        n.message = (String) dbo.get("message");
        n.read = (Boolean) dbo.get("read");
        n.url = (String) dbo.get("url");
        n.claimId = (Integer) dbo.get("claimid");

        return n;
    }

    public void setNotification(String sender, String receiver, String msg, boolean read, String url, int claimid) {

        this.sender = sender;
        this.receiver = receiver;
        this.message = msg;
        this.read = read;
        this.url = url;
        this.claimId = claimid;
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

}
