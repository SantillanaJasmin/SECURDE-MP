<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Talaria</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="starter-template.css" rel="stylesheet">

        <style type="text/css">
            body {
                background-color: #D7E1EB;
            }

            .navbar {
                background-color: transparent;
                background: transparent;
                border-color: transparent; 
            } 

            .navbar .nav > li > a {
                font-size: 16px;
                color: #FFFFFF; 
            }

            .navbar .nav > li > a:hover {
                color: #74B3E6; 
            }

            #nav-name {
                font-size: 25px;
                color: #FFFFFF; 
            }

            .jumbotron {
                padding-top: 80px;
                background-image: url(http://www.skechers.com.my/admin/album/1417940696IMG_9297-M.jpg);
                background-repeat: no-repeat;
                background-size: 100%;
            }

            #front {
                background-color: rgba(1, 1, 1, 0.5);
                height: 250px;
                color: white;
            }

            .btn {
                background-color: #0268A6;
            }
        </style>

        <script type="text/javascript">
//            $('#su').click(function(e){
//                    e.preventDefault();
//                    $('#signinodal').modal('hide').on('hidden.bs.modal', function (e) {
//                        $('#registermodal').modal('show');
//                                $(this).off('hidden.bs.modal'); // Remove the 'on' event binding
//                        });
            $('#su').click(function() {
                $('#signinmodal').modal('hide');
                $('#signinodal').on('hidden', function() {
                    // Load up a new modal...
                    $('#registermodal).modal('show')
                });
            });
        </script>
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
                        <li><a href="#" data-toggle="modal" data-target="#signinmodal"><span class="glyphicon glyphicon-user"></span>My Account</a></li>
                        <!-- Register Modal -->
                        <div class="modal fade" id="signinmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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
                                                <span class="pull-right"><a href="#" id="su" data-toggle="modal" data-target="#registermodal">Create an account</a></span>

                                                <div class="modal fade" id="registermodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                    <div class="modal-dialog" role="document">
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
                                                                                <input type="text" name="username" placeholder="Username" class="form-control" style="width:369px;"><br/>
                                                                                <input type="text" name="email" placeholder="Email" class="form-control" style="width:369px;"><br/>
                                                                                <input type="password" name="password" placeholder="Password" class="form-control" style="width:369px;"><br/>
                                                                                <input type="password" name="verifypassword" placeholder="Confirm Password" class="form-control" style="width:369px;">
                                                                            </div>
                                                                            <input type="submit" class="btn btn-primary btn-lg" value="Sign Up"/> 
                                                                        </form>
                                                                    </div>   
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
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
        <!-- Main jumbotron for a primary marketing message or call to action -->
        <div class="jumbotron">
            <div class="container" id="front">
                <h1>Hello, world!</h1>
                <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
                <!--<p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>-->
            </div>
        </div>

        <div class="container">
            <!-- Example row of columns -->
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="images/boots.jpg" alt="...">
                        <div class="caption">
                            <h3>Boots</h3>
                            <p>...</p>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="images/shoes.jpg" alt="...">
                        <div class="caption">
                            <h3>Shoes</h3>
                            <p>...</p>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="images/sandals.jpg" alt="...">
                        <div class="caption">
                            <h3>Sandals</h3>
                            <p>...</p>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="images/slippers.jpg" alt="...">
                        <div class="caption">
                            <h3>Slippers</h3>
                            <p>...</p>
                            <a href="#" class="btn btn-primary" role="button">Button</a>
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

