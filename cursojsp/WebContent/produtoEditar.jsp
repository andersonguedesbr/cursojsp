<jsp:useBean id="produto" class="beans.BeanProduto" type="beans.BeanProduto" scope="page"/>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		location.href="ProdutoServlet?acao=listar"
		
	}
	
	function validarCampos() {
		if(document.getElementById("descricao").value == ""){
			alert("O campo Descricao é de preenchimento obrigatório!");
			return false;
			
		} else if(document.getElementById("quantidade").value == ""){
			alert("O campo Quantidade é de preenchimento obrigatório!");
			return false;
			
		} else if(document.getElementById("unidade").value == ""){
			alert("O campo Unidade é de preenchimento obrigatório!");
			return false;
			
		} else if(document.getElementById("valor").value == ""){
			alert("O campo Valor é de preenchimento obrigatório!");
			return false
			
		}
		return true;
	}
</script>

	<h1>Alteração de Produto</h1>
	
	<h3 style="color:red;">${msg}</h3>
	
	<form action="ProdutoServlet" method="post" onsubmit="return validarCampos() ? true : false">
	<ul class="form-style-1">
		
		<li> <label> Código:</label> 
		<input type="text" id="id" name="id" value="${prod.id}" class="field-divided" readonly="readonly" >
		
		<li>
		
		<li> <label> Descrição:<span class="required">*</span></label> 
		<input type="text" id="descricao" name="descricao" class="field-divided" placeholder="Insira a descrição do produto" value="${prod.descricao}">
		
		<li>
		
		<li> <label> Quantidade:<span class="required">*</span></label> 
		<input type="text" id="quantidade" name="quantidade" class="field-divided" placeholder="Insira a quantidade do produto" value="${prod.quantidade}">
		
		<li>
		
		<li> <label> Unidade:<span class="required">*</span></label> 
		<input type="text" id="unidade" name="unidade" class="field-divided" placeholder="Insira a unidade da quantidade do produto" value="${prod.unidade}">
		
		<li>
		
		<li> <label> Valor (R$):<span class="required">*</span></label> 
		<input type="text" id="valor" name="valor" class="field-divided" placeholder="Insira o valor do produto" value="${prod.valor}">
		
		<li>
		
		<input type="hidden" id="acao" name="acao" value="editar">
		<input type="submit" value="Salvar">
		<input type="button" value="Voltar" onclick="voltar()">
	
	</form>


          
</body>
</html>