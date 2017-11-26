package service;

import java.io.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

public class NotSignedIn extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try{
           if (request.getHeader("Referer")!=null){
               HttpSession session = request.getSession();
               Map<String, List<String>> errorMap = new HashMap();
               List<String> errorList = new ArrayList();
               errorList.add("You are not signed in. Please sign in first");
               errorMap.put("loginError", errorList);
               session.setAttribute("loginErrorMessage", errorMap);
               session.setMaxInactiveInterval(3);
               response.sendRedirect("log_in.jsp");
           }
           else{
               response.sendRedirect("index.jsp");
           }
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
// </editor-fold>
}
