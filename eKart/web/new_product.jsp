
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container main" id="first-carousel-slide">
    <div class="row list_work">
        <h2 class="title-wrap">
            <span>V Products</span>
        </h2>
        <div class="line"></div>
        <ul id="mycarousel" class="jcarousel-skin-tango item da-thumbs">
            <%
                Connection con = null;
                PreparedStatement pst = null;
                ResultSet rst = null;
               try {
                con = shopBeans.ConnDB.getConnection();

                String query = "SELECT * FROM product ORDER BY productid DESC";
                pst = con.prepareStatement(query);
                rst = pst.executeQuery();
                while (rst.next()) {
                   %>
            <li class="span3 new-product"> 
                <div class="new-product-image">

                    <a href="product_details.jsp?PID=<%=rst.getString("ProductID")  %>"><img src="images/<%=rst.getString("ProductThumb")%>" alt="" /></a>
                </div>	
                <div class="new-product-info">	
                    <div>
                        <div class="new-product-price">Rs <%=rst.getString("ProductPrice")  %></div>
                        <div class="new-product-bg">
                            <div class="newE-product-cart_like">
                                <div class="new-product-cart_like">
                                    <div class="new-product-cart"><a href="cart.jsp?PID=<%=rst.getString("ProductID")  %>"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
                                    <div class="new-product-like"><a href="wish_list.jsp?PID=<%=rst.getString("ProductID")  %>"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
                                </div>
                            </div>
                            <div class="new-product-details"><a href="product_details.jsp?PID=<%=rst.getString("ProductID")  %>">Details</a></div>
                        </div>			
                    </div>
                </div>
                <div class="new-product-content">
                    <div class="new-product-title">
                        <a href="product_details.jsp?PID=<%=rst.getString("ProductID")  %>"><p><%=rst.getString("ProductName")  %></p></a>
                    </div>
                    <div class="new-product-content">
                        <p><%=rst.getString("ProductCondition")  %></p>
                    </div>
                </div>
            </li>
            <%}
                con.close();
                rst.close();
                
                                                                }catch(Exception ex){System.out.println(ex.toString());}
%>
        </ul>
    </div>	


</div>	
