<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Vector"%>
<%@ page import="shopBeans.CartBean"%>
<%@ page import="shopBeans.ConnDB"%>
<html>
    <head>

        <title>Add to Cart</title>
    </head>
    <body>
        <%
            String userid =session.getAttribute("userid").toString();
            String p_id = "";
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rst = null;
            try {
               
                p_id = request.getParameter("PID");
                con = shopBeans.ConnDB.getConnection();
                String query = "SELECT * FROM cart where CartProductID=" + p_id + " AND cart.cartUserID=" + userid;
                pst = con.prepareStatement(query);
                rst = pst.executeQuery();
                if (rst.next()) {
                    pst = con.prepareStatement("update cart set qty=(qty+1) where  CartProductID=" + p_id + " AND cart.cartUserID=" + userid + "");
                    int i = (int) pst.executeUpdate();
                    response.sendRedirect("cart.jsp");
                } else {
                    pst = con.prepareStatement("insert into  cart(CartProductID,cartUserID) values(" + p_id + " ," + userid + ")");
                    int i = (int) pst.executeUpdate();
                    response.sendRedirect("cart.jsp");
                }
                con.close();
                rst.close();
            } catch (Exception ex) {
                System.out.println(ex.toString());
            }

        %>
