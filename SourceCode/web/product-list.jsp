<%--
    Document   : product-list
    Created on : Aug 14, 2016, 4:17:02 AM
    Author     : Jasmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
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
                    <li><a href="product-list.html">Product List</a></li>
                    <li><a href="add-product.html">Add Product</a></li>
                </ul>
            </div>
            <div id="account">
                <ul>
                    <li><a href="catalog.html">Log Out</a></li>
                </ul>
            </div>
        </div>
        <!-- END NAV-->
        <div class="wrapper" style="display: block">
            <h1>Product List</h1>
            <div class="row">
                <table class="u-full-width">
                    <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Type</th>
                            <th>Description</th>
                            <th>Price ($)</th>
                            <th>Image</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Doc Marten's</td>
                            <td>Boots</td>
                            <td>Classic 1460's. Trendy yet comfortable.</td>
                            <td>50.00</td>
                            <td><div class="img-prev" style="background-image:url(images/boots.png)"></div></td>
                            <td>
                                <span class="edit"><a href ="edit-product.html">Edit</a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>Yeezy Boost</td>
                            <td>Shoes</td>
                            <td>Get that casual or sporty look. Thank you Kanye.</td>
                            <td>25.00</td>
                            <td><div class="img-prev" style="background-image:url(images/shoes.png)"></div></td>
                            <td>
                                <span class="edit"><a href ="edit-product.html">Edit</a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>Muji Slippers</td>
                            <td>Slippers</td>
                            <td>Feel like you're stepping on clouds.</td>
                            <td>30.00</td>
                            <td><div class="img-prev" style="background-image:url(images/slippers.png)"></div></td>
                            <td>
                                <span class="edit"><a href ="edit-product.html">Edit</a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>Birkenstock Sandals</td>
                            <td>Sandals</td>
                            <td>For when your toes want to see the sun.</td>
                            <td>20.00</td>
                            <td><div class="img-prev" style="background-image:url(images/sandals.png)"></div></td>
                            <td>
                                <span class="edit"><a href ="edit-product.html">Edit</a></span>
                            </td>
                        </tr>
                    </tbody>
                </table>
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
            $(".edit").on('click', function(event) {

            });
        </script>
    </body>
</html>
