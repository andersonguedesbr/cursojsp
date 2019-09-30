<jsp:useBean id="produto" class="beans.BeanProduto" type="beans.BeanProduto" scope="page"/>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		location.href="ProdutoServlet?acao=listar"
		
	}
</script>

	<h1>Detalhes do Produto</h1>
	
	<h3 style="color: red;">${msg}</h3>
	
		<form>
			<ul class="form-style-1">
			
			<li> <label> Código:</label> 
			<input type="text" id="id" name="id" value="${prod.id}" class="field-divided" readonly="readonly" >
			
			<li>
			
			<li> <label> Descrição:<span class="required">*</span></label> 
			<input type="text" id="descricao" name="descricao" class="field-divided" value="${prod.descricao}" readonly="readonly">
			
			<li>
			
			<li> <label> Quantidade:<span class="required">*</span></label> 
			<input type="text" id="quantidade" name="quantidade" class="field-divided" value="${prod.quantidade}" readonly="readonly">
			
			<li>
			
			<li> <label> Unidade:<span class="required">*</span></label> 
			<input type="text" id="unidade" name="unidade" class="field-divided" value="${prod.unidade}" readonly="readonly">
			
			<li>
			
			<li> <label> Valor (R$):<span class="required">*</span></label> 
			<input type="text" id="valor" name="valor" class="field-divided" value="${prod.valor}" readonly="readonly">
			
			<li>
			
			<input type="button" value="Voltar" onclick="voltar()">
			
		</form>
</body>
</html>