package service;

import ecommerce.business.User;
import ecommerce.database.UserIO;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet(name = "Logout", urlPatterns = {"/Logout"})
public class Logout extends HttpServlet {

      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session;
        try {
            if (request.getHeader("Referer")!=null){
                UserIO userio = new UserIO();
                ServletContext context = getServletContext();
            
                session = request.getSession();
                session.invalidate();
                response.sendRedirect("index.jsp");
            }
            else{
                response.sendRedirect("index.jsp");
            }
        }catch(Exception e){
                System.out.println(e.getMessage());
                out.close();
            }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        processRequest(request, response);
    }
}