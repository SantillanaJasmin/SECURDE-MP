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
            
            .navbar {
                background-color: transparent;
                background: transparent;
                border-color: transparent; 
            } 

            .navbar .nav > li > a {
                font-size: 16px;
                color: #000000; 
            }

            .navbar .nav > li > a:hover {
                color: #0268A6; 
            }

            #nav-name {
                font-size: 25px;
                color: #000000; 
            }
        </style>    
    </head>
    
    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#" id="nav-name">Talaria</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="#"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                        <li><a href="#about"><span class="glyphicon glyphicon-info-sign"></span> About</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#" data-toggle="modal" data-target="#registermodal"><span class="glyphicon glyphicon-user"></span>My Account</a></li>
                        <!-- Register Modal -->
                        <div class="modal fade" id="registermodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">Sign In</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form class="form-signin">
                                            <div class="form-group">
                                                <input type="text" class="form-control input-lg" placeholder="Username">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control input-lg" placeholder="Password">
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-primary btn-lg btn-block">Sign In</button>
                                                <br>
                                                <span class="pull-right"><a href="SignUp.jsp">Create an account</a></span>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ul>
                </div>
            </div>
        </nav>

        <br/><br/><br/>
        
        <div align="center">
            <br><br>
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
        </div>
            
            <!-- Bootstrap core JavaScript
            ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
