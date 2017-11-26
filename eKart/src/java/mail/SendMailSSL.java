package mail;

import ecommerce.business.User;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailSSL {

    static public Session mailsetting() {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication("IMMUNO2018@gmail.com", "rajesh@gmail.com");
                    }
                });
        return session;
    }

    public static String Sendpassword(String mailto) {
        String result;
        String myMessage = "";
        User user = new User();
        
        ecommerce.database.UserIO obj = new ecommerce.database.UserIO();
        Session session = mailsetting();
        try {

            user = obj.getUser(mailto);

            System.out.println("Password Retrived success");
        } catch (Exception ex) {
            System.out.println(ex.toString());
        }

        try {
            if (user.getUserID() != 0 || user.getEmail() != null) {
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress("raghaash2016@gmail.com"));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(user.getEmail()));
                message.setSubject("Password Recovery System of eCommerce");
                message.setText("Dear eComerce Customer,"
                        + "\n\n Your Email Address " + user.getEmail()+"\n\n password :"+user.getPassword());

                Transport.send(message);
                result = "Mail has  been sent in your registered email adddress .plz check your password";
                System.out.println("Done");
            }
            else
            {
             result="Invalid Email Address";   
            }
        } catch (MessagingException e) {
            result = e.toString();
        }
        return result;
    }

//    public static void main(String[] args) {
//
//        Session session = mailsetting();
//        try {
//
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress("raghaash2016@gmail.com"));
//            message.setRecipients(Message.RecipientType.TO,
//                    InternetAddress.parse("raghaash2016@gmail.com"));
//            message.setSubject("Testing Subject");
//            message.setText("Dear Mail Crawler,"
//                    + "\n\n No spam to my email, please!");
//
//            Transport.send(message);
//
//            System.out.println("Done");
//
//        } catch (MessagingException e) {
//            throw new RuntimeException(e);
//        }
//    }
}
