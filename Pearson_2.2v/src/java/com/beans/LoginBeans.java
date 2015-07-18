/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.beans;

/**
 *
 * @author Lakshan
 */
public class LoginBeans {
    private String username;
    private String password;
    private boolean valid;
 
   
    
    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword(){
       // return passctr.decrypt(password); 
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password){
        //this.password =passctr.encrypt(password);
       // this.password=PasswordHash.createHash(password);
        this.password=password;
    }

    /**
     * @return the valid
     */
    public boolean isValid() {
        return valid;
    }

    /**
     * @param valid the valid to set
     */
    public void setValid(boolean valid) {
        this.valid = valid;
    }
    
}
