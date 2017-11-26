<%@page import="java.sql.*"%>
<%@page import="dal.dbConnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>

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
                    <li><a href="index.jsp">Home</a></li><li>&#47;</li><li class="active"><a href="#">Category</a></li>
                </ul>
            </div>	
        </div>

        <div class="main_content">
            <div class="container main product_style">
                <h1 align="center"> Manage Category!</h1><br/>
                <h2 align="center" style="color:red;">
                    

                    <%=session.getAttribute("MSG")%>

                    <%
                            session.setAttribute("MSG", "");
                        
                    %>

                </h2>
                <center> 
                    <h5 align="center">Please enter the name of the category u want
                        to add. </h5>
                    <form action="ManageCategory_auth.jsp?opt=add" method="POST">
                        <table>
                            <tr>
                                <td>New Category Name :</td><td><input type="text" name="txtCategory" size="40" maxlength="100" /></td>
                            <br>

                            </tr>
                            <tr>
                                <td align="right" style="padding-right: 10px;">
                                    <input type="Submit" id="Save" Value="Save" /></td><td><input type="reset" id="reset" Value="Cancel" /></td>
                            </tr>
                        </table>

                        <table border="2">
                            <tr><td>Category ID</td>
                                <td>Category Name</td>
                                <td>Category Status</td>
                                <td>Action</td>
                                <td>Action</td>
                            </tr>
                            <%
                                try {
                                    Connection con = dbConnection.makeCon();

                                    Statement st = con.createStatement();
                                    ResultSet rs = st.executeQuery("SELECT * FROM productcategories");
                                    while (rs.next()) {
                            %>
                            <tr><td><%=rs.getString("CategoryID")%></td>
                                <td><%=rs.getString("CategoryName")%></td>
                                <td><%=rs.getString("statusopt")%></td>
                                <td><a href="ManageCategory_edit.jsp?id=<%=rs.getString("CategoryID")%>">Edit</a></td>
                                <td><a href="ManageCategory_auth.jsp?opt=del&id=<%=rs.getString("CategoryID")%>">Delete</a></td>
                            </tr>
                            <%
                                    }
                                } catch (Exception ex) {

                                }

                            %>
                        </table>

                        <br>
                    </form>


                </center>
            </div>
        </div>
    </body>

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
