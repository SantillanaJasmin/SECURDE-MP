<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Item Name</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/skeleton.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/view-item-style.css" />
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
        <div class="wrapper">
            <div class="row">
                <div class="six columns" id="item-description">
                    <div class="item-image" style="background-image: url(images/boots.png)"></div>
                </div>
                <div class="six columns" id="purchase-info">
                    <h3 class="item-name">Shoe</h3>
                    <h4 class="item-price">$10.00</h4>
                    <!-- <div class="order-quantity">
                      <div class="button-minus">-</div>
                      <input type="number" name="quantity" value="0">
                      <div class="button-plus">+</div>
                    </div> -->
                    <form>
                        How many would you like to order?
                        <input type="number" name="quantity" min="1"><br />
                        <button type="submit">Add to Cart</button>
                    </form>
                </div>
            </div>
            <div class="review-box">
                <h3>Reviews</h3>
                <div>
                    <h5 class="reviewer"><span>Jasmin Santillana</span> says</h5>
                    <p class="review">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim!!
                    </p>
                </div>
                <div>
                    <h5 class="reviewer"><span>Stephanie Dy</span> says</h5>
                    <p class="review">
                        Consectetur adipiscing elit, sed do eiusmod tempor! :D
                    </p>
                </div>
                <div>
                    <h5 class="reviewer"><span>Hanna Sha</span> says</h5>
                    <p class="review">
                        Amazing! Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    </p>
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
        </script>
    </body>
</html>


