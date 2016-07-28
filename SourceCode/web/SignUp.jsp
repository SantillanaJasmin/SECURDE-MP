<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Sign Up</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="starter-template.css" rel="stylesheet">

        <style type="text/css">
            .navbar .nav > li > a {
                font-size: 16px;
                color: #FFFFFF; 
            }

            .navbar .nav > li > a:hover {
                color: #C10E1F;  
            }

            #nav-name {
                font-size: 25px;
                color: #FFFFFF; 
            }
        </style>
    </head>

    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
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
        <div class="container" style="width: 500px; margin-top: 50px;">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title" align="center">Create your own Profile</h3>
                </div>
                <div class="panel-body" align="center">
                    <span style="color: red;">${message}</span><br><br>
                    <div>
                        <form action="" method="post">   
                            <div class="form-group"> 
                                <input type="text" name="firstname" placeholder="First Name" class="form-control" style="width:369px;"><br/>
                                <input type="text" name="middlename" placeholder="Middle Name" class="form-control" style="width:369px;"><br/>
                                <input type="text" name="lastname" placeholder="Last Name" class="form-control" style="width:369px;"><br/>
                                <input type="text" name="username" placeholder="Username" class="form-control" style="width:369px;" required><br/>
                                <input type="password" name="password" placeholder="Password" class="form-control" style="width:369px;"  required><br/>
                                <input type="password" name="verifypassword" placeholder="Confirm Password" class="form-control" style="width:369px;" required="">
                            </div>
                            <input type="submit" class="btn btn-primary btn-lg" value="Sign Up"/> 
                        </form>
                    </div>   
                </div>
            </div>
        </div>


        <hr>

        <footer>
            <p>&copy; 2016 Company, Inc.</p>
        </footer>
    </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>

