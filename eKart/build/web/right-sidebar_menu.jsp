<%@page import="java.sql.*"%>
<div class="widget-info">
    <div class="widget-title">Categories</div>
    <div class="line"></div>
    <div class="widget-content">
        <ul>

            <%
                Connection con = null;
                PreparedStatement pst = null;
                ResultSet rst = null;
                try {
                    con = shopBeans.ConnDB.getConnection();

                    String query = "SELECT * FROM productcategories  ";
                    pst = con.prepareStatement(query);
                    rst = pst.executeQuery();
                    while (rst.next()) {
            %>

            <li><a href="products.jsp?catid=<%=rst.getString("CategoryID")%>"><%=rst.getString("CategoryName")%></a></li>


            <%}
                    con.close();
                    rst.close();
                } catch (Exception ex) {
                    System.out.println(ex.toString());
                }
            %>   

        </ul>
    </div>
</div>
<div class="widget-info">
    <div class="widget-title">By Price</div>
    <div class="line"></div>
    <div class="widget-price">
        <ul>
            <%
               Connection con1 = null;
                PreparedStatement pst1 = null;
                ResultSet rst1 = null;
                try {
                    con1 = shopBeans.ConnDB.getConnection();

                     String query = "SELECT MIN(productprice) as minprice, MAX(productprice)as maxprice, productcategoryid FROM product GROUP BY productcategoryid ORDER BY productprice ASC";
                    pst1 = con1.prepareStatement(query);
                    rst1 = pst1.executeQuery();
                    while (rst1.next()) {
            %>

            <li>  <a href="products.jsp?catid=<%=rst1.getString("productcategoryid")%>"><%=rst1.getString("minprice")%> - Rs. <%=rst1.getString("maxprice")%></a></a></li>


            <%}
                    con1.close();
                    rst1.close();
                } catch (Exception ex) {
                    System.out.println(ex.toString());
                }
            %>   

        </ul>
    </div>
</div>
<div class="widget-info">
    <div class="widget-title">Manufacturer</div>
    <div class="line"></div>
    <div class="widget-content">
        <form>
             <%
         Connection        con2 = null;
              PreparedStatement    pst2 = null;
               ResultSet   rst2 = null;
                try {
                    con2 = shopBeans.ConnDB.getConnection();

                     String query = "SELECT distinct Manufacture FROM product order by Manufacture asc";
                    pst1 = con2.prepareStatement(query);
                    rst1 = pst2.executeQuery();
                    while (rst2.next()) {
            %>
 <div><input type="checkbox" name="vehicle" value="Bike"><div class="brand_name"><%=rst2.getString("Manufacture")%></div></div>
            
            <%}
                    con2.close();
                    rst2.close();
                } catch (Exception ex) {
                    System.out.println(ex.toString());
                }
            %>   
            
           
        </form>
    </div>
</div>
<div class="widget-info">
    <div class="widget-title">View History</div>
    <div class="line"></div>
    <div class="widget-content">
        <div class="history-product-image">	
            <a href="#"><img src="images/product-list/htstory.png" alt="" /></a>
        </div>
        <div id="feature-post-content">
            <div>
                <button class="shop-now">Shop Now</button> 
            </div>
        </div>
    </div>
</div>