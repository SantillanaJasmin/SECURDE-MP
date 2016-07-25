<%-- 
    Document   : SignIn
    Created on : Mar 22, 2015, 6:38:22 PM
    Author     : Jasmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign In</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
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

        <br/><br/><br/><br/><br/>
        
        <div align="center">
            <p style="font-size: 30px; font-weight:bold;"> &nbsp Sign In</p>
            <span style="color: red;">${message}</span><br><br>
            <form action="" method="post">   
                <div class="form-group">
                    <input type="text" name="email" class="form-control" placeholder="Username" style="width:300px;"><br/>
                    <input type="password" name="password" class="form-control" placeholder="Password" style="width:300px;"><br/>
                </div>
                <input type="submit" class="btn btn-primary btn-lg" value="Sign In"/> 
            </form>
        </div>  
               
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
