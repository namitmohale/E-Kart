/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import dal.dbConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
public class addProduct extends HttpServlet {

    String pname = null;
    String pname1 = null;
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String catid = null;
    String productname = null;
    String proddesc=null;
    String price = null;
    String qty = null;
    String password = null;    
    String fullImagepath = null;
    HttpSession session = null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addProduct at " + request.getContextPath() + "</h1>");
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
         int i = 0;
        response.setContentType("text/html");
        ServletConfig config = getServletConfig();
        String context = config.getServletContext().getRealPath("/");
        String imagePath = context + "/images";
        boolean status = false;
        String fullfilename = null;
        java.util.Date d = new java.util.Date();
        long timestamp = d.getTime();
        try {
            File projectDir = new File("imagePath");
            if (!projectDir.exists()) {
                projectDir.mkdirs();

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
       // String catid=request.getParameter("combCat");
        boolean isMultipart = ServletFileUpload.isMultipartContent(new ServletRequestContext(request));
        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                List/*FileItem*/ items = upload.parseRequest(request);
                Iterator iter = items.iterator();
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();
                    if (item.isFormField()) {
                        if (item.getFieldName().equalsIgnoreCase("combCat")) {
                            catid = item.getString();
                             System.out.println("Category name : " + catid);
                        }
                         if (item.getFieldName().equalsIgnoreCase("txtProductCondition")) {
                            proddesc = item.getString();
                             System.out.println("desc  name : " + proddesc);
                        }
                         
                        
                        if (item.getFieldName().equalsIgnoreCase("productname")) {
                            productname = item.getString();
                            System.out.println("user name : " + productname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("price")) {
                            price = item.getString();
                            System.out.println("user name : " + price);
                        }
                       
                    } else {
                       fullfilename = "image" + "_" + timestamp;
                       // fullfilename =filename;
                        System.out.println("fullfilename : " + fullfilename);
                        if (item.getFieldName().equalsIgnoreCase("txtImage")) {
                            String filename = item.getName();
                            if (!filename.equalsIgnoreCase("")) {
                                pname = filename.substring(filename.lastIndexOf("."), filename.length());
                                pname1 = imagePath + File.separator + fullfilename + pname;
                               // fullImagepath = fullfilename + pname;
                                fullImagepath=filename;
                                File file3 = new File(pname1);
                                try {
                                    item.write(file3);
                                    status = true;
                                } catch (Exception e1) {
                                    e1.printStackTrace();
                                    System.out.println(e1.toString());
                                    status = false;
                                }
                            }
                        }
                    }
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                status = false;
                System.out.println(ex.toString());
            }
        }
        String msg = null;
        if (status == true) {
            try {
                Connection con2 = dbConnection.makeCon();
                PreparedStatement pst = null;
                String sqlquery = "insert into product(ProductCategoryID,ProductName,ProductPrice,ProductThumb)values(?,?,?,?)";
                System.out.println(" sql query : " + sqlquery);
                pst = con2.prepareStatement(sqlquery);
                pst.setString(1, catid);
                pst.setString(2, productname);
                pst.setString(3, price);
                pst.setString(4, fullImagepath);
                i = pst.executeUpdate();
            } catch (Exception ex) {
               System.out.println(ex.toString());
            }
            if (i > 0) {
               
                msg = "Successfully Inserted Data";
                session = request.getSession(true);
                session.setAttribute("MSG", msg);
                response.sendRedirect("admin/manageproduct.jsp");

            } else {
                msg = "Not Inserted Data1";
                session = request.getSession(true);
                session.setAttribute("MSG", msg);
                response.sendRedirect("admin/manageproduct.jsp");
            }
        }
        if (status == false) {
            msg = "Not Inserted Data2";
            session = request.getSession(true);
            session.setAttribute("MSG", msg);
            response.sendRedirect("admin/manageproduct.jsp");
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
