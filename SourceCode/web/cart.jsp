<%@page import="model.User"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="model.TransactionItem"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Name</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/skeleton.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/cart-style.css" />
    </head>
    <body>
        <!-- START NAV-->
        <div id="nav-bar">
            <div id="talaria-logo">
                TALARIA
            </div>
            <div id="links">
                <ul>
                    <li><a href="catalog.jsp">Home</a></li>
                    <li><a href="catalog.jsp">Catalog</a></li>
                </ul>
            </div>
            <div id="account">
                <ul>
                    <li><a href="cart.jsp">Cart (<span><%= session.getAttribute("cartSize")%></span>)</a></li>
                    <li><a href="catalog.html">Account</a></li>
                    <li><a href="index.jsp">Log Out</a></li>
                </ul>
            </div>
        </div>
        <!-- END NAV-->
        <div class="wrapper" style="display: block">
            <h1>Cart</h1>
            <div class="row">
                <table class="u-full-width">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Price ($)</th>
                            <th>Quantity</th>
                            <th>Total ($)</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>

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
                        <tr>
                    <form action="RemoveFromCartServlet" method="POST">
                        <td><%= productName%></td>
                        <td><span><%= price%></span></td>
                        <td><%= quantity%></td>
                        <td><%= total%></td>
                        <td>
                            <input type="hidden" name="cartId" value="<%= cartId%>">
                            <span><input type="submit" value="Remove"></span>
                        </td>
                    </form>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
                <div style="float: right">
                    <h5 style="font-weight:bold; text-align: right">Total: $<span style="font-weight: normal"><%= subTotal%></span></h5>

                    <%if (cartList.size() != 0) {%>
                    <button onclick="document.location.href='checkout.jsp'">Proceed to Checkout</button>
                    <%}%>
                </div>


            </div>
        </div>
        <div class="footer">

        </div>
        <script src="js/jquery.js"></script>
        <script>
            $(document).ready(function () {
                $('#nav-bar').addClass("sticky");
            });
            $(window).scroll(function () {
                $('#nav-bar').addClass("sticky");
            });
            $(".remove").on('click', function (event) {
                $(this).parent().parent().remove();
            });
        </script>
    </body>
</html>