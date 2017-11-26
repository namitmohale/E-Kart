 
<%@ page  import="java.sql.*" %>
<%@ page import="java.util.Vector"%>
<%@ page import="shopBeans.CartBean"%>
<%@ page import="shopBeans.ConnDB"%>
<%
 try{
    String c_name = (String) session.getAttribute("email");
   // String c_header = (String) session.getAttribute("c_header");
    double m = Math.random();
    String order_number = String.valueOf(m).substring(2, 12);
    session.setAttribute("order_number", order_number);
   
        ConnDB conn = new ConnDB();
        CartBean cb = new CartBean();
        Vector cart = (Vector) session.getAttribute("cart");
        if (cart == null || cart.size() == 0) {
            response.sendRedirect("cart_null.jsp");
        } else {
%>
<html>
    <head>
        <title>Easy Buy Online</title>
      
        <link href="CSS/style.css" rel="stylesheet">
        <style type="text/css">
            <!--
            .STYLE1 {font-size: 12px}
            .STYLE2{
                font-size: 14px;
            }
            .STYLE9 {color: #FF0000}
            a:link {
                text-decoration: none;
            }
            a:visited {
                text-decoration: none;
            }
            a:hover {
                text-decoration: underline;
            }
            a:active {
                text-decoration: none;
            }
            -->
        </style>

    </head>
    <body>
        <jsp:include page="title.jsp" flush="true"/>
        <jsp:include page="menu.jsp" flush="true"/>
    <center>
        <table width="782" style="border:solid #b984ea  ; cellspacing:0; cellpadding:0;border-collapse:collapse">
            <!--DWLayoutTable-->
            <tr>
                <td width="183" align="center" valign="top"><jsp:include page="login.jsp" flush="true"/></td>
                <td width="602" valign="top">
                    <table width="100%" style="border:solid #b984ea  ; cellspacing:0; cellpadding:0;border-collapse:collapse">
                        <tr>
                            <td height="14" colspan="6" align="center">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="2%" height="37" align="center">&nbsp;</td>
                            <td width="18%" height="34" align="center" bgcolor="#b984ea" class="STYLE2"><img src="../images/logo/cart.JPG" width="55" height="35"></td>
                            <td width="25%" align="left" bgcolor="#b984ea" class="STYLE2">My Cart</td>
                            <td width="53%" align="center" bgcolor="#b984ea">&nbsp;</td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="6">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <form action="my_cart.jsp" method="post">
                                    <table style="border:solid #b984ea  ; height: 83px; width:96px;  cellspacing:0; cellpadding:0;border-collapse:collapse" align="center" >
                                        <tr align="center" valign="middle">
                                            <td height="27" class="STYLE1">Serial number</td>
                                            <td height="27" class="STYLE1">Product Number</td>
                                            <td class="STYLE1">Product Name</td>
                                            <td height="27" class="STYLE1">Unit price</td>
                                            <td height="27" class="STYLE1">Quantity</td>
                                            <td height="27" class="STYLE1">Amount</td>
                                            <td class="tableBorder_B1">&nbsp;</td>
                                        </tr>
                                        <%
                                            float sum = 0;
                                            String p_id = "";
                                            int quantity = 0;
                                            String goodsname = "";
                                            for (int i = 0; i < cart.size(); i++) {

                                                String sum1 = request.getParameter("num" + i);//Get the number of modified

                                                CartBean goodsitem = (CartBean) cb.updateCart(cart, i, sum1);
                                                sum = sum + goodsitem.p_number * goodsitem.p_price;
                                                p_id = goodsitem.p_id;
                                                ResultSet rs_goods = conn.doQuery("select * from Product where ProductID='" + p_id + "'");
                                                if (rs_goods.next()) {
                                                    goodsname = rs_goods.getString("productName");

                                                }
                                        %>
                                        <tr align="center" valign="middle">
                                            <td width="32" height="27"><font size="2"><%=i + 1%></font></td>
                                            <td width="108" height="27"><font size="2"><%=p_id%></font></td>
                                            <td width="201" height="27"><font size="2"><%=goodsname%></font></td>
                                            <td width="66" height="27"><font size="2">Rs. <%=goodsitem.p_price%></font></td>
                                            <td width="40" height="27"><input name="num<%=i%>" size="3" type="text" class="txt_grey" value="<%=goodsitem.p_number%>" onBlur="check(this.form)"/></td>
                                            <td width="65" height="27"><font size="2">Rs. <%=(goodsitem.p_price * goodsitem.p_number)%></font></td>
                                            <td width="41"><a href="cart_move.jsp?ID=<%=i%>" class="STYLE1">Delete</a></td>
                                        <script language="javascript">
                                            <!--
                                                            function check(myform) {
                                                if (isNaN(myform.num<%=i%>.value) || myform.num<%=i%>.value.indexOf('.', 0) != -1) {
                                                    alert("Please do not enter illegal characters");
                                                    myform.num<%=i%>.focus();
                                                    return;
                                                }
                                                if (myform.num<%=i%>.value == "") {
                                                    alert("Please enter the number of modifications");
                                                    myform.num<%=i%>.focus();
                                                    return;
                                                }
                                                myform.submit();
                                            }
-->
                                        </script>
                                        <%
                                            }

                                        %> </tr>
                                        <tr align="center" valign="middle">
                                            <td height="27" colspan="7">&nbsp;</td>
                                        </tr>
                                    </table>
                                    <table width="100%" height="83" border="0" bordercolor="#b984ea" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
                                        <tr align="center" valign="middle">
                                            <td height="10">&nbsp;</td>
                                            <td height="10" colspan="-3" align="left">&nbsp;</td>
                                        </tr>
                                        <tr align="center" valign="middle">
                                            <td width="74%" height="10"><font size="2">&nbsp;		</font>		</td>
                                            <td width="26%" height="10" colspan="-3" align="left"><span class="STYLE1">The total aggregate amount</span><font size="2"><font size="2">?</font></font><span class="STYLE9">Rs. <%=sum%></span></td>
                                        </tr>
                                        <tr align="center" valign="middle">
                                            <td height="21" class="tableBorder_B1">?</td>
                                            <td height="21" colspan="-3" align="left" class="tableBorder_B1"></td>
                                        </tr>
                                        <tr align="center" valign="middle">
                                            <td height="21" class="tableBorder_B1">&nbsp;</td>
                                            <td height="21" colspan="-3" align="left" class="tableBorder_B1"></td>
                                        </tr>
                                        <tr align="center" valign="middle">
                                            <td height="21" colspan="2"><input type="button" class="STYLE1" value="Continue shopping" onClick="window.location.href = 'index_.jsp'"/><font size="2"> &nbsp; <input type="button" class="STYLE1" value="Go to checkout" onClick="window.location.href = 'cart_checkout.jsp'"/> &nbsp; <input type="button" class="STYLE1" value="Empty Cart" onClick="window.location.href = 'cart_clear.jsp'"/></font></td>
                                        </tr>
                                    </table>
                                </form>						</td>
                        </tr>
                        <tr>
                            <td colspan="6">&nbsp;</td>
                        </tr>
                    </table>          </td>
            </tr>
        </table>

    </center>
    <br>
    <jsp:include page="copyright.jsp" flush="true"/>
</body>
</html>
<% 
        }
    }catch(Exception ex){}   %>