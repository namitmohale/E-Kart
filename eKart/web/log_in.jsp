 
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="ecommerce.business.User"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%response.setHeader("Cache-Control","no-cache");
response.setHeader("Pragma","no-cache");
//response.setDateHeader ("Expires", -1);
response.setHeader("Cache-Control","no-store");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="initial-scale=1, maximum-scale=1" />
        <meta name="viewport" content="width=device-width" />
        <title>Dress</title>

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
        <%
            if (session.getAttribute("user") != null) {
                response.sendRedirect("index.jsp");
            }
        %>
        <% String msg="";
           try{
             msg = (String) session.getAttribute("MSG");
          }catch(Exception ex){}
%>
        <div class="header">
            <div class="container main">
                <div class="row">
                    <div class="header_top">
                        <div class="currency_translator span5">	
                            <jsp:include page="currency_div.jsp" flush="true"/>				
                        </div>
                        <div class="account_login span7">

                            <ul class="account_info">
                                <%
                                    User user;
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

           <jsp:include page="menu_navbar.jsp" flush="true"/>

        </div>

        <div class="breadcrumbs">
            <div class="container main">
                <ul>
                    <li><a href="#">Home</a></li><li>&#47;</li><li class="active"><a href="#">Log In</a></li>
                </ul>
            </div>	
        </div>	

        <div class="main_content">
            <div class="container main">
                <div class="row">
                    <div class="span9 checkout_area">
                        <h2 class="title-wrap">
                            Checkout Informaiton
                        </h2>
                        <div class="line"></div>
                        <div id="log_in_info">
                            <h3>Step 1: <span>Checkout Information</span></h3>
                            <div class="row">
                                <div class="checkout_info log_in_content span9">
                                    <div class="span4 new_customer">
                                        <h2>New Customer</h2>
                                        <div class="customer_select">
                                            <p>Click Register button for creating <b>NEW ACCOUNT</b></p>
                                            <br> 
                                            <a href="registration.jsp" class="register">Register</a>
                                        </div>	
                                    </div>
                                    <form action="login_check" method="post">
                                        <div class="span4 returning_customer">
                                            <h2>Returning Customer</h2>
                                            <div class="customer_select">
                                                <p>I'm a returning customer</p>
                                                &nbsp;
                                                <%
                                                    ServletContext context = getServletContext();
                                                    context.setAttribute("referer", request.getHeader("Referer"));
                                                    Map<String, List<String>> errorMap;
                                                    List<String> errorList;
                                                    String loginTempInfo = "";
                                                    if (session.getAttribute("loginTempInfo") != null) {
                                                        loginTempInfo = (String) session.getAttribute("loginTempInfo");
                                                    }
                                                    errorMap = (Map<String, List<String>>) session.getAttribute("loginErrorMessage");

                                                    if (errorMap != null) {
                                                        if (errorMap.get("loginError") != null) {
                                                            errorList = errorMap.get("loginError");
                                                %>
                                                <small><strong><%=errorList.get(0)%></strong></small><br/>
                                                <%
                                                        }
                                                    }
                                                %>
                                                <p>
                                                    <label><small>Email</small></label>
                                                    <input type="text" name="email" class="width" value="<%=loginTempInfo%>" size="42" tabindex="1" />
                                                </p>
                                                <p>
                                                    <label><small>Password</small></label>
                                                    <input type="password" name="password" class="width" value="" size="42" tabindex="2" />
                                                </p>
                                            </div>	
                                               
                                                <input class="register" type="submit" value="Login" tabindex="3"><br> <a href="forgotpassword.jsp"> <p class="forgot_pass">Forgot your password</p></a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>	
                    </div>
                    <div class="span3 widget-area">
                        <%@include file="right-sidebar_menu.jsp" %>
                    </div>	
                </div>
            </div>
        </div>

         

       
            <div class="contact_info">
                <jsp:include page="follow_social.jsp" flush="true"/>

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