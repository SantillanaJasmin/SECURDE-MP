<%@page import="java.lang.String"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Product</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/skeleton.css">
        <link rel="stylesheet" href="css/edit-product-style.css" />
        
        <link rel="stylesheet" href="css/cart-style.css" />
        <link rel="stylesheet" href="css/product-list-style.css" />
        <link rel="stylesheet" href="css/edit-product-style.css" />
        <link rel="stylesheet" href="css/checkout-style.css" />
        <link rel="stylesheet" href="css/create-account-style.css" />
    </head>
    <body>
        <script src="js/jquery.js"></script>
        <script src="js/create-account.js"></script>
        <div id="confirm-password-overlay"></div>
        <div id="confirm-password-box">
            <form action="CheckAccessServlet" method="POST">
                <h4>Confirm password to continue</h4>
                <input placeholder="Password" name = "userPassword" id="adminPassword" name="adminPassword" type="password" id="adminPassword"/>
                <button type="submit" name="action" id = "authPassConfirm">Confirm</button>
            </form>
        </div>
        <!-- START NAV-->
        <div id="nav-bar">
            <div id="talaria-logo">
                TALARIA
            </div>
            <div id="links">
                <ul>
                    <li><a href="product-list.jsp">Product List</a></li>
                    <li><a href="add-product.jsp">Add Product</a></li>
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
            <jsp:declaration>
                String name = "";
                String desc = "";
                String price = "";
            </jsp:declaration>

            <jsp:scriptlet>
                name = request.getParameter("itemName");
                desc = request.getParameter("itemDescription");
                price = request.getParameter("itemPrice");
            </jsp:scriptlet>
            <h1>Edit Product</h1>
            <h3 class="product-name"><jsp:expression>name</jsp:expression></h3>
                <form action="EditProductServlet" method="POST" onsubmit="return checkSubmit();">
                    <div class="row">
                        <div class="eight columns">
                            <label for="productName">Product Name</label>
                            <input class="u-full-width" type="text" placeholder="Product Name" name="productName" id="productName" value="<jsp:expression>name</jsp:expression>" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="eight columns">
                            <label for="productName">Product Description</label>
                            <input class="u-full-width" type="text" placeholder="Descripion" name="productDesc" id="productPrice" value="<jsp:expression>desc</jsp:expression>">
                        </div>
                    </div>
                    <div class="row">
                        <div class="six columns">
                            <label for="productName">Product Price ($)</label>
                            <input class="u-full-width" type="number" min="1" placeholder="Price" name="productPrice" id="productPrice" value="<jsp:expression>price</jsp:expression>">
                    </div>
                </div>
                    <input type="hidden" name="viewid" value="product-list.jsp">
                <!--<input type="file" name="pic" accept="image/*">-->
                <button type="button">Cancel</button>
                <button type="submit" id="saveChanges">Save Changes</button>
            </form>
        </div>
        <div class="footer">

        </div>
    </body>
</html>
