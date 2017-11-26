package ecommerce.temporary;

import ecommerce.business.User;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

public class UserInfoUtility {

    public static User saveUserInformation(HttpServletRequest request,
                                           int emailVerified,
                                           Date registrationDate,
                                           String verificationCode) {

        User user = new User();

        user.setFirstName(request.getParameter("firstName"));

        user.setLastName(request.getParameter("lastName"));

        user.setEmail(request.getParameter("email"));

        user.setPassword(request.getParameter("password"));

        user.setBirthDate(request.getParameter("day") + "/" +
                          request.getParameter("month") + "/" +
                          request.getParameter("year"));
        
        if(request.getParameter("phone")!=""){
        user.setPhone(request.getParameter("phone"));
        }
        
        user.setAddress(request.getParameter("address1"));
        
        if(request.getParameter("address2")!=""){
        user.setAddress2(request.getParameter("address2"));
        }
        
        user.setCity(request.getParameter("city"));

        user.setZip(request.getParameter("zip"));

        user.setCountry(request.getParameter("country"));
        
        user.setGender(request.getParameter("gender"));
        try{
        user.setEmailVerified(emailVerified);
        
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        user.setRegistrationDate(dateFormat.format(registrationDate));
        
        user.setVerificationCode(verificationCode);
        }catch(Exception ed)
        {
            System.out.println("Error--------------------------\n"+ed.toString());
        }
        return user;
    }
}
