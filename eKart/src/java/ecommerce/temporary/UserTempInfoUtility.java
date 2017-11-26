package ecommerce.temporary;

import javax.servlet.http.HttpServletRequest;
import ecommerce.business.UserTempInfo;
import javax.servlet.http.HttpSession;
import org.apache.commons.validator.GenericValidator;

public class UserTempInfoUtility{

    public static void saveUserTempRegistrationInfo(HttpServletRequest request) {
        
        HttpSession session = request.getSession();
        UserTempInfo userInfo = new UserTempInfo();
        
        boolean flag = false;
        if (!GenericValidator.isBlankOrNull(request.getParameter("firstName"))) {
            userInfo.setFirstName(request.getParameter("firstName"));
            flag = true;
        }
        
        if (!GenericValidator.isBlankOrNull(request.getParameter("lastName"))) {
            userInfo.setLastName(request.getParameter("lastName"));
            flag = true;
        }
        
        if (!GenericValidator.isBlankOrNull(request.getParameter("email"))) {
            userInfo.setEmail(request.getParameter("email"));
            flag = true;
        }
        if (!GenericValidator.isBlankOrNull(request.getParameter("emailConfirmation"))) {
            userInfo.setEmailConfirmation(request.getParameter("emailConfirmation"));
            flag = true;
        }        
        if (!GenericValidator.isBlankOrNull(request.getParameter("phone"))) {
            userInfo.setPhone(request.getParameter("phone"));
            flag = true;
        }
        
        if (!GenericValidator.isBlankOrNull(request.getParameter("address1"))) {
            userInfo.setAddress(request.getParameter("address1"));
            flag = true;
        }
        
        if (!GenericValidator.isBlankOrNull(request.getParameter("address2"))) {
            userInfo.setAddress2(request.getParameter("address2"));
            flag = true;
        }
        
        if (!GenericValidator.isBlankOrNull(request.getParameter("city"))) {
            userInfo.setCity(request.getParameter("city"));
            flag = true;
        }
        
        if (!GenericValidator.isBlankOrNull(request.getParameter("zip"))) {
            userInfo.setZip(request.getParameter("zip"));
            flag = true;
        }
        
        if (!GenericValidator.isBlankOrNull(request.getParameter("country"))) {
            userInfo.setCountry(request.getParameter("country"));
            flag = true;
        }
        
        if (flag == true){
            session.setAttribute("registrationTempInfo", userInfo);
        }
    }
}
