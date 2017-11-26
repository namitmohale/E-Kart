 
<%@page import="java.lang.String"%>
<%@page import="dal.dbConnection"%>
<%@page import="dal.FileStreamsReadnWrite"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="dal.NPLAlgo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.*"%>

<%
    try
    {
 
   
    Connection con = null;
    PreparedStatement pst = null;
    String reqstr = session.getAttribute("reqstr").toString(); 
     String item_id = session.getAttribute("prodid").toString();  
    String comments = null;
 

    if(session.getAttribute("userid")==null) response.sendRedirect("log_in.jsp?"+reqstr);
       String user_id =session.getAttribute("userid").toString();

    int i = 0;
    //Integer totalcommentvalue = 0;
    comments = request.getParameter("txtmsa");
if (comments.trim().length()==0) return;
        FileStreamsReadnWrite fileread = new FileStreamsReadnWrite();
        HashMap<String, Integer> sorted_map_word_value = new HashMap<String, Integer>();
        List<String> adj = null;
        sorted_map_word_value = fileread.getWords("c:\\WordValue.txt");
        System.out.println("--------------------------You have Defined Adj Value---------------------------------------");
        for (String key : sorted_map_word_value.keySet()) {
           System.out.println(key + ":" + sorted_map_word_value.get(key));
       }
        System.out.println("-----------------------------------------------------------------");
        NPLAlgo objnlp = new NPLAlgo();
        adj = objnlp.GetAdjPhrases(comments);
      
        // HashMap<String, Integer> m = new HashMap<String, Integer>();
        Integer totalcommentvalue = 0;
        for (String a : adj) {
          System.out.println("------------------------Found Adj in Comments-----------------------------------------");
           System.out.println(a);
            boolean blnExists = sorted_map_word_value.containsKey(a);
            if (blnExists) {
                totalcommentvalue += sorted_map_word_value.get(a);
               // System.out.println(a + " exists in HashMap and value : " + sorted_map_word_value.get(a));
            }
             System.out.println("-----------------------------------------------------------------");
        }
        System.out.println("Comment value=" + totalcommentvalue);
    

    try {
        con = dbConnection.makeCon();
        String query = "insert into comments_nlp(item_id,comments,commentValue,user_id,com_date)values(?,?,?,?,now())";
        pst = con.prepareStatement(query);
        pst.setString(1, item_id);       
        pst.setString(2, comments);
        pst.setInt(3, totalcommentvalue);
        pst.setString(4, user_id);

        i = pst.executeUpdate();

        if (i > 0) {
            session.setAttribute("msg", "Comment  successfully post !!");
           // rd.forward(request, response);

             response.sendRedirect("product_details.jsp?"+reqstr);
        } else {
            session.setAttribute("msg", "Comment not successfully post ?????");
            response.sendRedirect("product_details.jsp?"+reqstr);
        }

    } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.toString());
    }
    }
    catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.toString());
    }

%>