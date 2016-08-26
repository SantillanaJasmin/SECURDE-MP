<%@page import="model.Name"%>
<%@page import="model.User"%>
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
        <%
            DatabaseConnection dc = new DatabaseConnection();
            Connection conn = null;
            PreparedStatement pst = null;
            Statement stmt = null;
            ResultSet rs;
            ArrayList<User> userList = new ArrayList();

            String accountType = null;
            int userId = 0;
            String username = null;
            int account_type = 0;
            String name = null;
            String email = null;

            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open a Connectiontion
            conn = (Connection) dc.getConnection();

            // count number of timeslot
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM useraccount WHERE account_type_id = 2 OR account_type_id = 3;");

            while (rs.next()) {
                userId = rs.getInt("user_id");
                username = rs.getString("user_name");
                account_type = rs.getInt("account_type_id");
                Name accountname = new Name();
                accountname.setFirstName(rs.getString("first_name"));
                accountname.setMiddleInitial(rs.getString("middle_initial"));
                accountname.setLastName(rs.getString("last_name"));
                email = rs.getString("email");

                User user = new User();
                user.setUserId(userId);
                user.setUsername(username);
                user.setAccountType(account_type);
                user.setName(accountname);
                user.setEmail(email);

                userList.add(user);
                request.setAttribute("userList", userList);
            }
        %>
        <div class="wrapper" style="display: block;">
            <h1>Account List</h1>
            <div class="row">
                <span style="color: red;">${message}</span>
                <table class="u-full-width">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Type</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% int ctr = 0;%>
                        <c:forEach var="user" items="${userList}">
                            <tr>
                        <form action="edit-account.jsp" method="POST">
                            <td>${user.name}</td>
                            <input type="hidden" name="acctName" value="${user.name}">
                            <td>${user.username}</td>
                            <input type="hidden" name="username" value="${user.username}">
                            <td>${user.email}</td>
                            <input type="hidden" name="email" value="${user.email}">
                            <c:choose>
                                <c:when test="${user.accountType == 2}">
                                    <c:set var="acctType" value="Accounting Manager"/>
                                </c:when>
                                <c:when test="${user.accountType == 3}">
                                    <c:set var="acctType" value="Product Manager"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="acctType" value="Customer"/>
                                </c:otherwise>
                            </c:choose>
                            <td><c:out value="${acctType}"/></td>
<!--                            <td>
                                <span class="edit"><input type="submit" class="edit" value="Edit"></span>
                            </td>-->
                        </form>
                        <form action="delete-account.jsp" method="POST">
                            <input type="hidden" name="acctName" value="${user.name}">
                            <input type="hidden" name="username" value="${user.username}">
                            <input type="hidden" name="email" value="${user.email}">
                            <input type="hidden" name="acctType" value="${acctType}">
<!--                            <td>
                                <span class="edit"><input type="submit" class="edit" value="Delete"></span>
                            </td>-->
                        </form>
                        </tr>
                        <% ctr++;%>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!--        <div class="footer">
        
                </div>-->
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
