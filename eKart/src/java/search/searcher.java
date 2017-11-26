package search;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import util.GraphicsUtilities;

public class searcher extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet searcher</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searcher at " + request.getContextPath()
                    + "</h1>");
            out.println("</body>");
            out.println("</html>");

        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out1 = response.getWriter();

        try {
            /*****************************************/
            int maxFileSize = 50 * 1024;
            int maxMemSize = 4 * 1024;
            File file = null;
            String filePath = getServletContext().getInitParameter(
                    "file-upload");
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // maximum size that will be stored in memory
            factory.setSizeThreshold(maxMemSize);
            // Location to save data that is larger than maxMemSize.
            factory.setRepository(new File("c:\\temp"));

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            // maximum file size to be uploaded.
            upload.setSizeMax(maxFileSize);

            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator<FileItem> itr = fileItems.iterator();
            String fileName = null;
            double alpha = 0.3;
            double beta = 0.3;
            while (itr.hasNext()) {
                FileItem fi = (FileItem) itr.next();
                if (fi != null && fi.getFieldName() != null
                        && fi.getFieldName().equalsIgnoreCase("txtalpha")) {
                    try {
                        alpha = Double.parseDouble(fi.getString());
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (fi != null && fi.getFieldName() != null
                        && fi.getFieldName().equalsIgnoreCase("txtbeta")) {
                    try {
                        beta = Double.parseDouble(fi.getString());
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (!fi.isFormField()) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    fileName = fi.getName();
                    String contentType = fi.getContentType();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(
                                filePath
                                + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(
                                filePath
                                + "\\"
                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fi.write(file);
                    // out1.println("Uploaded Filename: " + fileName + "<br>");
                }
            }

            //out1.println("<b>File Name</b>" + fileName);
            //out1.println("<br/><b>Alpha--</b>" + alpha);
            //out1.println("<br/><b>Beta--</b>" + beta);
            /*****************************************/
            // File f = new File(request.getRealPath("/") + "imgData\\");
            // String pathToWeb =
            // getServletContext().getRealPath(File.separator);
            // File f2 = new File("c:\\uploads\\" + "5.jpg");
            BufferedImage bi = null;
            bi = ImageIO.read(file);

            // double alpha =
            // Double.parseDouble(request.getParameter("txtalpha")==null?"0.5":request.getParameter("txtalpha"));
            // double beta =
            // Double.parseDouble(request.getParameter("txtbeta")==null?"0.6":request.getParameter("txtbeta"));
            ImageSearcher s = new ImageSearcher();
            if (bi.getHeight(null) != Constants.IMAGE_HEIGHT
                    || bi.getWidth(null) != Constants.IMAGE_WIDTH) {
                bi = GraphicsUtilities.resizeImage(bi, Constants.IMAGE_WIDTH,
                        Constants.IMAGE_HEIGHT);
            }
            // List<ImageResult> models =null;
            // models=  s.search(bi, 0.3, 0.3, true);
            List<ImageResult> models = s.search(bi, alpha, beta, true);


            // File flist = null;
            // File[] list=null;
            // list = f.listFiles();

            out1.println("<html>");
            out1.print("<body>");
            out1.print("<table  width=\"250px\"><tr>");
            // rakesh tech
            for (ImageResult ir : models) {

                file = new File(ir.getPath());


                out1.write("<td> <a href=\"done.jsp?PID=" + file.getName()
                        + "\" ><img border=2 src="
                        + "imgData/" + file.getName()
                        + " width=137 height=140>  </a>  </td>");


            }
            out1.print("</tr>");
            out1.print("</table>");
            out1.print("</body>");
            out1.print("</html>");

        } catch (Exception ex) {
            out1.print(ex.toString());
            ex.printStackTrace();
        } finally {
            out1.close();
        }

    }
    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out1 = response.getWriter();
        try {
            /*****************************************/
            int maxFileSize = 50 * 1024;
            int maxMemSize = 4 * 1024;
            File file = null;
            String filePath = getServletContext().getInitParameter(
                    "file-upload");
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // maximum size that will be stored in memory
            factory.setSizeThreshold(maxMemSize);
            // Location to save data that is larger than maxMemSize.
            factory.setRepository(new File("c:\\temp"));
            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);
            // maximum file size to be uploaded.
            upload.setSizeMax(maxFileSize);
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);
            // Process the uploaded file items
            Iterator<FileItem> itr = fileItems.iterator();
            String fileName = null;
            double alpha = 0.3;
            double beta = 0.3;
            while (itr.hasNext()) {
                FileItem fi = (FileItem) itr.next();
                if (fi != null && fi.getFieldName() != null
                        && fi.getFieldName().equalsIgnoreCase("txtalpha")) {
                    try {
                        alpha = Double.parseDouble(fi.getString());
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (fi != null && fi.getFieldName() != null
                        && fi.getFieldName().equalsIgnoreCase("txtbeta")) {
                    try {
                        beta = Double.parseDouble(fi.getString());
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (!fi.isFormField()) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    fileName = fi.getName();
                    String contentType = fi.getContentType();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    // Write the file
                    if (fileName.lastIndexOf("\\") >= 0) {
                        file = new File(
                                filePath
                                + fileName.substring(fileName.lastIndexOf("\\")));
                    } else {
                        file = new File(
                                filePath
                                + "\\"
                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                    }
                    fi.write(file);
                    // out1.println("Uploaded Filename: " + fileName + "<br>");
                }
            }
            BufferedImage bi = null;
            bi = ImageIO.read(file);
            ImageSearcher s = new ImageSearcher();
            if (bi.getHeight(null) != Constants.IMAGE_HEIGHT
                    || bi.getWidth(null) != Constants.IMAGE_WIDTH) {
                bi = GraphicsUtilities.resizeImage(bi, Constants.IMAGE_WIDTH,
                        Constants.IMAGE_HEIGHT);
            }
           List<ImageResult> models = s.search(bi, alpha, beta, true);
            out1.println("<html>");
            out1.print("<body>");
            out1.print("<table  width=\"250px\"><tr>");
            for (ImageResult ir : models) {
                file = new File(ir.getPath());
                out1.write("<td> <a href=\"done.jsp?PID=" + file.getName()
                        + "\" ><img border=2 src="
                        + "imgData/" + file.getName()
                        + " width=137 height=140>  </a>  </td>");
            }
            out1.print("</tr>");
            out1.print("</table>");
            out1.print("</body>");
            out1.print("</html>");

        } catch (Exception ex) {
            out1.print(ex.toString());
            ex.printStackTrace();
        } finally {
            out1.close();
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
