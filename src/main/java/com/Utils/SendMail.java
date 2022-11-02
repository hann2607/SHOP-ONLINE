package com.Utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;

public class SendMail {
	public void sendmail(String Email, String pass, String To, String Subject, String body) {
		final String username = Email;
		final String password = pass;
		Properties p = new Properties();
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
		p.put("mail.smtp.port", 587);

		Session ss = Session.getInstance(p, new javax.mail.Authenticator() {
			@Override
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(username, password);
			}
		});

		String emailTo = To;
		String emailSubject = Subject;
		String emailContent = body;

		try {
			Message msg = new MimeMessage(ss);

			MimeBodyPart contentPart = new MimeBodyPart();
			contentPart.setContent(emailContent, "text/html; charset=utf-8");

			msg.setFrom(new InternetAddress(username));
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
			msg.setSubject(emailSubject);
			msg.setText(emailContent);
			msg.setContent(emailContent, "text/plain; charset=utf-8");
			Transport.send(msg);
			System.out.println("gui thanh cong!");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
