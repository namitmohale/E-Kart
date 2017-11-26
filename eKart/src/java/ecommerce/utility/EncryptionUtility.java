 
package ecommerce.utility;

import java.security.*;

  
public class EncryptionUtility {
    
    public static String sha1(String input) {
        String hash = "";
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-1");            
            digest.update(input.getBytes());
            hash = new String(digest.digest());
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();
        }
        
        return hash;

    }
}
