<%-- 
    Document   : product_details_men
    Created on : Nov 28, 2013, 1:12:27 PM
    Author     : General
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
		<title>Product Details</title>
	
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
							<div class="currency">
								CURRENCY:
									<select class="select_bg">
										<option value="dollar">DOLLAR</option>
										<option value="euro">EURO</option>
										<option value="taka">TAKA</option>
										<option value="rupe">RUPE</option>
									</select>
							</div>
							<ul class="translator">
								<li class="en"><a class="active" href="#">EN</a></li>
								<li class="en"><a href="#">ES</a></li>
								<li class="en"><a href="#">FR</a></li>
							</ul>				
						</div>
						<div class="account_login span7">
						
							<ul class="account_info">
                                                                <%
                                                                User user;
                                                                if(session.getAttribute("user")!=null){
                                                                    user = (User) session.getAttribute("user");
                                                                %>
                                                                    <li><a href="#"><img alt="" src="images/my_account.png"> Hi <%=user.getFirstName()%> <%=user.getLastName()%></a></li>
                                                                    <li><a href="wish_list.jsp"><img alt="" src="images/mywish_list.png"> MY WISHLIST</a></li>
                                                                    <li><a href="cart.jsp"><img alt="" src="images/shopping_cart.png"> MY CART</a></li>
                                                                    <li><a href="checkout.jsp"><img alt="" src="images/checkout.png"> MY CHECKOUT</a></li>
                                                                    <li><a href="logout">
                                                                        <img alt="" src="images/login.png"> SIGN OUT</a></li>
                                                                <%
                                                                }
                                                                else{
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
							<p>PHONE: <span class="color">1 (234) 56 78 901</span></p>
							<p>Call us Monday - Saturday: 9:00 am - 6:00 pm</p>
						</div>
						<div class="cart_info span3">
							<div class="cart_data">Shopping Cart - $0.00</div>
							<button class="cart_btn btn btn-navbar" data-toggle="collapse" data-target=".item_cart_wrap"><img alt="" src="images/shopping_cart_btn_img.png"></button>
							<div class="item_cart_content">
								<div class="item_cart_wrap collapse">
									<div class="item_cart">
										<p class="item_cart_products">No Products</p>
										<p class="item_cart_info">Shipping - $0.00</p>
										<p class="item_cart_info">Total - $0.00</p>
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
	
		<div class="breadcrumbs">
			<div class="container main">
				<ul>
					<li><a href="#">Home</a></li><li>&#47;</li><li class="active"><a href="#">Product Details</a></li>
				</ul>
			</div>	
		</div>	
	
		<div class="main_content">
			<div class="container main">
				<div class="row">
					<div class="span3 widget-area">
					<div class="left-sidebar">
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
							<div class="widget-title">Specials</div>
							<div class="line"></div>
							<div class="widget-content">
								<ul>
									<li class="feature_pro sidebar_post_wrap">
										<div class="feature_pro_image sidebar_feature_img">	
											<img alt="" src="images/special-widget/1.png">
										</div>
										<div class="feature_pro_info sidebar_feature_pro_info">
											<p class="feature_pro_title sidebar_feature_pro_title">New Modern Dresses</p>
											<p class="feature_pro_content sidebar_feature_pro_content">Lorem ipsum dolor sit amet conse adipising elit.</p>
											<button class="feature_pro_price sidebar_pro_price">$500</button>
										</div>	
									</li>
									<li class="feature_pro sidebar_post_wrap">
										<div class="feature_pro_image sidebar_feature_img">	
											<img alt="" src="images/special-widget/2.png">
										</div>
										<div class="feature_pro_info sidebar_feature_pro_info">
											<p class="feature_pro_title sidebar_feature_pro_title">New Modern Dresses</p>
											<p class="feature_pro_content sidebar_feature_pro_content">Lorem ipsum dolor sit amet conse adipising elit.</p>
											<button class="feature_pro_price sidebar_pro_price">$500</button>
										</div>	
									</li>
									<li class="feature_pro sidebar_post_wrap">
										<div class="feature_pro_image sidebar_feature_img">	
											<img alt="" src="images/special-widget/3.png">
										</div>
										<div class="feature_pro_info sidebar_feature_pro_info">
											<p class="feature_pro_title sidebar_feature_pro_title">New Modern Dresses</p>
											<p class="feature_pro_content sidebar_feature_pro_content">Lorem ipsum dolor sit amet conse adipising elit.</p>
											<button class="feature_pro_price sidebar_pro_price">$500</button>
										</div>	
									</li>
								</ul>
							</div>
						</div>
					</div>
					
				</div>
					<div class="span9 product_details">					
						<div class="row">
							<div class="span4">
								<div class="porduct_info">
									
									<div class="clearfix portfilio_zooming_product span9">
										<a href="images/zoom_image/small_man1.png" class="jqzoom" rel='gal1'  title="triumph" >
											<div class="span4">
											<img alt="" src="images/zoom_image/man01.png"  title="triumph"></div>
										</a>
									</div>
			
									<div class="clearfix span4" >
										<ul id="thumblist" class="clearfix" >
											<li>
												<a class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './images/zoom_image/small_man1.png',largeimage: './images/zoom_image/man01.png'}"><img alt="" src='images/zoom_image/thumbs/man_tum01.png'></a>
											</li>

											<li>
												<a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './images/zoom_image/small_man2.png',largeimage: './images/zoom_image/man02.png'}"><img alt="" src='images/zoom_image/thumbs/man_tum02.png'></a>
											</li>
											<li>
												<a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './images/zoom_image/small_man3.png',largeimage: './images/zoom_image/man03.png'}"><img alt="" src='images/zoom_image/thumbs/man_tum03.png'></a>
											</li>
										</ul>
									</div>
								</div>	
							</div>
							<div class="row">
								<div class="span5">
								
									<div class="porduct_info_details ">
										<div class="row">
											<div class="product_single_title span2">
												New Modern Dress
											</div>

											<div class="product_select span4">
												<div class="product_single_select">
													<select>
														<option value="small">SMALL</option>
														<option value="medium">MEDIUM</option>
														<option value="lage">LARGE</option>
														<option value="extra-large">EXTRA LARGE</option>
													</select>
												</div>
												<div class="product_single_quantity_select">
													<select>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
														<option value="6">6</option>
														<option value="7">7</option>
														<option value="8">8</option>
														<option value="9">9</option>
													</select>
												</div>
											</div>
											<div class="product_single_info span4">
												<p><span>Product Info:</span> 68% cotton 32% polyester</p>
												<p><span>Care Instructions:</span> Wash warm. Dry with NO heat.</p>
											</div>
											<div class="product_single_model_info span4">
												<p><span>About This Model:</span></p>
												<p>Height / Weight: 5' 9 - 130lbs</p>
												<p>Cut: Light Sweater</p>
												<p>Material: Poly Cotton</p>
											</div>
											<div class="product_single_cart_info span3">
												<button class="price">
													$500
												</button>
												<button class="add_to_cart">
													<img alt="" src="images/new-product/shoping-info/cart-image.png">
													<span>Add to cart</span>
												</button>
												<button class="like">
													<img alt="" src="images/new-product/shoping-info/like-img.png">
												</button>
											</div>
										</div>	
										<div class="row">
										<div class="span4"></div>
										<div class="rating_share_wrapper">
											<div class="rating span2">
												<ul>
													<li class="rated"></li>
													<li class="rated"></li>
													<li class="rated"></li>
													<li></li>
													<li></li>
												</ul>
											</div>
											<div class="share_it span3">
												<p>Share this:</p>
												<ul>
													<li>
														<a href="#">
															<img alt="" src="images/share_it/fb.png"><p>share</p>
														</a>
													</li>
													<li>
														<a href="#">
															<img alt="" src="images/share_it/pin.png"><p>pin it</p>
														</a>
													</li>
													<li>
														<a href="#">
															<img alt="" src="images/share_it/tw.png"><p>tweet</p>
														</a>
													</li>
												</ul>				
											</div>
										</div>
										</div>
										<div class="row">
									<div class="product_description span5">
										<script type="text/javascript">
											  jQuery(function() {
												$( "#tab").tabs();
											  });
										</script>
											<div id="tab">
											  <ul>
												<li><a href="#tabs-1">Nunc tincidunt</a></li>
												<li><a href="#tabs-2">Proin dolor</a></li>
												<li><a href="#tabs-3">Aenean lacinia</a></li>
											  </ul>
											  <div id="tabs-1">
												<p>Premium burnished full-grain leather and suede upper for a
												Leather is from a tannery rated Silver for its water, energy and waste-management practices. Leather lining and footbed for premium feel and optimal comfort. <span>SmartWool</span> faux insole is shearling lining is made with <span>60%</span> merino wool and <span>40%</span> PET Reflective insole board for additional warmth under foot.</p>
											  </div>
											  <div id="tabs-2">
												<p>Leather lining and footbed for premium feel and optimal comfort. <span>SmartWool</span> faux insole is shearling lining is made with <span>60%</span> merino wool and <span>40%</span> PET Reflective insole board for additional warmth under foot.</p>
											  </div>
											  <div id="tabs-3">
												<p>Premium burnished full-grain leather and suede upper for a
												Leather is from a tannery rated Silver for its water, energy and waste-management practices. Leather lining and footbed for premium feel and optimal comfort. <span>SmartWool</span> faux insole is shearling lining is made with <span>60%</span> merino wool and <span>40%</span> PET Reflective insole board for additional warmth under foot.</p>
											  </div>
											</div>
											
										</div>
										</div>
									</div>
						
								</div>
							</div>
						</div>
						<div class="row">
							<div class="span9 related_product checkout_area list_work">
								<h2 class="title-wrap">
									<span>Related Products</span>
								</h2>
								<div class="line"></div>
								<div class="new-product-info">
									<div class="related_products">
										<div class="span3 new-product slide">
											<div class="new-product-image">	
												<a href="#"><img src="images/new-product/01.jpg" alt="" /></a>
											</div>	
											<div class="new-product-info">	
												<div>
													<div class="new-product-price">$500</div>
													<div class="new-product-bg">
														<div class="newE-product-cart_like">
															<div class="new-product-cart_like">
																<div class="new-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
																<div class="new-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
															</div>
														</div>
														<div class="new-product-details"><a href="#">Details</a></div>
													</div>			
												</div>
											</div>
											<div class="new-product-content">
												<div class="new-product-title">
													<a href="#"><p>New Modern Dresses</p></a>
												</div>
												<div class="new-product-content">
													<p>Lorem ipsum dolor sit amet, conse adipiscing elit.</p>
												</div>
											</div>
										</div>
										<div class="span3 new-product slide">
											<div class="new-product-image">	
												<div class="sell"></div>
												<a href="#"><img src="images/new-product/04.jpg" alt="" /></a>
											</div>	
											<div class="new-product-info">	
												<div>
													<div class="new-product-price">$500</div>
													<div class="new-product-bg">
														<div class="newE-product-cart_like">
															<div class="new-product-cart_like">
																<div class="new-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
																<div class="new-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
															</div>
														</div>
														<div class="new-product-details"><a href="#">Details</a></div>
													</div>			
												</div>
											</div>
											<div class="new-product-content">
												<div class="new-product-title">
													<a href="#"><p>New Modern Dresses</p></a>
												</div>
												<div class="new-product-content">
													<p>Lorem ipsum dolor sit amet, conse adipiscing elit.</p>
												</div>
											</div>
										</div>
										<div class="span3 new-product slide">
											
											
											<div class="new-product-image">	
												<a href="#"><img src="images/new-product/03.jpg" alt="" /></a>
											</div>	
											<div class="new-product-info">	
												<div>
													<div class="new-product-price">$500</div>
													<div class="new-product-bg">
														<div class="newE-product-cart_like">
															<div class="new-product-cart_like">
																<div class="new-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
																<div class="new-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
															</div>
														</div>
														<div class="new-product-details"><a href="#">Details</a></div>
													</div>			
												</div>
											</div>
											<div class="new-product-content">
												<div class="new-product-title">
													<a href="#"><p>New Modern Dresses</p></a>
												</div>
												<div class="new-product-content">
													<p>Lorem ipsum dolor sit amet, conse adipiscing elit.</p>
												</div>
											</div>
										</div>
										<div class="span3 new-product slide">
											<div class="new-product-image">	
												<a href="#"><img src="images/new-product/01.jpg" alt="" /></a>
											</div>	
											<div class="new-product-info">	
												<div>
													<div class="new-product-price">$500</div>
													<div class="new-product-bg">
														<div class="newE-product-cart_like">
															<div class="new-product-cart_like">
																<div class="new-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
																<div class="new-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
															</div>
														</div>
														<div class="new-product-details"><a href="#">Details</a></div>
													</div>			
												</div>
											</div>
											<div class="new-product-content">
												<div class="new-product-title">
													<a href="#"><p>New Modern Dresses</p></a>
												</div>
												<div class="new-product-content">
													<p>Lorem ipsum dolor sit amet, conse adipiscing elit.</p>
												</div>
											</div>
										</div>
										<div class="span3 new-product slide">
											<div class="new-product-image">	
												<a href="#"><img src="images/new-product/01.jpg" alt="" /></a>
											</div>	
											<div class="new-product-info">	
												<div>
													<div class="new-product-price">$500</div>
													<div class="new-product-bg">
														<div class="newE-product-cart_like">
															<div class="new-product-cart_like">
																<div class="new-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
																<div class="new-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
															</div>
														</div>
														<div class="new-product-details"><a href="#">Details</a></div>
													</div>			
												</div>
											</div>
											<div class="new-product-content">
												<div class="new-product-title">
													<a href="#"><p>New Modern Dresses</p></a>
												</div>
												<div class="new-product-content">
													<p>Lorem ipsum dolor sit amet, conse adipiscing elit.</p>
												</div>
											</div>
										</div>
										<div class="span3 new-product slide">
											<div class="new-product-image">	
												<a href="#"><img src="images/new-product/01.jpg" alt="" /></a>
											</div>	
											<div class="new-product-info">	
												<div>
													<div class="new-product-price">$500</div>
													<div class="new-product-bg">
														<div class="newE-product-cart_like">
															<div class="new-product-cart_like">
																<div class="new-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
																<div class="new-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
															</div>
														</div>
														<div class="new-product-details"><a href="#">Details</a></div>
													</div>			
												</div>
											</div>
											<div class="new-product-content">
												<div class="new-product-title">
													<a href="#"><p>New Modern Dresses</p></a>
												</div>
												<div class="new-product-content">
													<p>Lorem ipsum dolor sit amet, conse adipiscing elit.</p>
												</div>
											</div>
										</div>								
									</div>
								</div>	
						<script type="text/javascript">
							$(document).ready(function(){
							  $('.related_products').bxSlider({
								slideWidth: 220,
								minSlides: 2,
								maxSlides: 3,
								slideMargin: 18
							  });
							});
						</script>
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
									On Orders  Over $ 499
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
									<p id="nb">1 (234) 56 78 901</p>
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
									<p>Store Location: <span>8601 Creat Labaratory, New York, D05 86GR</span></p>
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
							Copyright &#169; 2013 <a href="#">Fedimo</a>. All rights reserved.
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
		<script type="text/javascript" src="js/new-product-js/jquery.jcarousel.min.js"> </script>
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
