<%-- 
   
    Created on : Jan 6, 2017, 7:06:40 AM
    
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="ecommerce.business.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="initial-scale=1, maximum-scale=1" />
        <meta name="viewport" content="width=device-width" />
        <title>Men</title>

        <!-- Font CSS Link -->
        <link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
        <!-- Font CSS Link -->	

        <!-- Start CSS Link -->
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/responsive.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/main.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/custom_responsive.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/menu.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/supermenu.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/bounce_slider.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/jcarousel.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/jquery.bxslider.css" type="text/css" media="screen" />	
        <link rel="stylesheet" href="css/grid-list.css" type="text/css" />
        <link rel="stylesheet" href="css/accrodin.css" type="text/css"/>
        <link rel="stylesheet" href="css/ui.css" type="text/css"/>
        <link rel="stylesheet" href="css/jquery.jqzoom.css" type="text/css"/>
        <!-- End CSS Link -->

    </head>
    <body>

        <div class="header">
            <div class="container main">
                <div class="row">
                    <div class="header_top">
                       
                        <div class="account_login span7">
                            <jsp:include page="top_menu_account.jsp" flush="true"/>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="header_top">
                        <div class="span4">
                            <a href="index.jsp">
                                <div class="logo"></div>
                            </a>
                        </div>
                      
                       
                    </div>
                </div>

            </div>
        </div>

        <div class="navigation navbar">

            <div class="row">
                <div class="navbar">
                    <jsp:include page="menu_navbar.jsp" flush="true"/>
                </div>

            </div>

        </div>

        <div class="breadcrumbs">
            <div class="container main">
                <ul>
                    <li><a href="index.jsp">Home</a></li><li>&#47;</li><li class="active"><a href="#">Sub Category</a></li>
                </ul>
            </div>	
        </div>

        <div class="main_content">
            <div class="container main product_style">
              <h1 align="center"> Manage Sub Category!</h1>
              <center> 
<p align="center">Please enter the name of the sub-category u want
    to add. These categories will appear as menu items for the user pages
    and will automatically be added there.</p>
<table>
     <tr>
         <td>Select Category Name :</td><td><select name="subCat"><option name="1">Men</option><option name="2">Women</option></select></td>
    <br>
    
    </tr>
    <tr>
        <td>New SubCategory Name :</td><td><input type="text" name="NewSCatName" size="40" maxlength="100" /></td>
    <br>
    
    </tr>
    <tr>
        <td align="right" style="padding-right: 10px;"><input type="button" id="Save" Value="Save" /></td><td><input type="reset" id="reset" Value="Cancel" /></td>
    </tr>
</table>
<br>

    <style type="text/css">
        .style1
        {
            width: 79%;
            float: left;
            border-color: #666666;
            background-color: #FF9933;
        }
        .style2
        {
            width: 222px;
        }
        .style3
        {
            width: 204px;
        }
        .style4
        {
            width: 42px;
        }
    </style>
 

    <table align="left" class="style1">
        <tr>
            <td class="style4">
                ID</td>
            <td class="style3">
                Category Name</td>
            <td class="style2">
                Action
            </td>
        </tr>
        <tr>
            <td class="style4">
                1</td>
            <td class="style3">
                Men</td>
            <td class="style2">
                Edit&nbsp; | Delete</td>
        </tr>
    </table>
</center>
            </div>
        </div>
 		

        <div class="footer">
           <jsp:include page="footer.jsp" flush="true"/>
        </div>			
        <!-- Start JS Link -->
        <script src="js/js-engine.js"></script>
        <script type="text/javascript" src="js/menu/jquery.min.js"></script>
        <script type="text/javascript" src="js/menu/superfish.js"></script>
        <script type="text/javascript" src="js/bounceslider/modernizr.js"></script>
        <script type="text/javascript" src="js/bounceslider/jquery.bounceslider.js"></script>
        <script type="text/javascript" src="js/new-product-js/jquery.jcarousel.min.js"></script>
        <script type="text/javascript" src="js/new-product-js/responsiveslides.min.js"></script>
        <script type="text/javascript" src="js/bxslider/jquery.bxslider.min.js"></script>
        <script type="text/javascript" src="js/bxslider/jquery.bxslider.js"></script>
        <script type="text/javascript" src="js/jquery.mixitup.min.js"></script>
        <script type="text/javascript" src="js/mixitup/jquery-ui.sortable.min.js"></script>
        <script type="text/javascript" src="js/mixitup/jquery.ui.touch-punch.min.js"></script>
        <script type="text/javascript" src="js/mixitup/jquery.mixitup.min.js"></script>
        <script type="text/javascript" src="js/mixitup/mixitop-inline.js"></script>
        <script type="text/javascript" src="js/mixitup/ga.js"></script>
        <script type="text/javascript" src="js/mixitup/cloudflare.min.js"></script>
        <script type="text/javascript" src="js/contact_form/jquery.form.js"></script>
        <script type="text/javascript" src="js/contact_form/init_form.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <script type="text/javascript" src="js/zoom/jquery.jqzoom-core.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script type="text/javascript" src="js/custom.js"></script>
        <!-- End JS Link -->				

    </body>
</html>	
