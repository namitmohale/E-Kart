<%@ page  import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="shopBeans.CartBean"%>
<%@ page import="shopBeans.ConnDB"%>
<%

    String c_name = (String) session.getAttribute("c_name");
    String c_header = (String) session.getAttribute("c_header");

    if (c_name == "" || c_name == null) {
        out.println("<script language='javascript'>alert('Please login!');window.location.href='index.jsp';</script>");
    } else {
        ConnDB conn = new ConnDB();
        Vector cart = (Vector) session.getAttribute("cart");
        if (cart == null || cart.size() == 0) {
            response.sendRedirect("cart_null.jsp");
        } else {
%>
<html>
    <head>
        <title>  Online</title>

        <link href="CSS/style.css" rel="stylesheet">
        <style type="text/css">
            <!--
            .STYLE1 {font-size: 12px}
            .STYLE2{
                font-size: 14px;
            }
            .STYLE9 {color: #FF0000}
            .STYLE10 {color: #00FF00}
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
        <script language="javascript">
            <!--
                function check_pay(form)
            {
                if (form.pay_fangshi.value == "")
                {
                    alert(" Please select your payment method ");
                    form.pay_fangshi.focus();
                    return false;
                }
                if (form.pay_address.value == "")
                {
                    alert("Please enter your The address");
                    form.pay_address.focus();
                    return false;
                }
                if (form.pay_email.value == "")
                {
                    alert("Please enter your TheEamil");
                    form.pay_email.focus();
                    return false;
                }
                if (form.pay_email.value.indexOf("@") == -1 || (form.pay_email.value.indexOf(".") == -1))
                {
                    alert("Error TheEmail format, please fill in the correct The e-mail");
                    form.pay_email.focus();
                    return false;
                }
            }
-->
        </script>

    </head>
    <body>
        <jsp:include page="title.jsp" flush="true"/>
        <jsp:include page="menu.jsp" flush="true"/>
    <center>
        <table width="782px" style="border:solid #b984ea thin;border-collapse:collapse" cellspacing="0" cellpadding="0">
            <!--DWLayoutTable-->
            <tr>
                <td width="183" align="center" valign="top"><jsp:include page="login.jsp" flush="true"/></td>
                <td width="602" valign="top">
                    <table width="100%"  style="border:solid #b984ea thin;border-collapse:collapse" cellspacing="0" cellpadding="0">
                        <!--DWLayoutTable-->
                        <tr>
                            <td height="14" colspan="5" align="center">&nbsp;</td>
                        </tr>
                        <tr>
                            <td width="2%" height="37" align="center">&nbsp;</td>
                            <td width="18%" height="34" align="center" bgcolor="#b984ea" class="STYLE2"><img src="../images/logo/list.JPG" width="55" height="35"></td>
                            <td width="25%" align="left" bgcolor="#b984ea" class="STYLE2"> Goods Listing</td>
                            <td width="53%" align="center" bgcolor="#b984ea">&nbsp;</td>
                            <td width="2%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="5">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <table  style="border:solid #b984ea thin; width:96%; height:83px; border-collapse:collapse" align="center" cellpadding="0" cellspacing="0" >
                                    <tr align="center" valign="middle">
                                        <td height="27" class="STYLE1">Code No. </td>
                                        <td height="27" class="STYLE1"> Goods Code No. </td>
                                        <td class="STYLE1"> Goods  Name </td>
                                        <td height="27" class="STYLE1">Unit price</td>
                                        <td height="27" class="STYLE1"> Quantity </td>
                                        <td width="85" height="27" class="STYLE1">Amount</td>
                                    </tr> 
                                    <%
                                        float sum = 0;
                                        String p_id = "";
                                        String goodsname = "";
                                        for (int i = 0; i < cart.size(); i++) {
                                            CartBean goodsitem = (CartBean) cart.elementAt(i);
                                            sum = sum + goodsitem.p_number * goodsitem.p_price;
                                            p_id = goodsitem.p_id;
                                            ResultSet rs_goods = conn.doQuery("select * from Product where ProductID='" + p_id + "'");
                                            if (rs_goods.next()) {
                                                goodsname = rs_goods.getString("ProductName");

                                            }
                                    %> 
                                    <tr align="center" valign="middle"> 
                                        <td width="33" height="27"><font size="2"><%=i + 1%></font></td>
                                        <td width="114" height="27"><font size="2"><%=p_id%></font></td> 
                                        <td width="207" height="27"><font size="2"><%=goodsname%></font></td>
                                        <td width="68" height="27"><font size="2">Rs. <%=goodsitem.p_price%></font></td> 
                                        <td width="48" height="27" class="STYLE1"><%=goodsitem.p_number%></td> 
                                        <td height="27"><font size="2">Rs. <%=(goodsitem.p_price * goodsitem.p_number)%></font></td> 
                                            <%
                                                }
                                                session.setAttribute("sum", String.valueOf(sum));
                                            %>

                                    </tr>
                                    <tr align="center" valign="middle">
                                        <td height="27" colspan="6">&nbsp;</td>
                                    </tr>
                                </table></td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <table width="100%" height="58" border="0" bordercolor="#b984ea" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
                                    <tr align="center" valign="middle">
                                        <td height="23">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td height="23" colspan="-3" align="left">&nbsp;</td>
                                    </tr>
                                    <tr align="center" valign="middle">
                                        <td width="48%" height="10"><a href="index_.jsp"><font size="2">Returns Continue Shopping</font></a></td>
                                        <td width="26%">&nbsp;</td>
                                        <td width="26%" height="10" colspan="-3" align="left"><span class="STYLE1">Total amount</span><font size="2"><font size="2">?</font></font><span class="STYLE9">Rs. <%=sum%></span></td>
                                    </tr>
                                    <tr align="center" valign="middle">
                                        <td height="10">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td height="10" colspan="-3" align="left">&nbsp;</td>
                                    </tr>
                                    <tr align="center" valign="middle">        </tr>
                                </table></td>
                        </tr>
                        <tr>
                            <td height="57" colspan="5" align="center" valign="top">
                                <form action="payment.jsp" method="post" onSubmit="return check_pay(this);">
                                    <table width="96%" border="1" bordercolor="#b468ff" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
                                        <!--DWLayoutTable-->
                                        <tr>
                                            <td width="1%" height="30" bgcolor="#b984ea"><!--DWLayoutEmptyCell-->&nbsp;</td>
                                            <td width="16%" align="center" bgcolor="#b984ea"><img src="../images/logo/payment.JPG" width="55" height="34"></td>
                                            <td width="12%" align="center" bgcolor="#b984ea" class="STYLE2">Payment method</td>
                                            <td width="42%" bgcolor="#b984ea"><!--DWLayoutEmptyCell-->&nbsp;</td>
                                            <td width="29%" bgcolor="#b984ea"><!--DWLayoutEmptyCell-->&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td height="20" colspan="5"><!--DWLayoutEmptyCell-->&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td height="30" colspan="3" align="right"><span class="STYLE1 STYLE9"> Please select The payment method you</span><span class="STYLE9">?</span>&nbsp;</td>
                                            <%
                                                String pay_sql = "select pay_payment from payment";
                                                ResultSet payrs = conn.doQuery(pay_sql);
                                            %>
                                            <td height="30" colspan="2"><select name="pay_fangshi">
                                                    <option value="">- Please select Payment method-</option>
                                                    <%
                                                        while (payrs.next()) {
                                                    %>
                                                    <option value="<%= payrs.getString("pay_payment")%>"><%= payrs.getString("pay_payment")%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select> </td>
                                        </tr>
                                        <tr>
                                            <td height="30" colspan="3" align="right"><span class=" STYLE1 STYLE9">Please enter your The address</span><span class="STYLE9">?</span>&nbsp;</td>
                                            <td height="30" colspan="2"><input type="text" name="pay_address" size="40"/></td>
                                        </tr>
                                        <tr>
                                            <td height="30" colspan="3" align="right"><span class="STYLE1 STYLE9">Please enter your The E_mail</span><span class="STYLE9">?</span>&nbsp;</td>
                                            <td height="30" colspan="2"><input type="text" name="pay_email" size="26"/></td>
                                        </tr>
                                        <tr>
                                            <td height="30" colspan="5"><!--DWLayoutEmptyCell-->&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td height="30" colspan="5" align="center"><input type="submit" class="STYLE1" value="Determinable payments"/>&nbsp;&nbsp;
                                                <input name="button" type="button" class="STYLE1" value="Cancellation Payment" onClick="history.go(-1);"/></td>
                                        </tr>
                                    </table>
                                </form>                        </td>
                        </tr>
                        <tr>
                            <td height="30" colspan="5" align="center" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
                        </tr>
                    </table>          </td>
            </tr>
        </table>

    </center>
    <br>
    <jsp:include page="copyright.jsp" flush="true"/>
</body>
</html>
<%conn.closeConnection();
        }
    }%>