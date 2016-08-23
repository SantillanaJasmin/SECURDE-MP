<%-- 
    Document   : view-sales
    Created on : Aug 23, 2016, 10:37:00 AM
    Author     : Jasmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Sales</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/skeleton.css">
        <link rel="stylesheet" href="css/cart-style.css" />
        <link rel="stylesheet" href="css/product-list-style.css" />
    </head>
    <body>
        <div id="nav-bar">
            <div id="talaria-logo">
                TALARIA
            </div>
            <div id="links">
                <ul>
                    <li><a href="view-sales.html">Financial Report</a></li>
                </ul>
            </div>
            <div id="account">
                <ul>
                    <li><a href="catalog.html">Log Out</a></li>
                </ul>
            </div>
        </div>
        <!-- END NAV-->
        <div class="wrapper" style="display: block; min-height: 600px">
          <br />
            <h1>Financial Report</h1>
            <div class="row">
                <table class="u-full-width">
                    <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Price ($)</th>
                            <th>Items Sold</th>
                            <th>Total Sales ($)</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                      <tr>
                          <td>Birkenstock Sandals</td>
                          <td>For when your toes want to see the sun.</td>
                          <td>20.00</td>
                          <td>5</td>
                          <td>100</td>
                      </tr>
                      <tr>
                          <td>Birkenstock Sandals</td>
                          <td>For when your toes want to see the sun.</td>
                          <td>20.00</td>
                          <td>5</td>
                          <td>100</td>
                      </tr>
                      <tr>
                          <td>Birkenstock Sandals</td>
                          <td>For when your toes want to see the sun.</td>
                          <td>20.00</td>
                          <td>5</td>
                          <td>100</td>
                      </tr>
                      <tr>
                            <td>Birkenstock Sandals</td>
                            <td>For when your toes want to see the sun.</td>
                            <td>20.00</td>
                            <td>5</td>
                            <td>100</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="footer" style="position: relative; bottom: 0;">
        </div>
        <script src="js/jquery.js"></script>
        <script>
            $(document).ready(function() {
                $('#nav-bar').addClass("sticky");
            });
            $(window).scroll(function() {
                $('#nav-bar').addClass("sticky");
            });
            // $(".edit").on('click', function(event) {
            //
            // });
        </script>
    </body>
</html>
