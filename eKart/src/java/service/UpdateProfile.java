/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import ecommerce.database.UserIO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "UpdateProfile", urlPatterns = {"/UpdateProfile"})
public class UpdateProfile extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        UserIO userio = new UserIO();
        try {
            String dob = request.getParameter("gender");

            if (userio.UpdateUser(1, request.getParameter("firstName"), request.getParameter("lastName"), request.getParameter("email"), request.getParameter("password"), dob, request.getParameter("phone"), request.getParameter("address1"), request.getParameter("address2"), request.getParameter("city"), request.getParameter("zip"), request.getParameter("country"), request.getParameter("gender"))) {
                session.setAttribute("MSG", "Your Account is  Successfully Updated!!.");
                response.sendRedirect("userprofile.jsp");

            } else {
                session.setAttribute("MSG", "Your Account is Not Updated !");
                response.sendRedirect("userprofile.jsp");
            }

        } catch (Exception e) {
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
