 
<%@page import="ecommerce.database.UserIO"%>
<%@page import="ecommerce.business.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="ecommerce.business.UserTempInfo"%>
<%response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
//response.setDateHeader ("Expires", -1);
    response.setHeader("Cache-Control", "no-store");%>
<script src="scw.js" type="text/javascript"></script>
<% String msg = "";
    try {
        msg = (String) session.getAttribute("MSG");
    } catch (Exception ex) {
    }
%>

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

                        <ul class="account_info">
                            <%
                                User user;
                                Map<String, List<String>> errorMap;
                                List<String> errorList;
                                if (session.getAttribute("user") != null) {
                                    user = (User) session.getAttribute("user");
                            %>
                            <li><a href="userprofile.jsp"><img alt="" src="images/my_account.png"> Hi <%=user.getFirstName()%> <%=user.getLastName()%></a></li>
                            <li><a href="wish_list.jsp"><img alt="" src="images/mywish_list.png"> MY WISHLIST</a></li>
                            <li><a href="cart.jsp"><img alt="" src="images/shopping_cart.png"> MY CART</a></li>
                            <li><a href="checkout.jsp"><img alt="" src="images/checkout.png"> MY CHECKOUT</a></li>
                            <li><a href="logout">
                                    <img alt="" src="images/login.png"> SIGN OUT</a></li>
                                    <%
                                    } else {
                                    %>
                            <li><a href="NotSignedIn"><img alt="" src="images/my_account.png"> MY ACCOUNT</a></li>
                            <li><a href="NotSignedIn"><img alt="" src="images/mywish_list.png"> MY WISHLIST</a></li>
                            <li><a href="NotSignedIn"><img alt="" src="images/shopping_cart.png"> MY CART</a></li>
                            <li><a href="NotSignedIn"><img alt="" src="images/checkout.png"> MY CHECKOUT</a></li>
                            <li><a href="log_in.jsp"><img alt="" src="images/login.png"> SIGN IN</a></li>
                                    <%
                                        }
                                    %>
                        </ul>

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
                    <div class="call_info span4">
                        <p>PHONE: <span class="color">22222345</span></p>
                        <p>Call us Monday - Saturday: 9:00 am - 6:00 pm</p>
                    </div>
                    <div class="cart_info span3">
                        <div class="cart_data">Shopping Cart - Rs 0.00</div>
                        <button class="cart_btn btn btn-navbar" data-toggle="collapse" data-target=".item_cart_wrap"><img alt="" src="images/shopping_cart_btn_img.png"></button>
                        <div class="item_cart_content">
                            <div class="item_cart_wrap collapse">
                                <div class="item_cart">
                                    <p class="item_cart_products">No Products</p>
                                    <p class="item_cart_info">Shipping - Rs 0.00</p>
                                    <p class="item_cart_info">Total - Rs 0.00</p>
                                    <button class="checkout">Checkout</button>
                                    <button class="cart">Cart</button>
                                </div>
                            </div>
                        </div>
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


    <div class="main_content">
        <div class="container main">
            <div class="row">
                <div class="span9 log_in_content comment_area">
                    <br/>
                    <h2 class="title-wrap">
                        My Profile Form
                    </h2>
                    <div class="line"></div>
                    <div  id="registrationform"> 
                        <%
                            if (msg != null) {
                        %>
                        <span style="font-family: verdana; color: red; font-size: 10px;" ><%=msg%></span>

                        <%
                                session.removeAttribute("MSG");
                            } else {
                                session.setAttribute("MSG", "");
                            }
                        %>
                        <%
                            if (request.getParameter("id") == null || request.getParameter("id") == "") {
                                return;
                            }

                            Connection con = null;
                            PreparedStatement pst = null;
                            ResultSet rst = null;
                            try {
                                con = UserIO.getConnection_();

                                String query = "select * from users where userid =" + request.getParameter("id");
                                pst = con.prepareStatement(query);
                                rst = pst.executeQuery();
                                while (rst.next()) {


                        %>
                        <form method="post" action="userlist.jsp">
                            <table class="table">
                                <tr>
                                    <td style="vertical-align: top"><label><small>First Name<strong>*</strong></small></label></td>
                                    <td><input type="text" name="firstName" value="<%=rst.getString("UserFirstName")%>" tabindex="1"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top"><label><small>Last Name<strong>*</strong></small></label></td>
                                    <td><input type="text" name="lastName" value="<%=rst.getString("UserLastName")%>" tabindex="2"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top"><label><small>Email Address<strong>*</strong></small></label></td>
                                    <td><input type="text" name="email" value="<%=rst.getString("UserEmail")%>" tabindex="3"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;"><label><small>Email Confirmation<strong>*</strong></small></label></td>
                                    <td><input type="text" name="emailConfirmation" value="<%=rst.getString("UserEmail")%>" tabindex="4"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top"><label><small>Password<strong>*</strong></small></label></td>
                                    <td><input type="password" style="margin-left: 0px" name="password" tabindex="5"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top"><label><small>Password Confirmation<strong>*</strong></small></label></td>
                                    <td><input type="password" style="margin-left: 0px" name="passwordConfirmation" tabindex="6"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top"><label><small>Birth Date<strong>*</strong></small></label></td>
                                    <td>
                                        <input type= text size="25" name="txtdb"  id="txtdb" readonly onclick="scwShow(this, event)" value="<%=rst.getString("UserBirthDate")%>">

                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top"><label><small>Phone<strong>*</strong></small></label></td>
                                    <td><input type="text" name="phone" value="<%=rst.getString("UserPhone")%>" tabindex="10"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top"><label><small>Address Line 1<strong>*</strong></small></label></td>
                                    <td><input type="text" name="address1" value="<%=rst.getString("UserAddress")%>" tabindex="11"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top"><label><small>Address Line 2</small></label></td>
                                    <td><input type="text" name="address2" value="<%=rst.getString("UserAddress2")%>" tabindex="12"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top"><label><small>City<strong>*</strong></small></label></td>
                                    <td><input type="text" name="city" value="<%=rst.getString("usercity")%>" tabindex="13"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top"><label><small>Postal Code<strong>*</strong></small></label></td>
                                    <td><input type="text" name="zip" value="<%=rst.getString("UserZip")%>" tabindex="14"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top"><label><small>Country<strong>*</strong></small></label></td>
                                    <td><input type="text" name="country" value="<%=rst.getString("UserCountry")%>" tabindex="15"></td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top"><label><small>Gender<strong>*</strong></small></label></td>
                                    <td>
                                        <select name="gender" tabindex="16">
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="<%=rst.getString("UserGender")%>" selected><%=rst.getString("UserGender")%></option>
                                        </select>   
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" value="Back" class="register"  tabindex="17"></td>
                                </tr>
                            </table>
                        </form>
                        <% }
                            } catch (Exception ex) {
                            }

                        %>
                    </div>
                </div>  
            </div>
        </div>
    </div>

    <div class="contact_info">
        <div class="container main">
            <ul class="row">
                <li class="follow-us span4">
                    <div class="follow-social">Follow us on:</div>
                    <div class="social-icon">
                        <ul>
                            <li class="fb">
                                <a href="#"><img alt="" src="images/social/facebook.png"></a>
                            </li>
                            <li class="tw">
                                <a href="#"><img alt="" src="images/social/twitter.png"></a>
                            </li>
                            <li class="rss">
                                <a href="#"><img alt="" src="images/social/rss.png"></a>
                            </li>
                            <li class="yt">
                                <a href="#"><img alt="" src="images/social/youtube.png"></a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="span4">
                    <div class="free-shipping">
                        <div class="free-shipping-wrap">
                            <div class="free-shipping-image">
                                <img alt="" src="images/social/shiping-truck.png">
                            </div>
                            <div class="free-shipping-info">
                                <div id="free-shipping-info-title">
                                    Free Shipping
                                </div>
                                <div id="free-shipping-info">
                                    On Orders  Over Rs  499
                                </div>
                            </div>
                        </div>	
                    </div>	
                </li>
                <li class="contact-no span4">
                    <div class="contact-no-wrap">
                        <div class="contact-no-image">
                            <img alt="" src="images/social/telephone.png">
                        </div>
                        <div class="contact-no-info">
                            <div id="contact-no-info-title">
                                Order Online
                            </div>
                            <br/>
                            <div id="contact-no-info">
                                <p>Phone:</p>
                                <p id="nb">22222345</p>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>	
        </div>

    </div>		

    <div class="footer">
        <jsp:include page="footer.jsp.jsp" flush="true"/>
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
