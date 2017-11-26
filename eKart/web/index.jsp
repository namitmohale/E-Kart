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
        <title>eCommerce</title>

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

        <div class="main_content">

            <div class="container main" id="main-slide">
                <div id="wrapper">
                    <div class="slide-content">
                        <div class="bounce-slider" id="first">
                            <ul>
                                <li>
                                    <p class="bounce-desc right-side"><span>New Modern Dress <br/> Women Summer Collection</span></p>
                                    <img src="images/slides/slide1.png" alt="image 1"/>
                                </li>
                                <li>
                                    <p class="bounce-desc left-side"><span>New Modern Dress <br/> Women Summer Collection</span></p>
                                    <img src="images/slides/slide2.png" alt="image 2"/>
                                </li>
                                <li>
                                    <p class="bounce-desc left-side"><span>New Modern Dress <br/> Women Summer Collection</span></p>
                                    <img src="images/slides/slide3.png" alt="image 2"/>
                                </li>
                            </ul>
                            <span class="next bounce-nav"></span>	
                            <span class="prev bounce-nav"></span>
                        </div>
                    </div>
                </div>	

            </div>
            <div class="container main">
                <div class="row home-content">
                    <div class="span4 feature-content">
                        <div id="feature-image_1">
                            <img alt="" src="images/feature-content/sweater.png">
                        </div>
                        <div id="feature-post-content_1">
                            <ul>
                                <li id="feature-post-content-title_1">Sweater</li>
                                <li>Up to</li>
                                <li><p id="feature-post-content-discount_1">40%</p><p>off</p></li>
                            </ul>
                            <ul>
                                <li><button class="shop-now">Shop Now</button></li>
                            </ul>
                        </div>
                    </div>
                    <div class="span4 feature-content">
                        <div id="feature-image_2">
                            <img alt="" src="images/feature-content/scarf.png">
                        </div>
                        <div id="feature-post-content_2">
                            <ul>
                                <li id="feature-post-content-title_2">Scarf</li>
                                <li>Up to</li>
                                <li><p id="feature-post-content-discount_2">40%</p><p>off</p></li>
                            </ul>
                            <ul>
                                <li><button class="shop-now">Shop Now</button></li> 
                            </ul>
                        </div>
                    </div>
                    <div class="span4 feature-content">
                        <div id="feature-image_3">
                            <img alt="" src="images/feature-content/dress.png">
                        </div>
                        <div id="feature-post-content_3">
                            <ul>
                                <li id="feature-post-content-title_3">Dress</li>
                                <li>Up to</li>
                                <li><p id="feature-post-content-discount_3">40%</p><p>off</p></li>
                            </ul>
                            <ul>
                                <li><button class="shop-now">Shop Now</button></li> 
                            </ul>
                        </div>
                    </div>					
                </div>			

            </div>

            <jsp:include page="new_product.jsp" flush="true"/> 
            

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
