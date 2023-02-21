package com.testresult.email;

import java.util.ArrayList;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailSetup {
	private MimeMultipart multipart = new MimeMultipart();
	
	public void sendTestResultMailwithAttachments() {
		String From = "milanc3494@gmail.com";
		String To = "milanc3494@gmail.com";
		String Password = "bhjhlioayuuqnsil";
		String Subject = "Test Execution Report";
		String FilePath = System.getProperty("user.dir") + "/test-output/AutomationReports/TestExecutionReport.html";
		
		MailSetup mailSetup = new MailSetup();
		mailSetup.sendMailwithAttachments(From,Password,To,Subject,FilePath);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked", "static-access" })
	public void sendMailwithAttachments(final String from,final String passwd, String to, String subject, String FilePath) {
        Properties properties = new Properties(); //System.getProperties();
        properties.put("mail.smtp.auth", true);
        properties.put("mail.smtp.starttls.enable", true);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, passwd);
            }
        });
        
        // Used to debug SMTP issues
        session.setDebug(false);
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            //message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            //**********************************
			//tokenize out the recipients in case they came in as a list
			StringTokenizer tok = new StringTokenizer(to,";");
			ArrayList emailTos = new ArrayList();
			while(tok.hasMoreElements()){
			emailTos.add(new InternetAddress(tok.nextElement().toString()));
			}
			
			InternetAddress[] toAddress = new InternetAddress[emailTos.size()];
			toAddress = (InternetAddress[]) emailTos.toArray(toAddress);
			message.setRecipients(MimeMessage.RecipientType.TO,toAddress);
            //**********************************
            
        //****************************
		// This mail will have two parts, BODY and embedded image
         //MimeMultipart multipart = new MimeMultipart();

         // first part (the html)
         BodyPart messageBodyPart = new MimeBodyPart();
         messageBodyPart.setContent("<i><b><u>Please review attached test execution result report.</u></b></i><br><br>", "text/html");
         multipart.addBodyPart(messageBodyPart);

		 addAttachment(multipart,FilePath);
		
         // put everything together
         message.setContent(multipart);
         //**********************************
         
         System.out.println("sending Test Result...");
         // Send message
         Transport transporter = session.getTransport("smtp");
		 transporter.connect();
		 transporter.send(message);
         System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
           System.out.println(mex.toString());
        }
    }

    private void addAttachment(MimeMultipart multipart, String filename) throws MessagingException{
    	MimeBodyPart attachmentPart = new MimeBodyPart();
    	FileDataSource fileDataSource = new FileDataSource(filename) {
	    @Override
	    public String getContentType() {
	  	return "application/octet-stream";
	    }
	};
	
	attachmentPart.setDataHandler(new DataHandler(fileDataSource));
	attachmentPart.setFileName(fileDataSource.getName());
    	multipart.addBodyPart(attachmentPart);
	}

}
