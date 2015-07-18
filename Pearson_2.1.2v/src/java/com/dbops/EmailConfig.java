/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbops;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Lakshan
 */
public class EmailConfig {

    public void sendMail(String to, String subject, String text) throws AddressException {
        try {
            Properties properties = new Properties();
            properties.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("Configuration.properties"));

            Address[] address = new Address[1];
            address[0] = new InternetAddress(to);

           
            properties.setProperty("mail.smtp.host", properties.getProperty("host"));
            properties.setProperty("mail.smtp.socketFactory.class", properties.getProperty("socketFactory.class"));
            properties.setProperty("mail.smtp.socketFactory.fallback", properties.getProperty("socketFactory.fallback"));
            properties.setProperty("mail.smtp.port", properties.getProperty("port"));
            properties.setProperty("mail.smtp.socketFactory.port", properties.getProperty("socketFactory.port"));
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.debug", "true");
            properties.put("mail.store.protocol", "pop3");
            properties.put("mail.transport.protocol", "smtp");

            final String username = properties.getProperty("username");
            final String password = properties.getProperty("password");
            try {
                Session session = Session.getDefaultInstance(properties,
                        new Authenticator() {
                            @Override
                            protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(username, password);
                            }
                        });
                // -- Create a new message --
                Message msg = new MimeMessage(session);
                // -- Set the FROM and TO fields --
                msg.setFrom(new InternetAddress(username));
                msg.addRecipients(Message.RecipientType.TO, address);

                msg.setSubject(subject);

                msg.setText(text);
                msg.setSentDate(new Date());
                Transport.send(msg);
                //System.out.println("Message sent.");
            } catch (MessagingException e) {
                //System.out.println("Erreur d'envoi, cause: " + e);
            }

        } catch (IOException ex) {
            Logger.getLogger(EmailConfig.class.getName()).log(Level.SEVERE, null, ex);
            //System.out.println("Erreur d'envoi, cause: " + e);
        }

    }

}
