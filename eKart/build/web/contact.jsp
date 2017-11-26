<%-- 
   
    Created on : Jan 6, 2017, 7:06:40 AM
    
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
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
        <title>Contact</title>

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

        <div class="breadcrumbs">
            <div class="container main">
                <ul>
                    <li><a href="#">Home</a></li><li>&#47;</li><li class="active"><a href="#">Contact US</a></li>
                </ul>
            </div>	
        </div>	

        <div class="main_content">
            <div class="container main">
                <div class="row">

                    <div class="span9 comment_area">
                        <h2 class="title-wrap">
                            Contact & Query Information
                        </h2>
                        <div class="line"></div>
                        <div class="comment_contentp">	
                            <p>Using the Contact Information question type, you can collect respondent demographic information through a single question.</p>
                        </div>	
                        <div id="commentform">
                            <p class="error wrong_name">You must enter a name!</p>
                            <p class="error wrong_email">You must enter a valid email adress!</p>
                            <p class="error wrong_message">You must enter a message!</p>

                            <form method="post" id="contact_us" action="contactus">
                                <p><input type="text" name="Name" id="Name" class="width" value="" size="42" tabindex="1" />
                                    <label><small>Name<strong>*</strong></small></label>
                                </p>

                                <p><input type="text" name="Email" id="Email" class="width" value="" size="42" tabindex="2" />
                                    <label><small>Email<strong>*</strong></small></label></p>

                                <p><input type="text" name="Phone" id="Phone" class="width" value="" size="42" tabindex="3" />
                                    <label><small>Phone</small></label></p>
                                        <p> <select>
                                                <option value="Query">Query    </option>
                                                <option value="Compline">Compline</option>
                                    </select>
                                     
                                    <label><small>Message Type </small></label></p>
                                 

                                <p><textarea name="Message" id="Message" cols="58" rows="20" tabindex="4"></textarea></p>
                                <p><input type="submit" name="submitButton" class="submitbutton" id="contact-submit" value="Submit" /></p>
                            </form>

                            <p id="success">Your message has been sent, thank you!</p>
                        </div>
                    </div>

                    <div class="span3 widget-area">
                        <div class="right-sidebar">
                            <div class="widget-info">
                                <div class="widget-title">Categories</div>
                                <div class="line"></div>
                                <div class="widget-content">
                                    <ul>
                                        <li><a href="#">Dresses</a></li>
                                        <li><a href="#">Bags & Purses</a></li>
                                        <li><a href="#">Coats & Jackets</a></li>
                                        <li><a href="#">Accessories</a></li>
                                        <li><a href="#">Designer</a></li>
                                        <li><a href="#">Jeans</a></li>
                                        <li><a href="#">Jewellery & Watches</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="widget-info">
                                <div class="widget-title">By Price</div>
                                <div class="line"></div>
                                <div class="widget-price">
                                    <ul>
                                        <li><a href="#">0 - Rs 1,700.00</a></li>
                                        <li><a href="#">Rs 20 - Rs 2,800.00</a></li>
                                        <li><a href="#">Rs 50 - Rs 2,900.00</a></li>
                                        <li><a href="#">Rs 75 - Rs 3,990.00</a></li>
                                        <li><a href="#">Rs 100 - Rs 4,600.00</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="widget-info">
                                <div class="widget-title">Manufacturer</div>
                                <div class="line"></div>
                                <div class="widget-content">
                                    <form>
                                        <div><input type="checkbox" name="vehicle" value="Bike"><div class="brand_name">Adidas</div></div>
                                        <div><input type="checkbox" name="vehicle" value="Car"><div class="brand_name">Nike</div></div>
                                        <div><input type="checkbox" name="vehicle" value="Bike"><div class="brand_name">T-Shirt</div></div>
                                        <div><input type="checkbox" name="vehicle" value="Car"><div class="brand_name">Puma</div></div> 
                                        <div><input type="checkbox" name="vehicle" value="Bike"><div class="brand_name">Denim</div></div>
                                        <div><input type="checkbox" name="vehicle" value="Car"><div class="brand_name">Dedeman</div></div> 
                                        <div><input type="checkbox" name="vehicle" value="Car"><div class="brand_name">New wear</div></div>
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
            <div class="footer-top">
                <div class="container main" id="footer-top">

                    <div class="row">
                        <div class="span3 footer-col">
                            <div class="widget-info">
                                <div class="widget-title">Information</div>
                                <div class="line"></div>
                                <div class="widget-content">
                                    <ul>
                                        <li><a href="#">About Us</a></li>
                                        <li><a href="#">Customer Service</a></li>
                                        <li><a href="#">Privacy Policy</a></li>
                                        <li><a href="#">Site Map</a></li>
                                        <li><a href="#">Contact Us</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="span3 footer-col">
                            <div class="widget-info">
                                <div class="widget-title">Why Buy From Us</div>
                                <div class="line"></div>
                                <div class="widget-content">
                                    <ul>
                                        <li><a href="#">Shipping & Returns</a></li>
                                        <li><a href="#">Secure Shopping</a></li>
                                        <li><a href="#">International Shipping</a></li>
                                        <li><a href="#">Affiliates</a></li>
                                        <li><a href="#">Group Sales</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="span3 footer-col">
                            <div class="widget-info">
                                <div class="widget-title">My Account</div>
                                <div class="line"></div>
                                <div class="widget-content">
                                    <ul>
                                        <li><a href="#">Sign In</a></li>
                                        <li><a href="#">Customer Service</a></li>
                                        <li><a href="#">My Wishlist</a></li>
                                        <li><a href="#">Track My Order</a></li>
                                        <li><a href="#">Help</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="span3 footer-col">
                            <div class="widget-info">
                                <div class="widget-title">Newsletter</div>
                                <div class="line"></div>
                                <div class="widget-content">
                                    <input type="text" name="mail" placeholder="Your E-mail Address">
                                    <button class="go_btn">Go</button>
                                    <br/>
                                    <p>Store Location: <span>Amity Bazaar</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="container main" id="footer-bottom">
                    <div class="row">
                        <div class="span8 footer-col">
                            Copyright &#169; 2016  . All rights reserved.
                        </div>
                        <div class="span4 footer-col">
                            <ul>
                                <li><a href="#"><img alt="" src="images/payment-getway/1.png"></a></li>
                                <li><a href="#"><img alt="" src="images/payment-getway/2.png"></a></li>
                                <li><a href="#"><img alt="" src="images/payment-getway/3.png"></a></li>
                                <li><a href="#"><img alt="" src="images/payment-getway/4.png"></a></li>
                                <li><a href="#"><img alt="" src="images/payment-getway/5.png"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
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