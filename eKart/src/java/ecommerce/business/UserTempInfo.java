 
package ecommerce.business;

import java.util.Date;


public class UserTempInfo {
    private String firstName;
    private String lastName;
    private String email;
    private String emailConfirmation;
    private String phone;
    private String address;
    private String address2;
    private String city;
    private String zip;
    private String country;
    //Constructor

    public UserTempInfo() {
        firstName = "";
        lastName = "";
        email = "";
        emailConfirmation = "";
        phone = "";
        address = "";
        address2 = "";
        city = "";
        zip = "";
        country = "";
    }
        
    //Set methods
    public void setFirstName(String firstName){
       this.firstName = firstName;
    }
    public void setLastName(String lastName){
       this.lastName = lastName;
    }
    public void setEmail(String email){
       this.email = email;
    }
    public void setEmailConfirmation(String emailConfirmation){
       this.emailConfirmation = emailConfirmation;
    }
    public void setPhone(String phone){
        this.phone = phone;
    }
    public void setAddress(String address){
        this.address = address;
    }
    public void setAddress2(String address2){
        this.address2 = address2;
    }
    public void setCity(String city){
        this.city = city;
    }
    public void setZip(String zip){
        this.zip = zip;
    }
    public void setCountry(String country){
        this.country = country;
    }
    
    //Get methods
    public String getFirstName(){
       return firstName;
    }
    public String getLastName(){
       return lastName;
    }
    public String getEmail(){
       return email;
    }
    public String getEmailConfirmation(){
       return emailConfirmation;
    }
    public String getPhone(){
       return phone;
    }
    public String getAddress(){
       return address;
    } 
    public String getAddress2(){
       return address2;
    }
    public String getCity(){
        return city;
    }
    public String getZip(){
        return zip;
    }
    public String getCountry(){
        return country;
    }
}
