package dal;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

public class Main {

    public static void main(String[] args) throws IOException {
        FileStreamsReadnWrite fileread = new FileStreamsReadnWrite();
        HashMap<String, Integer> sorted_map_word_value = new HashMap<String, Integer>();
        List<String> adj = null;
        sorted_map_word_value = fileread.getWords("c:\\WordValue.txt");
//        for (String key : sorted_map_word_value.keySet()) {
//            System.out.println(key + ":" + sorted_map_word_value.get(key));
//        }
        NPLAlgo objnlp = new NPLAlgo();
        adj = objnlp.GetAdjPhrases("this is not good a product.this is good product. This is good product.");
//        for (String a : adj) {
//            System.out.println("----:" + a.toString());
//        }
        // HashMap<String, Integer> m = new HashMap<String, Integer>();
        Integer totalcommentvalue = 0;
        for (String a : adj) {
           // System.out.println(a);
            boolean blnExists = sorted_map_word_value.containsKey(a);
            if (blnExists) {
                totalcommentvalue += sorted_map_word_value.get(a);
               System.out.println(a + " exists in HashMap and value : " + sorted_map_word_value.get(a));
            }
        }
         System.out.println("\n-------------------------------------------------------------------------------\n");
         System.out.println("Comment value=" + totalcommentvalue);
    }
}
