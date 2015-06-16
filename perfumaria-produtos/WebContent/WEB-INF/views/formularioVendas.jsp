<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="adicionaVendas" method="post" role="form">
		<label>Lista de Produtos</label>
		<input class="form-control" name="produto" placeholder="Descreva a quantidade de produtos" required="required"><p/>
		<label>Quantidade de Produtos</label>
	    <input class="form-control" name="qtdVendas" placeholder="Descreva a quantidade de produtos" required="required"><p/>
	    <label>Estoque pós venda</label>
	    <input class="form-control" name="estoqueAtualizado" placeholder="Descreva a Marca do Produto" value="${Vendas.estoqueAtualizado}"><p/>
	    <input type="submit" value="Incluir">	
	</form>

</body>
</html>