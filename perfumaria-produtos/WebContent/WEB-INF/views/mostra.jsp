<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='pt-BR'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Produtos</title>
<link rel="stylesheet" type="text/css" href="css/estilos.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="css/metisMenu.min.css" />
<link rel="stylesheet" type="text/css" href="css/sb-admin-2.css" />
<link rel="stylesheet" type="text/css" href="css/font-awesome-min.css" />
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="js/bootstrap-min.js"></script>
    <script src="js/metisMenu-min.js"></script>
    <script src="js/sb-admin-2.js"></script>
</head>
<body>
<div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Navegação Alternada</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="home">FlorenceSystem</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i> Bem vindo, ${usuarioLogado.login}
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> Perfil</a></li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Definições</a></li>
                        <li class="divider"></li>
                        <li><a href="logout"><i class="fa fa-sign-out fa-fw"></i> Sair</a></li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Pesquisa...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="home"><i class="fa fa-dashboard fa-fw"></i> Painel</a>
                        </li>
                        <li>
                            <a href="#" ><i class="fa fa-edit fa-fw"></i> Cadastro de Produtos</a>
                        </li>
                        <li>
                            <a href="listaProdutos" class="active"><i class="fa fa-edit fa-fw"></i> Lista de Produtos</a>
                        </li>
                    </ul>
                </div><!-- /.sidebar-collapse -->
            </div><!-- /.navbar-static-side -->
        </nav>
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Alterar produto - ${produto.id}</h1>
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Tela de alteração de produtos
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form action="alteraProduto" method="post">
									    	<input type="hidden" name="id" value="${produto.id}" />
									    	<div class="form-group">
									    		<label>Nome:</label>
									    		<input class="form-control" type="text" name="nome_produto" value="" placeholder="${produto.nome_produto}" required="required"> 
									    	</div>
									    	<div class="form-group">
									    		<label>Marca:</label>
									    		<input class="form-control" type="text" name="marca_produto" value="" placeholder="${produto.marca_produto}" required="required">
									    	</div>
									    	<div class="form-group">	
									    		<label>Genero:</label>
									    		<input class="form-control" type="text" name="genero_produto" value="" placeholder="${produto.genero_produto}" required="required">
									    	</div>
									    	<div class="form-group">	
									    		<label>Tamanho:</label>
									    		<input class="form-control" type="text" name="quantidaDeMililitros_produto" value="" placeholder="${produto.quantidaDeMililitros_produto}" required="required">
									    	</div>
									    	 <button type="submit" class="btn btn-default" value="Alterar">Alterar</button>
									  </form>
                                </div>
                                <div class="col-lg-6">
                                    <form role="form">
       									<!-- Está area é uma coluna sobrando do lado direito da tela  -->
                                    </form>
                                </div>
                            </div><!-- /.row (nested) -->
                        </div><!-- /.panel-body -->
                    </div><!-- /.panel -->
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
        </div><!-- /#page-wrapper -->
        
        
 </div>       
	<a href="listaProdutos">Lista de Produtos</a>
	<h3>Alterar produto - ${produto.id}</h3>
	
	<form action="alteraProduto" method="post">
	
    	<input type="hidden" name="id" value="${produto.id}" />
  
    		Nome:<br />
    		<input type="text" name="nome_produto" value="${produto.nome_produto}">
      			${produto.nome_produto}
    		</ input><br />  
    		Marca:<br />
    		<input type="text" name="marca_produto" value="${produto.marca_produto}">
      			${produto.marca_produto}
   	 		</ input><br />  
    		Genero:<br />
    		<input type="text" name="genero_produto" value="${produto.genero_produto}">
      			${produto.genero_produto}
    		</ input><br /> 
    		<input type="text" name="quantidade_produto" value="${produto.quantidade_produto}">
      			${produto.quantidade_produto}
    		</ input><br /> 
    	<input type="submit" value="Alterar"/>
  </form>
</body>
</html>