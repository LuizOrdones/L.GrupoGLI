<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='pt-BR'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FlorenceSyten|Login</title>
<link rel="stylesheet" type="text/css" href="css/estilos.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/metisMenu.min.css" />
<link rel="stylesheet" type="text/css" href="css/sb-admin-2.css" />
<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Por favor, faça o Login.</h3>
                    </div>
                    <div class="panel-body">
                        <form action="efetuaLogin" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input type="text" name="login" />
                                </div>
                                <div class="form-group">
                                    <input type="password" name="senha" />
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Lembrar
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" value="Login"></input>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="js/jquery.min.js"></script>
    <script src="js/js/bootstrap.min.js"></script>
    <script src="js/metisMenu.min.js"></script>
    <script src="js/sb-admin-2.js"></script>
</body>
</html>