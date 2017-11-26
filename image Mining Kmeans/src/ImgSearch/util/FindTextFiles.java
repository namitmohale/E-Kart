package ImgSearch.util;

import java.io.File;

import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class FindTextFiles {

    private static String parentDirectory = "C:\\";
    private static String fileExtension = ".txt";

    public List search(String parentDirectory, String fileExtension) {
        List listFile = new ArrayList();
        FileFilter fileFilter = new FileFilter(fileExtension) {
        };

        File parentDir = new File(parentDirectory);

        // Put the names of all files ending with .txt in a String array

        String[] listOfTextFiles = parentDir.list((FilenameFilter) fileFilter);


        if (listOfTextFiles.length == 0) {

            JOptionPane.showMessageDialog(null, "There are no text files in this direcotry!");
            return listFile;


        }
        System.out.println("I found these files with " + fileExtension + " extension:");
        List flocation = new ArrayList();
        for (String file : listOfTextFiles) {

            String absoluteFilePath = new StringBuffer(parentDirectory).append(File.separator).append(file).toString();

            listFile.add(file);
            System.out.println(absoluteFilePath);
            flocation.add(absoluteFilePath);

        }
        t:
        return listFile;
    }

    public static void main(String[] args) {

        FindTextFiles l = new FindTextFiles();
        l.search("c:\\", ".txt");

    }
}
