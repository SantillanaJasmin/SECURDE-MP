<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/skeleton.css">
        <link rel="stylesheet" href="css/cart-style.css" />

        <link rel="stylesheet" href="css/edit-product-style.css" />
        <link rel="stylesheet" href="css/checkout-style.css" />
        <link rel="stylesheet" href="css/create-account-style.css" />
        
        <script type="text/javascript">
            function checkForm(form)
            {
                if (form.username.value === "") {
                    alert("Error: Username cannot be blank!");
                    form.username.focus();
                    return false;
                }
                re = /^\w+$/;
                if (!re.test(form.username.value)) {
                    alert("Error: Username must contain only letters, numbers and underscores!");
                    form.username.focus();
                    return false;
                }

                if (form.temporaryPassword1.value !== "" && form.temporaryPassword1.value === form.temporaryPassword2.value) {
                    if (form.temporaryPassword1.value.length < 8) {
                        alert("Error: Password must contain at least eight characters!");
                        form.temporaryPassword1.focus();
                        return false;
                    }
                    if (form.temporaryPassword1.value === form.username.value) {
                        alert("Error: Password must be different from Username!");
                        form.temporaryPassword1.focus();
                        return false;
                    }
                    re = /[0-9]/;
                    if (!re.test(form.temporaryPassword1.value)) {
                        alert("Error: password must contain at least one number (0-9)!");
                        form.temporaryPassword1.focus();
                        return false;
                    }
                    re = /[a-z]/;
                    if (!re.test(form.temporaryPassword1.value)) {
                        alert("Error: password must contain at least one lowercase letter (a-z)!");
                        form.temporaryPassword1.focus();
                        return false;
                    }
                    re = /[A-Z]/;
                    if (!re.test(form.temporaryPassword1.value)) {
                        alert("Error: password must contain at least one uppercase letter (A-Z)!");
                        form.temporaryPassword1.focus();
                        return false;
                    }
                } else {
                    alert("Passwords do not match.");
                    form.temporaryPassword1.focus();
                    return false;
                }
//                alert("Your account has been created");
                return true;
            }
        </script>
    </head>
    <body>
        <script src="js/jquery.js"></script>
        <script src="js/create-account.js"></script>
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
            $("#backToCart").on('click', function(event) {
                window.location.href = 'cart.html'
            });
        </script>
<!--        <div id="confirm-password-overlay"></div>
        <div id="confirm-password-box">
            <h4>Confirm password to continue</h4>
            <input placeholder="Password" name = "userPassword" id="adminPassword" name="adminPassword" type="password" id="adminPassword"/>
            <button type="submit" name="action" id = "authPassConfirm">Confirm</button>
        </div>-->
        <!-- START NAV-->
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
                    <li><a href="/">Log Out</a></li>
                </ul>
            </div>
        </div>
        <!-- END NAV-->
        <div class="wrapper" style="display: block">
            <form action="AddAccountServlet" method="POST" onsubmit="return checkForm(this);">
                <h1>Create Account</h1>
                <div class="row">
                    <div class="five columns">
                        <label for="firstName">First Name</label>
                        <input class="u-full-width" type="text" placeholder="First Name" id="firstName" name="firstName">
                    </div>
                    <div class="two columns">
                        <label for="middleInitial">Middle Initial</label>
                        <input class="u-full-width" type="text" placeholder="Middle Initial" id="middleInitial" name="middleInitial">
                    </div>
                    <div class="five columns">
                        <label for="lasttName">Last Name</label>
                        <input class="u-full-width" type="text" placeholder="Last Name" id="lastName" name="lastName">
                    </div>
                </div>
                <div class="row">
                    <div class="six columns">
                        <label for="email">Email Address</label>
                        <input class="u-full-width" type="email" placeholder="Email Address" id="email" name="email">
                    </div>
                </div>
                <div class="row">
                    <div class="six columns">
                        <label for="username">Username</label>
                        <input class="u-full-width" type="text" placeholder="Username" id="username" name="username">
                    </div>
                </div>
                <div class="row">
                    <div class="six columns">
                        <label for="temporaryPassword1">Temporary Password</label>
                        <input class="u-full-width" type="password" placeholder="Password" id="temporaryPassword1" name="temporaryPassword1">
                    </div>
                    <div class="six columns">
                        <label for="temporaryPassword2">Confirm Temporary Password</label>
                        <input class="u-full-width" type="password" placeholder="Confirm Password" id="temporaryPassword2" name="temporaryPassword2">
                    </div>
                </div>
                <div class="row">
                    <div class="five columns">
                        <label for="accountTypet">Account Type</label>
                        <select class="u-full-width" id="accountType" name="accountType">
                            <option value="ProductManager">Product Manager</option>
                            <option value="AccountingManager">Accounting Manager</option>
                        </select>
                    </div>
                </div>
                <button type="submit" style="float:left" id="createAccountButton">Create Account</button>
            </form>

        </div>
        <div class="footer">

        </div>
    </body>
</html>
