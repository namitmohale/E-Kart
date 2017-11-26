
package imgUpload;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;


public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DATA_DIRECTORY = "imgdata";
//     ServletContext context = getServletContext();
//    String filePath = context.getInitParameter("file-upload");
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;
    String fullfilepath = null;
    HttpSession session = null;
    String fname=null;
    String fname1=null;
     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Check that we have a file upload request
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            return;
        }

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String uploadFolder = getServletContext().getRealPath("")
                + File.separator + DATA_DIRECTORY;

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            // Parse the request
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadFolder + File.separator + fileName;
                    File uploadedFile = new File(filePath);
                    System.out.println(filePath);
                    // saves the file to upload directory
                    item.write(uploadedFile);
                }
            }

            // displays done.jsp page after upload finished
            getServletContext().getRequestDispatcher("/done.jsp").forward(
                    request, response);

        } catch (FileUploadException ex) {
            throw new ServletException(ex);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }

        //==================================new coding

//        PrintWriter out = response.getWriter();
//        int i = 0;
//        response.setContentType("text/html");
//        ServletConfig config = getServletConfig();
//        String context = config.getServletContext().getRealPath("/");
//        context="C://";
//        String filePath = context + "UploadedImage";
//        boolean status = false;
//        String fullfilename = null;
//        java.util.Date d = new java.util.Date();
//        long timestamp = d.getTime();
//        try {
//            File projectDir = new File("filePath");
//            if (!projectDir.exists()) {
//                projectDir.mkdirs();
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        boolean isMultipart = ServletFileUpload.isMultipartContent(new ServletRequestContext(request));
//        if (isMultipart) {
//            FileItemFactory factory = new DiskFileItemFactory();
//            ServletFileUpload upload = new ServletFileUpload(factory);
//            try {
//                List/*FileItem*/ items = upload.parseRequest(request);
//                Iterator iter = items.iterator();
//                while (iter.hasNext()) {
//                    FileItem item = (FileItem) iter.next();
//
//
//                        fullfilename = "Product_Image" + "_" + timestamp;
//                        //System.out.println("fullfilename : " + fullfilename);
//                        if (item.getFieldName().equalsIgnoreCase("FileImage")) {
//                            String filename = item.getName();
//                            if (!filename.equalsIgnoreCase("")) {
//                                fname = filename.substring(filename.lastIndexOf("."), filename.length());
//                                fname1 = filePath + File.separator + fullfilename + fname;
//                                fullfilepath = fullfilename + fname;
//                                File file3 = new File(fname1);
//                                try {
//                                    item.write(file3);
//                                    status = true;
//                                } catch (Exception e1) {
//                                    e1.printStackTrace();
//                                    status = false;
//                                }
//                            }
//                        }
//                    }
//
//            } catch (Exception e) {
//                e.printStackTrace();
//                status = false;
//
//            }
//        }
 }

}