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
					<li><a href="#">Home</a></li><li>&#47;</li><li class="active"><a href="#">Women</a></li>
				</ul>
			</div>	
		</div>
		
		<div class="main_content">
			<div class="container main product_style">
				<div class="row">
					<div class="span9 product-area">
					
						<div class="discount_banner">
							<img alt="" src="images/discount_banner.png">
						</div>
					
				<!--Nav section for mixtop-->
					
						<nav class="controls just view_as top">
						<div class="group span4 left-order Sorts">
							<p>view as:</p>
							<ul>
								<li><div class="button" id="ToGrid"></div></li>
								<li><div class="button" id="ToList"></div></li>
							</ul>
						</div>
						<div class="group span5 right-order" id="Filters">
							<div class="text-show">
								<p>show:</p>
							</div>
							<div class="drop_down sort">
								<div class="select_bg_sort"><p>Position</p></div>
								<ul class="">
									<li class="active" data-filter="all" data-dimension="region">All</li>
									<li data-filter="alaska" data-dimension="region">New</li>
									<li data-filter="intermountain" data-dimension="region">Intermountain</li>
									<li data-filter="northeast" data-dimension="region">Fashion</li>
									<li data-filter="pacific_west" data-dimension="region">Smart</li>
									<li data-filter="southeast" data-dimension="region">Beautiful</li>
								</ul>
							</div>
							<div class="text-show">
								<p>show:</p>
							</div>
							<div class="drop_down show">
								<div class="select_bg_pn"><p>1</p></div>
								<ul class="">
									<li class="active" data-filter="all" data-dimension="recreation">1</li>
									<li data-filter="camping" data-dimension="recreation">2</li>
									<li data-filter="climbing" data-dimension="recreation">3</li>
									<li data-filter="fishing" data-dimension="recreation">4</li>
									<li data-filter="swimming" data-dimension="recreation">5</li>
								</ul>
							</div>
						</div>
					</nav>
					
					<!--Nav section for mixtop-->
					
						<ul id="Parks" class="just list">
						
						<li class="mix northeast camping climbing fishing swimming mix_all" data-name="Acadia" data-area="47452.80">
							<div class="meta name">
								<div class="img_wrapper loaded">
									<img alt="" src="images/grid_item/1.png" onload="imgLoaded(this)">
								</div>

							</div>
										
							<div class="product_info new-product-info">
								<div>
									<div class="new-product-price">Rs 500</div>
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
							<div class="product_description product_info">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, conse adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, iaculi metus facilisis sed. Etiam scelerisque molestie purus vel mollis. Mauris dapibus puam id turpis dignissim rutrum. Phasellus placerat nunc in nulla pretium pellentesque. Ipsum dolor sit amet, consectetur adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="popular-product-info">	
									<div>
												<div class="popular-product-price">Rs 500</div>
												<div class="popular-product-bg">
													<div class="popular-product-cart_like">
														<div class="popular-product-cart_like">
															<div class="popular-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
															<div class="popular-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
														</div>
													</div>
													<div class="popular-product-details"><a href="#">Details</a></div>
												</div>			
											</div>
								</div>
							</div>
						</li>
						<li class="mix intermountain camping climbing mix_all" data-name="Arches" data-area="76678.98">
							<div class="meta name">
								<div class="img_wrapper loaded">
									<div class="new"></div>
									<img alt="" src="images/grid_item/2.png" onload="imgLoaded(this)">
								</div>

							</div>
							<div class="product_info new-product-info">
								<div>
									<div class="new-product-price">Rs 500</div>
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
							<div class="product_description product_info">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, conse adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, iaculi metus facilisis sed. Etiam scelerisque molestie purus vel mollis. Mauris dapibus puam id turpis dignissim rutrum. Phasellus placerat nunc in nulla pretium pellentesque. Ipsum dolor sit amet, consectetur adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="popular-product-info">	
									<div>
												<div class="popular-product-price">Rs 500</div>
												<div class="popular-product-bg">
													<div class="popular-product-cart_like">
														<div class="popular-product-cart_like">
															<div class="popular-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
															<div class="popular-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
														</div>
													</div>
													<div class="popular-product-details"><a href="#">Details</a></div>
												</div>			
											</div>
								</div>
							</div>
						</li>
						<li class="mix pacific_west camping fishing mix_all" data-name="Crater Lake" data-area="183224.05">
							<div class="meta name">
								<div class="img_wrapper loaded">
									<img alt="" src="images/grid_item/3.png" onload="imgLoaded(this)">
								</div>

							</div>
							<div class="product_info new-product-info">
								<div>
									<div class="new-product-price">Rs 500</div>
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
							<div class="product_description product_info">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, conse adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, iaculi metus facilisis sed. Etiam scelerisque molestie purus vel mollis. Mauris dapibus puam id turpis dignissim rutrum. Phasellus placerat nunc in nulla pretium pellentesque. Ipsum dolor sit amet, consectetur adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="popular-product-info">	
									<div>
												<div class="popular-product-price">Rs 500</div>
												<div class="popular-product-bg">
													<div class="popular-product-cart_like">
														<div class="popular-product-cart_like">
															<div class="popular-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
															<div class="popular-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
														</div>
													</div>
													<div class="popular-product-details"><a href="#">Details</a></div>
												</div>			
											</div>
								</div>
							</div>
						</li>
						<li class="mix alaska camping climbing fishing mix_all" data-name="Denali" data-area="4740911.37">
							<div class="meta name">
								<div class="img_wrapper loaded">
									<div class="sell"></div>
									<img alt="" src="images/grid_item/4.png" onload="imgLoaded(this)">
								</div>

							</div>
							<div class="product_info new-product-info">
								<div>
									<div class="new-product-price">Rs 500</div>
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
							<div class="product_description product_info">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, conse adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, iaculi metus facilisis sed. Etiam scelerisque molestie purus vel mollis. Mauris dapibus puam id turpis dignissim rutrum. Phasellus placerat nunc in nulla pretium pellentesque. Ipsum dolor sit amet, consectetur adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="popular-product-info">	
									<div>
												<div class="popular-product-price">Rs 500</div>
												<div class="popular-product-bg">
													<div class="popular-product-cart_like">
														<div class="popular-product-cart_like">
															<div class="popular-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
															<div class="popular-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
														</div>
													</div>
													<div class="popular-product-details"><a href="#">Details</a></div>
												</div>			
											</div>
								</div>
							</div>
						</li>
						<li class="mix alaska camping fishing mix_all" data-name="Glacier Bay" data-area="3223383.66">
							<div class="meta name">
								<div class="img_wrapper loaded">
									<img alt="" src="images/grid_item/5.png" onload="imgLoaded(this)">
								</div>
							</div>
							<div class="product_info new-product-info">
								<div>
									<div class="new-product-price">Rs 500</div>
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
							<div class="product_description product_info">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, conse adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, iaculi metus facilisis sed. Etiam scelerisque molestie purus vel mollis. Mauris dapibus puam id turpis dignissim rutrum. Phasellus placerat nunc in nulla pretium pellentesque. Ipsum dolor sit amet, consectetur adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="popular-product-info">	
									<div>
												<div class="popular-product-price">Rs 500</div>
												<div class="popular-product-bg">
													<div class="popular-product-cart_like">
														<div class="popular-product-cart_like">
															<div class="popular-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
															<div class="popular-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
														</div>
													</div>
													<div class="popular-product-details"><a href="#">Details</a></div>
												</div>			
											</div>
								</div>
							</div>
						</li>
						<li class="mix intermountain camping fishing mix_all" data-name="Grand Canyon" data-area="1217261.75">
							<div class="meta name">
								<div class="img_wrapper loaded">
									<img alt="" src="images/grid_item/6.png" onload="imgLoaded(this)">
								</div>

							</div>
							<div class="product_info new-product-info">
								<div>
									<div class="new-product-price">Rs 500</div>
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
							<div class="product_description product_info">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, conse adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, iaculi metus facilisis sed. Etiam scelerisque molestie purus vel mollis. Mauris dapibus puam id turpis dignissim rutrum. Phasellus placerat nunc in nulla pretium pellentesque. Ipsum dolor sit amet, consectetur adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="popular-product-info">	
									<div>
												<div class="popular-product-price">Rs 500</div>
												<div class="popular-product-bg">
													<div class="popular-product-cart_like">
														<div class="popular-product-cart_like">
															<div class="popular-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
															<div class="popular-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
														</div>
													</div>
													<div class="popular-product-details"><a href="#">Details</a></div>
												</div>			
											</div>
								</div>
							</div>
						</li>
						<li class="mix southeast camping fishing mix_all" data-name="Great Smoky Mountains" data-area="522418.90">
							<div class="meta name">
								<div class="img_wrapper loaded">
									<div class="sell"></div>
									<img alt="" src="images/grid_item/7.png" onload="imgLoaded(this)">
								</div>
							</div>
							<div class="product_info new-product-info">
								<div>
									<div class="new-product-price">Rs 500</div>
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
							<div class="product_description product_info">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, conse adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, iaculi metus facilisis sed. Etiam scelerisque molestie purus vel mollis. Mauris dapibus puam id turpis dignissim rutrum. Phasellus placerat nunc in nulla pretium pellentesque. Ipsum dolor sit amet, consectetur adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="popular-product-info">	
									<div>
												<div class="popular-product-price">Rs 500</div>
												<div class="popular-product-bg">
													<div class="popular-product-cart_like">
														<div class="popular-product-cart_like">
															<div class="popular-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
															<div class="popular-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
														</div>
													</div>
													<div class="popular-product-details"><a href="#">Details</a></div>
												</div>			
											</div>
								</div>
							</div>
						</li>
						<li class="mix pacific_West camping swimming mix_all" data-name="Haleakala" data-area="33264.62">
							<div class="meta name">
								<div class="img_wrapper loaded">
									<img alt="" src="images/grid_item/8.png" onload="imgLoaded(this)">
								</div>
							</div>
							<div class="product_info new-product-info">
								<div>
									<div class="new-product-price">Rs 500</div>
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
							<div class="product_description product_info">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, conse adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, iaculi metus facilisis sed. Etiam scelerisque molestie purus vel mollis. Mauris dapibus puam id turpis dignissim rutrum. Phasellus placerat nunc in nulla pretium pellentesque. Ipsum dolor sit amet, consectetur adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="popular-product-info">	
									<div>
												<div class="popular-product-price">Rs 500</div>
												<div class="popular-product-bg">
													<div class="popular-product-cart_like">
														<div class="popular-product-cart_like">
															<div class="popular-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
															<div class="popular-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
														</div>
													</div>
													<div class="popular-product-details"><a href="#">Details</a></div>
												</div>			
											</div>
								</div>
							</div>
						</li>
						<li class="mix intermountain camping climbing fishing swimming mix_all" data-name="Yellowstone" data-area="2219790.71">
							<div class="meta name">
								<div class="img_wrapper loaded">
									<img alt="" src="images/grid_item/9.png" onload="imgLoaded(this)">
								</div>
							</div>
							<div class="product_info new-product-info">
								<div>
									<div class="new-product-price">Rs 500</div>
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
							<div class="product_description product_info">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, conse adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="title">New Modern Dresses</div>
								<div class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, iaculi metus facilisis sed. Etiam scelerisque molestie purus vel mollis. Mauris dapibus puam id turpis dignissim rutrum. Phasellus placerat nunc in nulla pretium pellentesque. Ipsum dolor sit amet, consectetur adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="popular-product-info">	
									<div>
												<div class="popular-product-price">Rs 500</div>
												<div class="popular-product-bg">
													<div class="popular-product-cart_like">
														<div class="popular-product-cart_like">
															<div class="popular-product-cart"><a href="#"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
															<div class="popular-product-like"><a href="#"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
														</div>
													</div>
													<div class="popular-product-details"><a href="#">Details</a></div>
												</div>			
											</div>
								</div>
							</div>
						</li>
					</ul>
					
				<!--Nav section for mixtop-->
					
						<nav class="controls just view_as bottom">
						<div class="group span5 left-order Sorts">
							<p>view as:</p>
							<ul>
								<li><div class="button" id="ToGrid1"></div></li>
								<li><div class="button" id="ToList1"></div></li>
							</ul>
						</div>
						<div class="group span4 right-order">
							<!-- Start pagination -->
								<div class="pagination">
									<ul>
									  <li><a href="#">1</a></li>
									  <li><a href="#">2</a></li>
									  <li class="active"><a href="#">3</a></li>
									  <li><a href="#">4</a></li>
									  <li><a href="#"></a></li>
									</ul>
								</div>
							<!-- End pagination -->
						</div>
					</nav>
						
				<!--Nav section for mixtop-->	
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
