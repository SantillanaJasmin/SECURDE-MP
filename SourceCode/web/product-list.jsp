<%--
    Document   : product-list
    Created on : Aug 14, 2016, 4:17:02 AM
    Author     : Jasmin
--%>
<%@page import="java.math.BigDecimal"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.DatabaseConnection"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.StringWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <%
            DatabaseConnection dc = new DatabaseConnection();
            Connection conn = null;
            PreparedStatement pst = null;
            Statement stmt = null;
            ResultSet rs;
            ArrayList<Product> productList = new ArrayList();

            String prodname = null;
            int category = 0;
            String prodcategory = null;
            String proddesc = null;
            double prodprice = 0;
            String price = null;

            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a Connectiontion
            conn = (Connection) dc.getConnection();

            // count number of timeslot
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM product;");

            while (rs.next()) {
                prodname = rs.getString("product_name");
                category = rs.getInt("product_category");

                switch (category) {
                    case 1: {
                        prodcategory = "Boots";
                        break;
                    }
                    case 2: {
                        prodcategory = "Shoes";
                        break;
                    }
                    case 3: {
                        prodcategory = "Sandals";
                        break;
                    }
                    case 4: {
                        prodcategory = "Slippers";
                        break;
                    }
                }

                proddesc = rs.getString("product_desc");
                prodprice = rs.getDouble("product_price");

                Product prod = new Product();
                prod.setProductName(prodname);
                prod.setProductCategory(prodcategory);
                prod.setProductDescription(proddesc);
                prod.setProductPrice(BigDecimal.valueOf(prodprice));

                productList.add(prod);
                request.setAttribute("productList", productList);
            }
        %>
        <div class="wrapper" style="display: block">
            <h1>Product List</h1>
            <div class="row">
                <span style="color: red;">${message}</span>
                <table class="u-full-width">
                    <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Type</th>
                            <th>Description</th>
                            <th>Price ($)</th>
                            <!--<th>Image</th>-->
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int ctr = 0;%>
                        <c:forEach var="product" items="${productList}">
                            <tr>
                                <form action="edit-product.jsp" method="POST">
                                    <td>${product.productName}</td>
                                    <input type="hidden" name="itemName" value="${product.productName}">
                                    <td>${product.productCategory}</td>
                                    <td>${product.productDescription}</td>
                                    <input type="hidden" name="itemDescription" value="${product.productDescription}">
                                    <td>${product.productPrice}</td>
                                    <input type="hidden" name="itemPrice" value="${product.productPrice}">
                                    <td><span><input type="submit" class="edit" value="Edit"></span></td>
                                </form>
                                <td>
                                    <form action="delete-product.jsp" method="POST">
                                        <input type="hidden" name="itemName" value="${product.productName}">
                                        <input type="hidden" name="itemDescription" value="${product.productDescription}">
                                        <input type="hidden" name="itemPrice" value="${product.productPrice}">
                                        <td><span><input type="submit" class="edit" value="Delete"></span></td>
                                    </form>
                                </td>     
                            </tr>
                        <% ctr++;%>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
<!--        <div class="footer">

        </div>-->
    </body>
</html>
