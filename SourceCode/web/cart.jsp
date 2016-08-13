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
                    <li><a href="/index.html">Home</a></li>
                    <li><a href="/catalog.html">Catalog</a></li>
                </ul>
            </div>
            <div id="account">
                <ul>
                    <li><a href="/index.html">Cart (<span>0</span>)</a></li>
                    <li><a href="/catalog.html">Account</a></li>
                    <li><a href="/catalog.html">Log Out</a></li>
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
                            <th>Total</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Shoe</td>
                            <td><span>5.00</span></td>
                            <td>4</td>
                            <td>20.00</td>
                            <td>
                                <span class="remove">Remove</span>
                            </td>
                        </tr>
                        <tr>
                            <td>Boots</td>
                            <td>10.00</td>
                            <td>3</td>
                            <td>30.00</td>
                            <td>
                                <span class="remove">Remove</span>
                            </td>
                        </tr>
                        <tr>
                            <td>Sandals</td>
                            <td>7.00</td>
                            <td>3</td>
                            <td>21.00</td>
                            <td>
                                <span class="remove">Remove</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div style="float: right">
                    <h5 style="font-weight:bold; text-align: right">Total: $<span style="font-weight: normal">71.00</span></h5>

                    <button type="submit">Proceed to Checkout</button>
                </div>


            </div>
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
        </script>
    </body>
</html>