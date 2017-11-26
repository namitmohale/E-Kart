package ecommerce.utility;
import java.util.*;
import javax.servlet.*;
import ecommerce.database.UserIO;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.validator.GenericValidator;

public class ValidationUtility {
    
    public Map<String, List<String>> validateRegistrationForm(HttpServletRequest request) throws Exception{
        Map<String, List<String>> errorMap = new HashMap();
        
        List<String> firstNameError = new ArrayList();
        boolean flag = false;
        if(GenericValidator.isBlankOrNull(request.getParameter("firstName"))){
            firstNameError.add("'First Name' can not be empty");
            flag = true;
        }
        else if(request.getParameter("firstName").length()<3){
            firstNameError.add("Minimum allowed 'First Name' length is 3 characters");
            flag = true;
        }
        else if(request.getParameter("firstName").length()>45){
            firstNameError.add("Maximum allowed 'First Name' length is 45 characters");
            flag = true;
        }
        if(flag==true){
            errorMap.put("firstName", firstNameError);
        }
        
        List<String> lastNameError = new ArrayList();
        flag = false;
        if(GenericValidator.isBlankOrNull(request.getParameter("lastName"))){
            lastNameError.add("'Last Name' can not be empty");
            flag = true;
        }
        else if(request.getParameter("lastName").length()<3){
            lastNameError.add("Minimum allowed 'Last Name' length is 3 characters");
            flag = true;
        }
        else if(request.getParameter("lastName").length()>45){
            lastNameError.add("Maximum allowed 'Last Name' length is 45 characters");
            flag = true;
        }
        if(flag==true){
        errorMap.put("lastName", lastNameError);
        }
        
        List<String> emailError = new ArrayList();
        UserIO userio = new UserIO();
        String email = request.getParameter("email");
        String emailConfirmation = request.getParameter("emailConfirmation");
        flag = false;
        if(GenericValidator.isBlankOrNull(email) ||
           GenericValidator.isBlankOrNull(emailConfirmation)){
            emailError.add("'Email' and 'Email Confirmation' can not be empty");
            flag = true;
        }
        else if (whiteList(email)){
            emailError.add("[, ], {, }, (, ), ', /, \\, $, --, * characters are not allowed into Email Address");
            flag = true;
        }
        else if (!email.equals(emailConfirmation)) {
            emailError.add("'Email' and 'Email Confirmation' must be same");
            flag = true;
        }
        else if (!GenericValidator.isEmail(email)) {
            emailError.add("'Email' is not valid");
            flag = true;
        }
        else if (email.equals(userio.getUserStringData("UserEmail", "UserEmail", request.getParameter("email")))) {
            emailError.add("This Email Address has already been registered. Please try another");
            flag = true;
        }
        else if (email.length() > 90) {
            emailError.add("Maximum allowed 'Email Address' length is 90");
            flag = true;
        }
        if(flag==true){
        errorMap.put("email", emailError);
        }
        
        List<String> passwordError = new ArrayList();
        flag = false;
        if(GenericValidator.isBlankOrNull(request.getParameter("password")) ||
           GenericValidator.isBlankOrNull(request.getParameter("passwordConfirmation"))){
            passwordError.add("'Password' and 'Password Confirmation' can not be empty");
            flag = true;
        }
        else if(request.getParameter("password").length()<6){
            passwordError.add("Minimum 'Password' length is 6");
            flag = true;
        }
        else if(request.getParameter("password").length()>45){
            passwordError.add("Maximum allowed 'Password' length is 45");
            flag = true;
        }
        else if(!request.getParameter("password").equals(request.getParameter("passwordConfirmation"))){
            passwordError.add("'Password' and 'Password Confirmation' must be same");
            flag = true;
        }
        if(flag==true){
            errorMap.put("password", passwordError);
        }
        
        List<String> birthDateError = new ArrayList();
        flag = false;
        if (GenericValidator.isBlankOrNull(request.getParameter("year"))){
            birthDateError.add("'Birth Year' must be selected");
            flag = true;
        }
        if (GenericValidator.isBlankOrNull(request.getParameter("month"))){
            birthDateError.add("'Birth Month' must be selected");
            flag = true;
        }
        if (GenericValidator.isBlankOrNull(request.getParameter("day"))){
            birthDateError.add("'Birth Day' must be selected");
            flag = true;
        }
        if(flag==true){
            errorMap.put("birthDate", birthDateError);
        }
        
        List<String> addressLine1Error = new ArrayList();
        flag = false;
        if(GenericValidator.isBlankOrNull(request.getParameter("address1"))){
            addressLine1Error.add("'Address Line 1' can not be empty");
            flag = true;
        }
        else if(request.getParameter("address1").length()>100){
            addressLine1Error.add("Maximum allowed 'Address Line 1' length is 100");
            flag = true;
        }
        if(flag==true){
            errorMap.put("address1", addressLine1Error);
        }
        
        List<String> cityError = new ArrayList();
        flag = false;
        if(GenericValidator.isBlankOrNull(request.getParameter("city"))){
            cityError.add("'City' can not be empty");
            flag = true;
        }
        else if(request.getParameter("city").length()>100){
            cityError.add("Maximum allowed 'City' length is 100");
            flag = true;
        }
        if(flag==true){
            errorMap.put("city", cityError);
        }
        
        List<String> countryError = new ArrayList();
        flag = false;
        if(GenericValidator.isBlankOrNull(request.getParameter("country"))){
            countryError.add("'Country' can not be empty");
            flag = true;
        }
        else if(request.getParameter("country").length()>50){
            countryError.add("Maximum allowed 'Country' length is 50");
            flag = true;
        }
        if(flag==true){
            errorMap.put("country", countryError);
        }
        
        List<String> zipError = new ArrayList();
        flag = false;
        if(GenericValidator.isBlankOrNull(request.getParameter("zip"))){
            zipError.add("'Postal Code' can not be empty");
            flag = true;
        }
        else if(request.getParameter("zip").length()>30){
            zipError.add("Maximum allowed 'Postal Code' length is 30");
            flag = true;
        }
        if(flag==true){
            errorMap.put("zip", zipError);
        }
        
        return errorMap;
    }
    
    public Map<String, List<String>> validateLoginForm(HttpServletRequest request) throws Exception{
        Map<String, List<String>> errorMap = new HashMap();
        boolean flag = false;
        
        List<String> loginError = new ArrayList();
        UserIO userio = new UserIO();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        flag = false;
        if(GenericValidator.isBlankOrNull(email) || GenericValidator.isBlankOrNull(password)){
            loginError.add("'Email Address' and 'Password' can not be empty");
            flag = true;
        }
        else if (whiteList(email) || whiteList(password)){
            loginError.add("[, ], {, }, (, ), ', /, \\, $, --, * characters are not allowed into Email Address");
            flag = true;
        }
        else if (!GenericValidator.isEmail(email)) {
            loginError.add("This email is not in valid format");
            flag = true;
        }
        else if (!email.equals(userio.getUserStringData("UserEmail", "UserEmail", request.getParameter("email"))) ||
                 !password.equals(userio.getUserStringData("UserPassword", "UserEmail", request.getParameter("email")))) {
            loginError.add("Email or password is wrong. Please try again");
            flag = true;
        }
        if(flag==true){
        errorMap.put("loginError", loginError);
        }
        
        return errorMap;
    }
    
    public String validateConfirmRegistration(HttpServletRequest request) throws Exception{
        String errorString = "";
        boolean flag = false;
        boolean emailVerified = false;
        
        UserIO userio = new UserIO();
        String email = request.getParameter("email");
        String verificationCode = request.getParameter("verificationCode");
        flag = false;
        if(GenericValidator.isBlankOrNull(email) || GenericValidator.isBlankOrNull(verificationCode)){
            flag = true;
        }
        else if (whiteList(email)){
            flag = true;
        }
        else if (whiteList(verificationCode)){
            flag = true;
        }
        else if (!GenericValidator.isEmail(email)) {
            flag = true;
        }
        else if (userio.getUserIntData("UserEmailVerified", "UserEmail", email)==1) {
            emailVerified = true;
        }
        else if (!verificationCode.equals(userio.getUserStringData("UserVerificationCode", "UserEmail", email))) {
            flag = true;
        }
        
        if(emailVerified==true){
        errorString = "This email has already been verified";
        }
        else if(flag==true){
        errorString = "Please don't make a change in the verification url";
        }
        
        return errorString;
    }
    
    public boolean whiteList(String str){
        boolean flag = false;
        if(str.contains("'") || str.contains("/") || str.contains("\\") || str.contains("$") ||
           str.contains("*") || str.contains("--") || str.contains("[") || str.contains("{") ||
           str.contains("(") || str.contains("]") || str.contains("}") || str.contains(")")){
            flag = true;
        }
        return flag;
    }
}
