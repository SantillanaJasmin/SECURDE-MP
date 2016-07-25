<%-- 
    Document   : SignUp
    Created on : Mar 22, 2015, 6:36:46 PM
    Author     : Jasmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link href="css/bootstrap-theme.css" rel="stylesheet">
        <link href="css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src = "js/jquery.js"></script>
        <style type="text/css">    
            .alert 
            {
                padding: 8px 35px 8px 14px;
                margin-bottom: 18px;
                length: 369px;
                text-shadow: 1px 0 rgba(255, 255, 255, 0.5);
                background-color: #fcf8e3;
                border: 1px solid #fbeed5;
                -webkit-border-radius: 4px;
                -moz-border-radius: 4px;
                border-radius: 4px;
                color: #c09853;
            }
        </style>    
    </head>
    
    <body>
        <div class="navbar-wrapper">
            <div class="container">
                <nav class="navbar navbar-inverse navbar-fixed-top">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="#">Project name</a>
                        </div>
                        <div id="navbar" class="collapse navbar-collapse">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Home</a></li>
                                <li><a href="#about">About</a></li>
                                <li><a href="#contact">Contact</a></li>
                            </ul>
                        </div><!--/.nav-collapse -->
                    </div>
                </nav>
            </div>
        </div>

        <br/><br/><br/>
        
        <div align="center">
            <br><br><br>
            <p style="font-size: 30px; font-weight:bold;"> &nbsp Create your own Profile</p>
            <span style="color: red;">${message}</span><br><br>
            <div>
                <form action="" method="post">   
                    <div class="form-group"> 
                        <input type="text" name="firstname" placeholder="First Name" class="form-control" style="width:369px;"><br/>
                        <input type="text" name="middlename" placeholder="Middle Name" class="form-control" style="width:369px;"><br/>
                        <input type="text" name="lastname" placeholder="Last Name" class="form-control" style="width:369px;"><br/>
                        <input type="text" name="username" placeholder="Username" class="form-control" style="width:369px;"><br/>
                        <input type="text" name="email" placeholder="Email" class="form-control" style="width:369px;"><br/>
                        <input type="password" name="password" placeholder="Password" class="form-control" style="width:369px;"><br/>
                        <input type="password" name="verifypassword" placeholder="Confirm Password" class="form-control" style="width:369px;">
                    </div>
                    <input type="submit" class="btn btn-primary btn-lg" value="Sign Up"/> 
                </form>
            </div>   
            <br><br>
            <p>Already have an account? <a href="Login.jsp">Login here</a></p>
        </div>
            
            <!-- Bootstrap core JavaScript
            ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
