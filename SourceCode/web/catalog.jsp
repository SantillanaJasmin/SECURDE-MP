<%-- 
    Document   : catalog
    Created on : Aug 2, 2016, 1:33:00 PM
    Author     : Jasmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/skeleton.css">
        <link rel="stylesheet" href="css/style.css">
        <title>Catalog</title>
    </head>
    <body>
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
                        <li><a href="cart.jsp">Cart (<span>${cartSize}</span>)</a></li>
                        
<!--                    <li>
                        <form action="cart.jsp" method="POST">
                            <input type="hidden" name="cartList" value="${cartList}">
                            <input type="submit" value="Cart (${cartSize})" style="color: white; padding: 0; border: none; background: none;">
                        </form>
                    </li> -->
                    <li><a href="catalog.html">Account</a></li>
                    <li><a href="index.jsp">Log Out</a></li>
                </ul>
            </div>
        </div>
        <div class="header">
        </div>
        <div class="wrapper">
            <div class="row">
                <% int ctr = 0;%>
                <c:forEach var="product" items="${productList}">
                    <% if (ctr == 3) { %>
                </div>
                <div class="row">
                    <% ctr = 0;
                        }%>
                    <div class="four columns" style="background-image:url(images/sandals.png)">
                        <div class="item-info">
                            <form action="view-item.jsp" method="POST">
                                <a class="item-meta">
                                <p>
                                    <span class="item-name">${product.productName}</span>
                                    <input type="hidden" name="itemName" value="${product.productName}">
                                    <br />
                                    <span class="item-price">$${product.productPrice}</span>
                                    <input type="hidden" name="itemPrice" value="${product.productPrice}">
                                </p>
<!--                                <div class="view-item-button">
                                    <span>View</span>
                                </div>-->
                                <input type="submit" value="View" style="color: white;">
                                </a>
                            </form>
                        </div>
                    </div>
                    <% ctr++; %>
                </c:forEach>
            </div>
        </div>

        <div class="footer">

        </div>
        <script src="js/jquery.js"></script>
        <script>
            $(window).scroll(function() {
                if ($(this).scrollTop() > 1) {
                    $('#nav-bar').addClass("sticky");
                }
                else {
                    $('#nav-bar').removeClass("sticky");
                }
            });
        </script>
    </body>
</html>

