/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet(name = "contactus", urlPatterns = {"/contactus"})
public class contactus extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet contactus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet contactus at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
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
        HttpSession session = request.getSession(true);
        Connection con = null;
        PreparedStatement pst = null;
        String fname =request.getParameter("Name");
        String ph = request.getParameter("Phone");
        String email = request.getParameter("Email");
        String qtype = request.getParameter("combType");
        String Message = request.getParameter("Message");
        String qstatus = "processing";
        try {
            con = dal.dbConnection.makeCon();
            String query = "insert into feedback_query(uName,ph,email,qType,Message,qstatus)values(?,?,?,?,?,?)";
            pst = con.prepareStatement(query);
            pst.setString(1, fname);
            pst.setString(2, ph);
            pst.setString(3, email);
            pst.setString(4, qtype);
            pst.setString(5, Message);
            pst.setString(6, qstatus);
            int i = pst.executeUpdate();

            if (i > 0) {
                session.setAttribute("MSG", "Data hase been Saved successfully !!");
                response.sendRedirect("contact.jsp");
            } else {
                session.setAttribute("MSG", "Data has been not Saved.!!");
                response.sendRedirect("contact.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.toString());
        }

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
