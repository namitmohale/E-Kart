/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import ecommerce.business.User;
import ecommerce.database.UserIO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rajesh-pc
 */
@WebServlet(name = "login_check", urlPatterns = {"/login_check"})
public class login_check extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             response.setContentType("text/html;charset=UTF-8");
       
        HttpSession session;
        User user = new User();
        String redirect;
        try {
            UserIO userio = new UserIO();
            ServletContext context = getServletContext();

            session = request.getSession();
            user = userio.getUser(request.getParameter("email"));
            redirect = (String) context.getAttribute("referer");
            context.removeAttribute("referer");
            
            if(user.getUserID()==0|| user.getEmail()==null)
            {
              response.sendRedirect("log_in.jsp"); 
              
              return;
            }
            session.setAttribute("user", user);
            session.setAttribute("userid", user.getUserID());
            if("admin@gmail.com".equals(user.getEmail()))
            {
                response.sendRedirect("admin/index.jsp");
                return;
            }
            session.setMaxInactiveInterval(11 * 60);
            if (!redirect.contains("log_in.jsp")
                    && !redirect.contains("registration.jsp")) {
                response.sendRedirect(redirect);
            } else {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            out.close();
        }
        }catch(Exception ex){
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login_check</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login_check at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } 
        finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
