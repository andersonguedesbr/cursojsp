<jsp:useBean id="produto" class="beans.BeanProduto" type="beans.BeanProduto" scope="page"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/form.css">
<link rel="stylesheet" href="resources/css/table.css">
<head>
<meta charset="UTF-8">
<title>Sistema JSP</title>
</head>
<body>

	<script type="text/javascript">
		function voltar() {
			location.href="LoginServlet?acao=inicial"
		}
		
		function novo() {
			location.href="ProdutoServlet?acao=novo"
		}
	</script>
	
	<h1>Pesquisar Produtos</h1>
	
	<form action="ProdutoServlet" method="post">
		<ul class="form-style-1">
		
			<li> <label> Código: </label> 
			<input type="text" id="id" name="id" value="${param.id}" class="field-divided">
			
			<li> <label> Descrição: </label> 
			<input type="text" id="descricao" name="descricao" value="${param.descricao}" class="field-divided">
			
			<li> <label> Unidade: </label> 
			<input type="text" id="unidade" name="unidade" value="${param.unidade}" class="field-divided">
			
			<li> <label> Valor inicial: </label> 
			<input type="text" id="valorInicial" name="valorInicial" value="${param.valorInicial}" class="field-divided">
			
			<li> <label> Valor final: </label> 
			<input type="text" id="valorFinal" name="valorFinal" value="${param.valorFinal}" class="field-divided">
			
			<li> 
			<input type="hidden" id="acao" name="acao" value="pesquisar">
			<input type="submit" value="Pesquisar">
			<input type="button" value="Novo" onclick="novo()">
			<input type="button" value="Voltar" onclick="voltar()">
	</form>
	<br>
	<br>
	
	
	<div class="table">
	    
	    <div class="row header blue">
      		<div class="cell">
				Código
			</div>
			<div class="cell">
				Descrição
			</div>
			<div class="cell">
				Quantidade
			</div>
			<div class="cell">
				Unidade
			</div>
			<div class="cell">
				Valor
			</div>
			<div class="cell">
				Ações
			</div>
		</div>
		
		<c:forEach items="${produtos}" var="produto"> 
			<div class="row">
				<div class="cell" data-title="Código">
					<c:out value="${produto.id}"></c:out>
				</div>
				<div class="cell" data-title="Descrição">
					<c:out value="${produto.descricao}"></c:out>
				</div>
				<div class="cell" data-title="Quantidade">
					<c:out value="${produto.quantidade}"></c:out>
				</div>
				<div class="cell" data-title="Unidade">
					<c:out value="${produto.unidade}"></c:out>
				</div>
				<div class="cell" data-title="Valor">
					<c:out value="${produto.valor}"></c:out>
				</div>
				<div class="cell" data-title="Ações">
					<a href="ProdutoServlet?acao=excluir&id=${produto.id}"><img alt="Exclur" title="Excluir" src="resources/images/delete.png"></a>
					<a href="ProdutoServlet?acao=abirEditar&id=${produto.id}"><img alt="Editar" title="Editar" src="resources/images/edit.png"></a>
					<a href="ProdutoServlet?acao=detalhar&id=${produto.id}"><img alt="Detalhar" title="Detalhar" src="resources/images/detalhar.png"></a>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>