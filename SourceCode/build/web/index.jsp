<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Talaria</title>

        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
              rel="stylesheet" type="text/css">
        <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
              rel="stylesheet" type="text/css">
        <link href="css/index.css" rel="stylesheet" type="text/css">
    </head>

    <body>
        <div class="cover">
            <div class="navbar">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"><span>Talaria</span></a>
                    </div>
                    <div class="collapse navbar-collapse" id="navbar-ex-collapse">
                        <ul class="nav navbar-nav">
                            <li><a href="#"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                            <li><a href="#about"><span class="glyphicon glyphicon-info-sign"></span> About</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <!--<li><a><span class="glyphicon glyphicon-user"></span>My Account</a></li>-->
                            <form class="navbar-form navbar-right" method="post" action="SignInServlet">
                                <div class="form-group">
                                    <input type="text" placeholder="Username" name="username" class="form-control">
                                    <input type="password" placeholder="Password" name="password" class="form-control">
                                </div>
                                <input type="submit" class="btn btn-primary" value="Sign In">
                            </form>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="cover-image" style="background-image: url(images/clothingstore.jpg);"></div>
            <div class="container">
                <br>
                <div class="row">
                    <div class="col-md-6">
                        <img src="https://unsplash.imgix.net/photo-1422728221357-57980993ea99?w=1024&amp;q=50&amp;fm=jpg&amp;s=b4a34018d745e33048bcfc326cb9907b"
                             class="img-responsive img-thumbnail">
                    </div>
                    <div class="col-md-6 text-left" id="jumbotron-text">
                        <h1>Register</h1>
                        <h3>Create an account for free!</h3>
                        <form method="post" action="SignUpServlet">
                            <div class="form-group">
                                <input type="text" name="firstname" placeholder="First Name" class="form-control"
                                       style="width:369px;">
                                <br>
                                <input type="text" name="middlename" placeholder="Middle Initial" class="form-control"
                                       style="width:369px;">
                                <br>
                                <input type="text" name="lastname" placeholder="Last Name" class="form-control"
                                       style="width:369px;">
                                <br>
                                <input type="text" name="username" placeholder="Username" class="form-control"
                                       style="width:369px;" required="">
                                <br>
                                <input type="text" name="email" placeholder="Email" class="form-control"
                                       style="width:369px;" required="">
                                <br>
                                <input type="password" name="password" placeholder="Password" class="form-control"
                                       style="width:369px;" required="">
                                <br>
                                <input type="password" name="verifypassword" placeholder="Confirm Password"
                                       class="form-control" style="width:369px;" required="">
                            </div>
                            <input type="submit" class="btn btn-primary btn-lg" value="Sign Up">
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <img src="images/boots.jpg" class="img-responsive">
                        <h2>Boots</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                    <div class="col-md-3">
                        <img src="images/sandals.jpg" class="img-responsive">
                        <h2>Sandals</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                    <div class="col-md-3">
                        <img src="images/shoes.jpg" class="img-responsive img-rounded">
                        <h2>Shoes</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                    <div class="col-md-3">
                        <img src="images/slippers.jpg" class="img-responsive">
                        <h2>Slippers</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisici elit,
                            <br>sed eiusmod tempor incidunt ut labore et dolore magna aliqua.
                            <br>Ut enim ad minim veniam, quis nostrud</p>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>