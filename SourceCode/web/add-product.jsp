<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/skeleton.css">
        <link rel="stylesheet" href="css/cart-style.css" />
        <link rel="stylesheet" href="css/product-list-style.css" />
        <link rel="stylesheet" href="css/edit-product-style.css" />
    </head>
    <body>
        <div id="confirm-password-overlay"></div>
        <div id="confirm-password-box">
            <h4>Confirm password to continue</h4>
            <input placeholder="Password" name = "userPassword" id="adminPassword" name="adminPassword" type="password" id="adminPassword"/>
            <button type="submit" name="action" id = "authPassConfirm">Confirm</button>
        </div>
        <!-- START NAV-->
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
            <h1>Add Product</h1>
            <form method= "post" onsubmit="return checkSubmit();">
                <div class="row">
                    <div class="eight columns">
                        <label for="productName">Product Name</label>
                        <input class="u-full-width" type="text" placeholder="Product Name" id="productName">
                    </div>
                </div>
                <div class="row">
                    <div class="eight columns">
                        <label for="productName">Product Description</label>
                        <input class="u-full-width" type="text" placeholder="Descripion" id="productPrice">
                    </div>
                </div>
                <div class="row">
                    <div class="six columns">
                        <label for="productName">Product Price ($)</label>
                        <input class="u-full-width" type="number" min="1" placeholder="Price" id="productPrice">
                    </div>
                </div>
                <input type="file" name="pic" accept="image/*">
                <br />
                <button type="submit" id="addProduct">Add Product</button>
            </form>
        </div>
        <div class="footer">

        </div>
        <script src="js/jquery.js"></script>
        <script src="js/edit-product.js"></script>
    </body>
</html>
