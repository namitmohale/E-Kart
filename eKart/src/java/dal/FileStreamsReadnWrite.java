package dal;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
public class FileStreamsReadnWrite {
    public void addWord(String word, Integer value) {
    }
    public HashMap getWords(String fullpathname) {
        HashMap<String, Integer> sorted_map_word_value = new HashMap<String, Integer>();
        try {
            FileInputStream fstream = new FileInputStream(fullpathname);
            // Get the object of DataInputStream
            DataInputStream in = new DataInputStream(fstream);
            BufferedReader br = new BufferedReader(new InputStreamReader(in));
            String strLine;
            //Read File Line By Line
            String[] word = null;
            while ((strLine = br.readLine()) != null) {
                word = strLine.split("=");
                sorted_map_word_value.put(word[0].trim().toString(), Integer.parseInt(word[1].trim().toString()));
            }
            //Close the input stream
            in.close();
           
//            Writer output = null;
//            File file = new File("colorsANDnumbersWrite.data");
//            output = new BufferedWriter(new FileWriter(file));
//            for (String key : sorted_map_word_value.keySet()) {
//                System.out.println(key + ":" + sorted_map_word_value.get(key));
//            }
//            output.close();
          //  System.out.println("Your file has been written");

        } catch (Exception e) {//Catch exception if any
            System.err.println("Error: " + e.getMessage());
        }
        return sorted_map_word_value;
    }
    public static void main(String args[]) {
        FileStreamsReadnWrite fileread = new FileStreamsReadnWrite();
        HashMap<String, Integer> sorted_map_word_value = new HashMap<String, Integer>();
        sorted_map_word_value = fileread.getWords("c:\\WordValue.txt");
         for (String key : sorted_map_word_value.keySet()) {
                System.out.println(key + ":" + sorted_map_word_value.get(key));
            }
    }
}
