<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
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
                            <a href="adicionaProduto"><i class="fa fa-edit fa-fw"></i> Cadastro de Produtos</a>
                        </li>
                        <li>
                            <a href="" class="active"><i class="fa fa-edit fa-fw"></i> Lista de Produtos</a>
                        </li>
                    </ul>
                </div><!-- /.sidebar-collapse -->
            </div><!-- /.navbar-static-side -->
        </nav>
        
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Produtos Cadastrados</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           Lista de Produtos
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center!important;">CÓDIGO</th>
                                            <th style="text-align: center!important;">NOME</th>
                                            <th style="text-align: center!important;">MARCA</th>
                                            <th style="text-align: center!important;">GÊNERO</th>
                                            <th style="text-alibn: center!important;">TAMANHO</th>
                                            <th style="text-align: center!important;">Estoque</th>
                                            <th style="text-align: center!important;">DATA</th>
                                            <th style="text-align: center!important;">EDITAR</th>                                  
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <c:forEach items="${produtos}" var="produto">
                                        <tr class="odd gradeX">
                                            <td style="text-align: center!important;">${produto.id}</td>
									      	<td style="text-align: center!important;">${produto.descricao}</td>
									      	<td style="text-align: center!important;">${produto.marcaProduto}</td>
									      	<td style="text-align: center!important;">${produto.generoProduto}</td>
									      	<td style="text-align: center!important;">${produto.qtdMlProduto}</td>
									      	<td style="text-align: center!important;">${produto.qtdProduto}</td>
									      	<td style="text-align: center!important;"><fmt:formatDate value="${produto.dataInclusaoProduto.time}" pattern="dd/MM/yyyy HH:mm:ss" />
									      	</td>
									      	<td align="center" class="center"><a class="btn btn-primary" href="mostraProduto?id=${produto.id}"><i class="fa fa-edit"></i> Alterar</a></td>
     									    <%-- <td align="center" class="center"><a class="btn btn-default" href="removeProduto?id=${produto.id}"><i class="fa fa-trash"></i> Remover</a></td>  --%>
                                        </tr>
                                     </c:forEach> 
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div><!-- /.panel-body -->
                    </div><!-- /.panel -->
                </div><!-- /.col-lg-12 -->
            </div>
 </div>  
	<!-- <a href="novoProduto">Adicionar novo produto</a> 
		
  <br /> <br />  
  Busca:<br/>
		<input type="search"/>    
		<input type="image" src="img/busca.png" class="lupa" />  

  <table>
  	<tr>
    <th>Id</th>
    <th>Nome</th>
    <th>Marca</th>
    <th>Genero</th>
    <!--<th>Valor de Custo</th>
    <th>Valor de Venda</th>
    <th>Data de Fabricação</th>
    <th>Validade</th>
    <th>Categoria</th>
    <th>Quantida</th>
    <th>Quantidade de Mililitros</th>
    
  </tr>
<c:forEach items="${produtos}" var="produto">
    <tr>
      	<td>${produto.id}</td>
      	<td>${produto.descricao}</td>
      	<td>${produto.marcaProduto}</td>
      	<td>${produto.generoProduto}</td>
      	<!--<td>${produto.valorDeCustoProduto}</td>
     	<td>${qtdProduto}</td>
      	<td>${qtdProduto}</td>
     <td>
     	<fmt:formatDate 
          	value="${dataInclusaoProduto.time}" 
          	pattern="dd/MM/yyyy"/>
     </td>
     <td><a href="mostraProduto?id=${produto.id}">Alterar</a></td>
     <td><a href="removeProduto?id=${produto.id}">Remover</a></td>
    </tr>
  </c:forEach>
  </table> -->
</div>
</body>
</html>