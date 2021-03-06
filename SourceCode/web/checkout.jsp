
<%@page import="java.math.BigDecimal"%>
<%@page import="model.TransactionItem"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/skeleton.css">
        <link rel="stylesheet" href="css/cart-style.css" />

        <link rel="stylesheet" href="css/checkout-style.css" />
    </head>
    <body>
        <!-- START NAV-->
        <div id="nav-bar">
            <div id="talaria-logo">
                TALARIA
            </div>
            <div id="links">
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="catalog.jsp">Catalog</a></li>
                </ul>
            </div>
            <div id="account">
                <ul>
                    <li><a href="cart.jsp">Cart (<span><c:out value="${sessionScope.cartSize}"/></span>)</a></li>
                    <li><a href="catalog.jsp">Account</a></li>
                    <li><a href="index.jsp">Log Out</a></li>
                </ul>
            </div>
        </div>
        <!-- END NAV-->
        <div class="wrapper" style="display: block">
            <form action="AddTransactionServlet" method="POST">
                <h1>Checkout</h1>
                <h3> <b>1</b> Shipping information</h3>
                <div class="row">
                    <div class="four columns">
                        <label for="houseNumber">House Number</label>
                        <input class="u-full-width" type="text" placeholder="House Number" id="houseNumber" name="houseNumber">
                    </div>
                    <div class="eight columns">
                        <label for="street">Street</label>
                        <input class="u-full-width" type="text" placeholder="Street" id="street" name="street">
                    </div>
                </div>
                <div class="row">
                    <div class="six columns">
                        <label for="subdivision">Sub-Division</label>
                        <input class="u-full-width" type="text" placeholder="Subdivison" id="subdivision" name="subdivision">
                    </div>
                    <div class="six columns">
                        <label for="city">City</label>
                        <input class="u-full-width" type="text" placeholder="City" id="city" name="city">
                    </div>
                </div>
                <h3> <b>2</b> Payment Information</h3>
                <h5>Credit Card Details</h5>
                <div class="row">
                    <div class="eight columns">
                        <label for="creditCardNumber">Credit Card Number</label>
                        <input class="u-full-width" type="text" placeholder="Credit Card Number" id="creditCardNumber" name="creditCardNumber">
                    </div>
                    <div class="four columns">
                        <label for="securityCode">Security Code</label>
                        <input class="u-full-width" type="text" placeholder="Security Code" id="securityCode" name="securityCode">
                    </div>
                </div>
                <h5>Billing Address</h5>
                <div class="row">
                    <div class="four columns">
                        <label for="billingHouseNumber">House Number</label>
                        <input class="u-full-width" type="text" placeholder="House Number" id="billingHouseNumber" name="billingHouseNumber">
                    </div>
                    <div class="eight columns">
                        <label for="billingStreet">Street</label>
                        <input class="u-full-width" type="text" placeholder="Street" id="billingStreet" name="billingStreet">
                    </div>
                </div>
                <div class="row">
                    <div class="six columns">
                        <label for="billingSubdivision">Sub-Division</label>
                        <input class="u-full-width" type="text" placeholder="Subdivison" id="billingSubdivision" name="billingSubdivision">
                    </div>
                    <div class="six columns">
                        <label for="billingCity">City</label>
                        <input class="u-full-width" type="text" placeholder="City" id="billingCity" name="billingCity">
                    </div>
                </div>
                <h3> <b>3</b> Review Cart</h3>
                <div class="row">
                    <table class="u-full-width">
                        <thead>
                            <tr>
                                <th>Item</th>
                                <th>Price ($)</th>
                                <th>Quantity</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <% ArrayList<TransactionItem> cartList = (ArrayList<TransactionItem>) session.getAttribute("cartList");
                            BigDecimal subTotal = new BigDecimal(0);
                            for (int i = 0; i < cartList.size(); i++) {
                                int cartId = cartList.get(i).getCartId();
                                String productName = cartList.get(i).getProductName();;
                                BigDecimal price = cartList.get(i).getPrice();
                                int quantity = cartList.get(i).getQuantity();
                                BigDecimal total = cartList.get(i).getSubtotal();
                                subTotal = subTotal.add(total);
                        %>
                        <tbody>
                            <tr>
                                <td><%= productName%></td>
                                <td><span><%= price%></span></td>
                                <td><%= quantity%></td>
                                <td><%= total%></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <h5 style="font-weight:bold; text-align: right">Total: $<span style="font-weight: normal"><%= subTotal%></span></h5>
                </div>
                <button type="reset" style="float:left" id="backToCart">Back to Cart</button>
                <button type="submit" style="float:right" id="placeOrder">Place Order</button>
            </form>

        </div>
        <div class="footer">

        </div>
        <script src="js/jquery.js"></script>
        <script>
            $(document).ready(function() {
                $('#nav-bar').addClass("sticky");
            });
            $(window).scroll(function() {
                $('#nav-bar').addClass("sticky");
            });
            $(".remove").on('click', function(event) {
                $(this).parent().parent().remove();
            });
            $("#backToCart").on('click', function(event) {
                window.location.href = 'cart.html'
            });
        </script>
    </body>
</html>
