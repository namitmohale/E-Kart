package ecommerce.business;

public class User{
    private int UserID;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String birthDate;
    private String phone;
    private String address;
    private String address2;
    private String city;
    private String zip;
    private String country;
    private String gender;
    private int emailVerified;
    private String registrationDate;
    private String verificationCode;
    //Set methods
    public void setUserID(int UserID){
       this.UserID = UserID;
    }
    public void setFirstName(String firstName){
       this.firstName = firstName;
    }
    public void setLastName(String lastName){
       this.lastName = lastName;
    }
    public void setEmail(String email){
       this.email = email;
    }
    public void setPassword(String password){
       this.password = password;
    }
    public void setBirthDate(String birthDate){
        this.birthDate = birthDate;
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
    public void setGender(String gender){
        this.gender = gender;
    }
    public void setEmailVerified(int emailVerified){
        this.emailVerified = emailVerified;
    }
    public void setRegistrationDate(String registrationDate){
        this.registrationDate = registrationDate;
    }
    public void setVerificationCode(String verificationCode){
        this.verificationCode = verificationCode;
    }
    
    //Get methods
    public int getUserID(){
       return UserID;
    }
    public String getFirstName(){
       return firstName;
    }
    public String getLastName(){
       return lastName;
    }
    public String getEmail(){
       return email;
    }
    public String getPassword(){
       return password;
    }
    public String getBirthDate(){
       return birthDate;
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
    public String getGender(){
       return gender;
    }
    public int getEmailVerified(){
        return emailVerified;
    }
    public String getRegistrationDate(){
        return registrationDate;
    }
    public String getVerificationCode(){
        return verificationCode;
    }
}
