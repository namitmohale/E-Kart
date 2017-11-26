 
package dal;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
public class comment extends HttpServlet {

    Connection con = null;
    PreparedStatement pst = null;
    String fname = null;
    String lname = null;
    String Occupation = null;
    String EmailID = null;
    String Contactno = null;
    String Message = null;
    int i = 0;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        
        Message = request.getParameter("txtmsa");

     
        FileStreamsReadnWrite fileread = new FileStreamsReadnWrite();
        HashMap<String, Integer> sorted_map_word_value = new HashMap<String, Integer>();
        List<String> adj = null;
        sorted_map_word_value = fileread.getWords("c:\\WordValue.txt");
//        for (String key : sorted_map_word_value.keySet()) {
//            System.out.println(key + ":" + sorted_map_word_value.get(key));
//        }
        NPLAlgo objnlp = new NPLAlgo();
        adj = objnlp.GetAdjPhrases(Message);
//        for (String a : adj) {
//            System.out.println("----:" + a.toString());
//        }
        // HashMap<String, Integer> m = new HashMap<String, Integer>();
        Integer totalcommentvalue = 0;
        for (String a : adj) {
            System.out.println(a);
            boolean blnExists = sorted_map_word_value.containsKey(a);
            if (blnExists) {
                if(a!=null && (a.contains("not") || a.contains("NOT"))){
                
                }else{
                    totalcommentvalue += sorted_map_word_value.get(a);
                }
                
               // System.out.println(a + " exists in HashMap and value : " + sorted_map_word_value.get(a));
            }
        }

  try {
        
            out.println("<h1> comment Value="+ totalcommentvalue +"</h1>");
      response.sendRedirect("BookDetail.jsp");

        } finally {
            out.close();
        }

        try {
//            con =MakeCon.dbcon();
//            String query = "insert into feedback(FirstName,LastName,Occupation,Email_ID,Contactno,Message)values(?,?,?,?,?,?)";
//            pst = con.prepareStatement(query);
//            pst.setString(1, fname);
//            pst.setString(2, lname);
//            pst.setString(3, Occupation);
//            pst.setString(4, EmailID);
//            pst.setString(5, Contactno);
//            pst.setString(6, Message);
//             i = pst.executeUpdate();
//
//             if (i > 0) {
//                 session.setAttribute("MSG", "Data hase been Saved successfully !!");
//                response.sendRedirect("Feedback.jsp");
//            } else {
//                session.setAttribute("MSG", "Data has been not Saved.!!");
//                response.sendRedirect("Feedback.jsp");
//            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.toString());
        }

    }
}
