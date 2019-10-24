<jsp:useBean id="usuario" class="beans.BeanUsuario"
	type="beans.BeanUsuario" scope="page" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/form.css">
<link rel="stylesheet" href="resources/css/table.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<script type="text/javascript">
	function voltar()
	{
		location.href="CadastrarUsuarioServlet?acao=listar"
	}
	</script>


	<h1>Detalhes do Usuário</h1>
	
	<form>
	<ul class="form-style-1">
				<li> <label> Código</label>
				<input type="text" id="id" name="id" value="${user.id}" readonly="readonly" class="field-divided">
				
				<li>
				
				<li> <label> Nome:<span class="required">*</span></label>
				<input type="text" id="nome" name="nome" value="${user.nome}" readonly="readonly" class="field-divided">
			
				<li>
				
				<li> <label> Login: <span class="required">*</span></label>
				<input type="text" id="login" name="login" value="${user.login}" readonly="readonly" class="field-divided">
				
				<li>

				<li> <label> Telefone: </label>
			 	<input type="text" id="telefone" name="telefone" class="field-divided" value="${user.telefone}" readonly="readonly">

				<li>
				
				<li> <label> CEP: </label>
			 	<input type="text" id="cep" name="cep" class="field-divided" placeholder="Insira o CEP" readonly="readonly" value="${user.cep}">

				<li>
				
				<li><label> Logradouro: </label> <input type="text" id="logradouro" name="logradouro" class="field-divided" readonly="readonly" value="${user.logradouro}">
			
				<li>
			
				<li><label> Bairro: </label> <input type="text" id="bairro" name="bairro" class="field-divided" readonly="readonly" value="${user.bairro}">
				
				<li>
				
				<li><label> Município: </label> <input type="text" id="municipio" name="municipio" class="field-divided" readonly="readonly" value="${user.municipio}">
				
				<li>
			
				<li><label> UF: </label> <input type="text" id="uf" name="uf" class="field-divided" readonly="readonly" value="${user.uf}">
				
				<li>
			
				<li><label> Código IBGE: </label> <input type="text" id="ibge"	name="ibge" class="field-divided" readonly="readonly" value="${user.ibge}">
				
				<li>
				
				<li> <label> Ativo: <span class="required">*</span></label>
				<input type="checkbox" id="situacao" name="situacao" value="${user.situacao}" readonly="readonly">
				
				<li>		
				<input type="button" value="Voltar" onclick="voltar()">
		</ul>
	</form>

</body>
</html>