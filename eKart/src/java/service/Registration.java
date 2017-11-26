package service;

import ecommerce.temporary.UserInfoUtility;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import ecommerce.utility.*;
import ecommerce.business.User;
import ecommerce.database.UserIO;
import java.text.*;
import java.util.*;

public class Registration extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        UserInfoUtility userInfo = new UserInfoUtility();
        HttpSession session;
        MailUtility mailUtil = new MailUtility();
        UserIO userio = new UserIO();
        try{
            
            String verificationCode = request.getParameter("email");
            
            User user = userInfo.saveUserInformation(request, 0, new Date(), verificationCode.getBytes().toString());
            userio.addUser(user);
            //Sending Email
            String from = "IMMUNO2018@gmail.com";
            String pass = "rajesh@gmail.com";
            String[] to = {user.getEmail()};
            String subject = "Welcome to eCommerce!";
            String body = 
                                "<p>Hi <b>" + user.getFirstName() + " " +
                                user.getLastName() + "</b></p>" +
                                "<p>You have just registered in <b>www.ecommerce.com</b>. This is a shopping website and you can buy whatever you want too easily, too fast and just with your Shopping Card by distance</p>" +
                                "<p>Your password: <b>156156</b></p>" +
                                "<a href='http://localhost:8084/eNeuroCart/ConfirmRegistration?email=" + user.getEmail() + 
                                "&verificationCode=" + user.getVerificationCode() + "'>Click to this link to verify your email</a>" +
                                "<br/><br/>" +
                                "<b>Please do not reply to this email address</b>" +
                                "<p>Best Regards</p>";
            mailUtil.sendEmail(from, pass, to, subject, body);
            
            response.sendRedirect("confirm_registration.jsp");
        }catch(Exception e){
                out.close();
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
