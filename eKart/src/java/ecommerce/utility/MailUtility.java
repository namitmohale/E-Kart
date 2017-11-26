package ecommerce.utility;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class MailUtility {

    public static void sendEmail(String from, String password, String[] to, String subject, String body) {
        Properties properties = System.getProperties();
        String host = "smtp.gmail.com";
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.user", from);
        properties.put("mail.smtp.password", password);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(properties);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for (int i = 0; i < to.length; i++) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for (int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body, "UTF-8", "html");
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (AddressException ae) {
            System.out.println(ae.toString());
        } catch (MessagingException me) {
            System.out.println(me.toString());
        }
    }

    public static void main(String[] arg) {
        String[] mail = {"rkproject24@gmail.com"};
        sendEmail("IMMUNO2018@gmail.com", "rkproject24@gmail.com", mail, "subject", "Message body");
        System.out.println("Done");
    }
}
