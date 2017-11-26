<%@page import="dal.dbConnection"%>
<%@page import="java.sql.*,java.io.*"%>
<%@page pageEncoding="UTF-8"%>

<%
    String categoryname = request.getParameter("txtCategory");
     session.setAttribute("MSG","");
     if("".equalsIgnoreCase(categoryname))
     {
          session.setAttribute("MSG","Blank Not Allowed");
           response.sendRedirect("ManageCategory.jsp");
           return;
     }
    String flag = request.getParameter("opt");
    if ("add".equalsIgnoreCase(flag)) {
        try {

            Connection con = dbConnection.makeCon();
            PreparedStatement stmt = con.prepareStatement("insert into productcategories(categoryname) values (?)");
            stmt.setString(1, categoryname);
            stmt.executeUpdate();
            session.setAttribute("MSG", "Data Submited Successfully");
            out.println("Data Submited Successfully!");
            response.sendRedirect("ManageCategory.jsp");
        } catch (Exception ex) {
            out.println(ex);
        }
    } else if ("edit".equalsIgnoreCase(flag)) {
        String id = request.getParameter("txtCategoryID");

        Connection con = dbConnection.makeCon();
        PreparedStatement stmt = con.prepareStatement("update productcategories set categoryname=? where categoryid=?");
        stmt.setString(1, categoryname);
        stmt.setString(2, id);
        stmt.executeUpdate();
        session.setAttribute("MSG", "Data Updated Successfully");
        out.println("Data Updated Successfully!");
        response.sendRedirect("ManageCategory.jsp");

    } else if ("del".equalsIgnoreCase(flag)) {
        String id = request.getParameter("id");
        Connection con = dbConnection.makeCon();
        PreparedStatement stmt = con.prepareStatement("Delete from productcategories where categoryid=?");
        stmt.setString(1, id);
        stmt.executeUpdate();
        session.setAttribute("MSG", "Data Deleted Successfully");
        out.println("Data deleted Successfully!");
        response.sendRedirect("ManageCategory.jsp");
    } else {
        response.sendRedirect("ManageCategory.jsp");
    }
%>


