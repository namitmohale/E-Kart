<%@ page  import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="shopBeans.CartBean"%>
<%@ page import="shopBeans.ConnDB"%>
 <% 
           String userid=session.getAttribute("userid").toString();
            String p_id = request.getParameter("PID");
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rst = null;
            try {
                con = shopBeans.ConnDB.getConnection();
                String query = "delete  FROM cart where CartProductID="+p_id +" AND cart.cartUserID=" + userid;
                pst = con.prepareStatement(query);
                 pst.execute(query);
               
                    response.sendRedirect("cart.jsp");
                
                con.close();
                pst.close();
            } catch (Exception ex) {
                System.out.println(ex.toString());
            }

        %>
