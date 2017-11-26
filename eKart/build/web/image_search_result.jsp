<%@page import="util.GraphicsUtilities"%>
<%@page import="search.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="org.apache.commons.io.FilenameUtils" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <link rel="stylesheet" type="text/css" href="css/font/font.css" />
        <title>Image to image Search</title>
        <script type="text/javascript" >
            function  checkInputSearch() {

                if (test.getSelectedFile() == null) {

                    return;
                }

                var a = Double.parseDouble(alphaText.getText());
                var b = Double.parseDouble(betaText.getText());
                if (a > 1 || a < 0 || b > 1 || b < 0) {
                    document.getElementById("txtalpha").focus();
                    document.getElementById("txtalpha").style.borderColor="red";
                    return fase;
                }

            }
            // searchButton.setEnabled(true);

            function checkThis(str){
                if (test.getSelectedFile() == null) {

                    return;
                }


                var num = new Number(str);
                if(/^[0-9]{0,3}(\.[0-9]{0,2})?$/.test(str) && num > 0){
                    var a = Double.parseDouble(alphaText.getText());
                    var b = Double.parseDouble(betaText.getText());
                    if (a > 1 || a < 0 || b > 1 || b < 0) {
                        document.getElementById("txtalpha").focus();
                        document.getElementById("txtalpha").style.borderColor="red";
                        return fase;
                    }

                    document.getElementById("txtalpha").style.borderColor="green";
                } else {

                    document.getElementById("txtalpha").focus();
                    document.getElementById("txtalpha").style.borderColor="red";
                }
            }
            function checkThis2(str){
                var num = new Number(str);
                if(/^[0-9]{0,3}(\.[0-9]{0,2})?$/.test(str) && num > 0){
                    document.getElementById("txtbeta").style.borderColor="green";
                } else {

                    document.getElementById("txtbeta").focus();
                    document.getElementById("txtbeta").style.borderColor="red";
                }
            }
        </script>
        <style type="text/css">
            #search
            {
                height: 50px;
                width: 579px;
            }
            #txtalpha
            {
                width: 44px;
                height: 17px;
            }
            #txtbeta
            {
                width: 44px;
                height: 15px;
            }
            #Checkbox1
            {
                width: 30px;
                height: 18px;
            }
            #btnSearch
            {
                width: 101px;
            }
            #txtsearch
            {

                width: 50px;
                cursor: url;
            }

            #file-image {
                position: relative;
                width: 40px;
                height: 40px;
                overflow: hidden;
            }


            #file-image input {
                height: 100%;
                position: absolute;
                top: 0;
                right: 0;
                -moz-opacity: 0;
                cursor: pointer;
                opacity:0;
            }

        </style>
    </head>
    <body>
        <form class="form-wrapper-01" action="image_search.jsp" method="POST" enctype="multipart/form-data">
            <table border="0"><tr><td> <input type="text" id="search" name="txtsearch" /> <span  id="file-image">
                            <input id=test name="test" type="file" onchange="document.getElementById('search').value=this.value;">
                            <img id="info" name="info" src="img/camera-icon.png" onclick="this.form.test.click()"  />

                        </span><td><input type="submit" value="Search" id="submit"><td></tr>
            </table>
            <table  style="margin-top: 0px;margin-bottom: 5px; line-height: normal; font-style: normal; font-variant: normal; font-weight: normal; font-size: 12px; font-family: arial, sans-serif; width: 360px;"><tr><td>filtering:<input type="text"  value="0.1"  name="txtalpha" id="txtalpha" size="44px"  onblur="checkThis(this.value);"/></td>
                    <td>Treshold: <input type="text" name="txtbeta" value="0.1" id="txtbeta" size="44px"  onblur="checkThis2(this.value);"/></td>
                    <td> K-Means<input name="Checkbox1" id="Checkbox1" type="checkbox"  value="K-Means" />  </td>
                </tr>
            </table>




        </form>
        <%
                    File file = null;
                    int maxFileSize = 5000 * 1024;
                    int maxMemSize = 5000 * 1024;
                    ServletContext context = pageContext.getServletContext();
                    String filePath = context.getInitParameter("file-upload");


                    // Verify the content type
                    String contentType = request.getContentType();
                    if (contentType != null && (contentType.indexOf("multipart/form-data") >= 0)) {

                        DiskFileItemFactory factory = new DiskFileItemFactory();
                        // maximum size that will be stored in memory
                        factory.setSizeThreshold(maxMemSize);
                        // Location to save data that is larger than maxMemSize.
                        //factory.setRepository(new File("c:\\temp"));

                        // Create a new file upload handler
                        ServletFileUpload upload = new ServletFileUpload(factory);
                        // maximum file size to be uploaded.
                        upload.setSizeMax(maxFileSize);
                        try {
                            // Parse the request to get file items.
                            List fileItems = upload.parseRequest(request);

                            // Process the uploaded file items
                            Iterator<FileItem> itr = fileItems.iterator();
                            String fileName = null;
                            double alpha = 0.0;
                            double beta = 0.0;
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
                                    contentType = fi.getContentType();
                                    boolean isInMemory = fi.isInMemory();
                                    long sizeInBytes = fi.getSize();
                                    // Write the file
                                    if (fileName.lastIndexOf("\\") >= 0) {
                                        file = new File(
                                                filePath + File.separator
                                                + fileName.substring(fileName.lastIndexOf("\\")));
                                    } else {
                                        file = new File(
                                                filePath
                                                + "\\"
                                                + fileName.substring(fileName.lastIndexOf("\\") + 1));
                                    }
                                    fi.write(file);
                                   // fi.write(new File(context.getContextPath() + File.separator + "myimg" + File.separator + file.getName()));


                                }
                            }

        %>
        <div>uploaded file: <%=fileName%>

        </div>
        <%
                  BufferedImage bi = null;
                  bi = ImageIO.read(file);
                  ImageSearcher s = new ImageSearcher();
                  if (bi.getHeight(null) != Constants.IMAGE_HEIGHT
                          || bi.getWidth(null) != Constants.IMAGE_WIDTH) {
                      bi = GraphicsUtilities.resizeImage(bi, Constants.IMAGE_WIDTH,
                              Constants.IMAGE_HEIGHT);
                  }
                  List<ImageResult> models = s.search(bi, alpha, beta, true);
                  // rakesh tech
                  for (ImageResult ir : models) {
                      file=new File(ir.getPath().toString());
                   // String id=  FilenameUtils.removeExtension(file.getName());
        %>
        <a href="product_details.jsp?PID=<%=  FilenameUtils.removeExtension(file.getName())%>" >
            <img border=2 src="imgData/<%= file.getName()%>" width=137 height=140>  </a>
            <%                                                          }
         } catch (Exception ex) {
                                System.out.println(ex);
                            }
                        }
            %>
    </body>
</html>
