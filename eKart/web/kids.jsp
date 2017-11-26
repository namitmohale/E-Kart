<%-- 
   
    Created on : Jan 6, 2017, 7:06:40 AM
    
--%>

<%@page import="java.sql.*"%>
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
						<div class="currency_translator span5">	
						<jsp:include page="currency_div.jsp" flush="true"/>				
						</div>
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
					<li><a href="#">Home</a></li><li>&#47;</li><li class="active"><a href="#">Men</a></li>
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
						<div class="group span5 right-order sorting" id="Filters">
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
                                                      <%
                Connection con = null;
                PreparedStatement pst = null;
                ResultSet rst = null;
               try {
                con = shopBeans.ConnDB.getConnection();

                String query = "SELECT * FROM product where ProductCategoryID=3";
                pst = con.prepareStatement(query);
                rst = pst.executeQuery();
                while (rst.next()) {
                   %>
						
						<li class="mix northeast camping climbing fishing swimming mix_all" data-name="Acadia" data-area="47452.80">
							<div class="meta name">
								<div class="img_wrapper loaded">
									<img alt src="images/<%=rst.getString("ProductThumb")%>" onload="imgLoaded(this)">
                                                                        
								</div>

							</div>
										
							<div class="product_info new-product-info">
								<div>
									<div class="new-product-price">Rs <%=rst.getString("ProductPrice")  %></div>
									<div class="new-product-bg">
										<div class="newE-product-cart_like">
											<div class="new-product-cart_like">
												<div class="new-product-cart"><a href="cart_add.jsp?PID=<%=rst.getString("ProductID")  %>"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
												<div class="new-product-like"><a href="wish_list.jsp?PID=<%=rst.getString("ProductID")  %>"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
											</div>
										</div>
										<div class="new-product-details"><a href="product_details.jsp?PID=<%=rst.getString("ProductID")  %>">Details</a></div>
									</div>			
								</div>
							</div>
							<div class="product_description product_info">
								<div class="title"><%=rst.getString("ProductName")  %></div>
								<div class="content">Lorem ipsum dolor sit amet, conse adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="title"><%=rst.getString("ProductName")  %></div>
								<div class="content">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sodales dapibus dui, iaculi metus facilisis sed. Etiam scelerisque molestie purus vel mollis. Mauris dapibus puam id turpis dignissim rutrum. Phasellus placerat nunc in nulla pretium pellentesque. Ipsum dolor sit amet, consectetur adipiscing elit.</div>
							</div>
							<div class="meta product_description">
								<div class="popular-product-info">	
									<div>
												<div class="popular-product-price">Rs 500</div>
												<div class="popular-product-bg">
													<div class="popular-product-cart_like">
														<div class="popular-product-cart_like">
															<div class="popular-product-cart"><a href="cart.jsp?PID=<%=rst.getString("ProductID")  %>"><img alt="" src="images/new-product/shoping-info/cart-image.png"></a></div>
															<div class="popular-product-like"><a href="wish_list.jsp?PID=<%=rst.getString("ProductID")  %>"><img alt="" src="images/new-product/shoping-info/like-img.png"></a></div>
														</div>
													</div>
													<div class="popular-product-details"><a href="product_details.jsp?PID=<%=rst.getString("ProductID")  %>">Details</a></div>
												</div>			
											</div>
								</div>
							</div>
						</li>
						
                                                  <%}
                                                       con.close();
                rst.close();
}catch(Exception ex){System.out.println(ex.toString());}
%>
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
						<jsp:include page="right-sidebar_menu.jsp" flush="true"/>
					</div>	
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
