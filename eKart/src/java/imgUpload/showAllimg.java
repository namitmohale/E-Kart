/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package imgUpload;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rajesh
 */
public class showAllimg extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out1 = response.getWriter();
        try {

            //  File f = new File(request.getContextPath() + "/imgData/");

            //  File[] list = f.listFiles();
//You will get list of all files in your upload folder -

//You just need to loop through it like this -
            // .getRealPath("/")+"emp_image\\image\\"
            File f = new File(request.getRealPath("/") + "imgData\\");

            // File[] list2 = f2.listFiles();
            File[] list = f.listFiles();
            File flist = null;
            out1.println("<html>");
            out1.print("<body>");
            out1.print("<table><tr>");

            for (int i = 0; i < list.length; i++) {
                flist = list[i];
                // use this file object to create img tag's in your jsp
                String ig = flist.getName().toString();
                //for (int col = 1; col <= 3; col++) {
                // out1.print("<td> <a href=\"#"> <img border=2 src=imgData/" + flist.getName().toString() + " width=137 height=140> </a> </td>");
                out1.write("<td> <a href=\"done.jsp?PID=" + flist.getName().toString() + "\" ><img border=2 src=imgData/" + flist.getName().toString() + " width=137 height=140>  </a>  </td>");

                //}
            }
            out1.print("</tr>");
            out1.print("</table>");
            out1.print("</body>");
            out1.print("</html>");
        } finally {
            out1.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
