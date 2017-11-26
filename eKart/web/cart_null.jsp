<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="shopBeans.CartBean"%>
<%@ page import="shopBeans.ConnDB"%>
<%

	String c_name=(String)session.getAttribute("c_name");
	String c_header=(String)session.getAttribute("c_header");
	if(c_name=="" || c_name==null)
	{
		out.println("<script language='javascript'>alert('Please login!');window.location.href='index_.jsp';</script>");
	}
	else
	{
		ConnDB conn=new ConnDB();
		Vector cart=(Vector)session.getAttribute("cart");
		if(cart==null || cart.size()==0)
		{
	%>
<html>
<head>
<title>Easy Buy Online</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE9 {
	font-size: 16px;
	color: #FF0000;
}
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
<table width="782"  border="1" bordercolor="#b984ea" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
        <tr>
          <td width="183" align="center" valign="top"><jsp:include page="login.jsp" flush="true"/></td>
          <td width="602" valign="top"><table width="100%"  border="0" bordercolor="#b984ea" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="14" colspan="5" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="2%" height="37" align="center">&nbsp;</td>
                        <td width="43%" height="34" align="center" bgcolor="#b984ea"><font size="3">My Cart</font></td>
                        <td width="53%" align="center" bgcolor="#b984ea">&nbsp;</td>
                        <td width="2%">&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="5">&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="5">
<form method="post" action="cart_modify.jsp" name="form1">
<table width="96%" height="56" border="1" bordercolor="#b984ea" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr align="center" valign="middle">
        <td width="33" height="27" class="tableBorder_B1"><font size="2">Serial number</font></td>
        <td width="114" height="27" class="tableBorder_B1"><font size="2">Product Number</font></td>
        <td width="219" class="tableBorder_B1"><font size="2">Product Name</font></td>
        <td width="62" height="27" class="tableBorder_B1"><font size="2">Unit price</font></td>
        <td width="42" height="27" class="tableBorder_B1"><font size="2">Quantity</font></td>
        <td width="68" height="27" class="tableBorder_B1"><font size="2">Amount</font></td>
        <td width="39" class="tableBorder_B1">&nbsp;</td>
      </tr> 
      <tr align="center" valign="middle">
        <td height="27" colspan="7">&nbsp;</td>
        </tr>
      </table>
	  </form>
<table width="100%" height="125" border="0" bordercolor="#b984ea" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr align="center" valign="middle">
		<td width="76%" height="52">		<span class="STYLE9">You do not have to purchase any goods!</span></td>
        <td width="24%" height="52" colspan="-3" align="left">&nbsp;</td>
		</tr>
      <tr align="center" valign="middle">
        <td height="21" class="tableBorder_B1">　</td>
        <td height="21" colspan="-3" align="left" class="tableBorder_B1"></td>
      </tr>
      <tr align="center" valign="middle">
        <td height="21" colspan="2"><input type="button" class="STYLE1" value=" Back Shopping " onClick="window.location.href='index_.jsp'"/></td>
        </tr>
</table>						</td>
                      </tr>
                      <tr>
                        <td colspan="5">&nbsp;</td>
                      </tr>
          </table>          </td>
        </tr>
      </table>
</td>
  </tr>
</table>
</td>
</tr>
</table>
</center>
<br>
<jsp:include page="copyright.jsp" flush="true"/>
</body>
</html>
<%conn.closeConnection();}
}%>