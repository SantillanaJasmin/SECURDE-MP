<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account List</title>
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
                    <li><a href="account-list.jsp">Account List</a></li>
                    <li><a href="create-account.jsp">Create Account</a></li>
                </ul>
            </div>
            <div id="account">
                <ul>
                    <li><a href="catalog.jsp">Log Out</a></li>
                </ul>
            </div>
        </div>
        <!-- END NAV-->
        <div class="wrapper" style="display: block;">
            <h1>Account List</h1>
            <div class="row">
                <table class="u-full-width">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Type</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Amelia J. Pond</td>
                            <td>amypond</td>
                            <td>amelia.pond@gmail.com</td>
                            <td>Accounting Manager</td>
                            <td>
                                <span class="edit"><a href="edit-account.jsp">Edit</a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>Jasmin Santillana</td>
                            <td>jasminsantillana</td>
                            <td>jasmin.santillana@gmail.com</td>
                            <td>Product Manager</td>
                            <td>
                                <span class="edit"><a href="edit-account.jsp">Edit</a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>Hanna Sha</td>
                            <td>hannasha</td>
                            <td>hanna.sha@gmail.com</td>
                            <td>Product Manager</td>
                            <td>
                                <span class="edit"><a href="edit-account.html">Edit</a></span>
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
