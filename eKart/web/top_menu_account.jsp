
<%@page import="ecommerce.business.User"%>
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
