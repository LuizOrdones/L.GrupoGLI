<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='pt-BR'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro Produto</title>
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
                        <li><a href="login"><i class="fa fa-sign-out fa-fw"></i> Sair</a></li>
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
                            <a href="#" class="active"><i class="fa fa-edit fa-fw"></i> Cadastro de Produtos</a>
                        </li>
                        <li>
                            <a href="listaProdutos"><i class="fa fa-edit fa-fw"></i> Lista de Produtos</a>
                        </li>
                    </ul>
                </div><!-- /.sidebar-collapse -->
            </div><!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Cadastro</h1>
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Tela de cadastro de novos produtos
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form:errors path="nome_produto"/>
									<form:errors path="nome_produto" cssStyle="color:red"/>
									<form action="adicionaProduto" method="post" role="form">
										<p class="help-block">Por favor, preencha os campos corretamente para facilitar a pesquisa.</p>
                                        <div class="form-group">
                                            <label>Nomedo Produto</label>
                                            <input class="form-control" name="nome_produto" placeholder="Descreva o Nome do Produto" required="required">
                                        </div>
                                        <div>
	                                        <label>Marca do Produto</label>
	                                        <input class="form-control" name="marca_produto" placeholder="Descreva a Marca do Produto" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label>Genêro</label>
                                            <select class="form-control"name="genero_produto" required="required">
                                                <option value=""> </option>
                                                <option value="masculino">Masculino</option>
                                                <option value="feminino">Feminino</option>
                                                <option value="feminino">Unissex</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Valor de Custo:</label>
                                            <input class="form-control" name="valorDeCusto_produto" placeholder="R$ 00,00">
                                        </div>
                                        <button type="submit" class="btn btn-default" value="Incluir">Incluir</button>
                                        <button type="reset" class="btn btn-default">Resetar</button>
                                    
                                </div>
                                <div class="col-lg-6">
                                    
                                    	<label>Valor de Venda:</label>
                                    	<div class="form-group input-group">
                                            <span class="input-group-addon">R$</span>
                                            <input type="text" class="form-control" name="valorDeVenda_produto">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                        <label>Categoria:</label>
                                        <div class="form-group input-group">
                                            <input type="text" class="form-control" name="categoria_produto" placeholder="Pesquise a Categoria">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button">
                                                	<i class="fa fa-search"></i>
                                                </button>
                                            </span>
                                        </div>
                                        <label>Tamanho:</label>
                                        <div class="form-group input-group">
                                        	<span class="input-group-addon"><i class="fa fa-eur"></i></span>
                                            <input type="text" class="form-control" name="quantidaDeMililitros_produto" placeholder="Digite a quantidade em ml">
                                        </div>
                                    </form>
                                </div>
                            </div><!-- /.row (nested) -->
                        </div><!-- /.panel-body -->
                    </div><!-- /.panel -->
                </div><!-- /.col-lg-12 -->
            </div><!-- /.row -->
        </div><!-- /#page-wrapper -->

    </div><!-- /#wrapper -->
</body>
</html> 