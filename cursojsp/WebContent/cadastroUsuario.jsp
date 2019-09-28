<jsp:useBean id="usuario" class="beans.BeanUsuario"
	type="beans.BeanUsuario" scope="page" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/form.css">
<link rel="stylesheet" href="resources/css/table.css">
</head>
<body>

<script type="text/javascript">
	function voltar() {
		location.href = "listarUsuarios.jsp"
	}
</script>


<h1>Cadastrar novo Usuário</h1>

<h3 style="color:red;">${msg}</h3>

<form action="CadastrarUsuarioServlet" method="post">
	<ul class="form-style-1">
		<li> <label> Nome:<span class="required">*</span></label> 
		<input type="text" id="nome" name="nome" class="field-divided" placeholder="Insira o nome" value="${user.nome}">
		
		<li>
		
		<li> <label> Login: <span class="required">*</span></label>
			 <input type="text" id="login" name="login" class="field-divided" placeholder="Insira o login" value="${user.login}">
			
		<li>
		
		<li> <label> Senha:  <span class="required">*</span></label>
			 <input type="password" id="senha" name="senha" class="field-divided" placeholder="Insira a senha" value="${user.senha}">
		
		<li>
		
		<li> <label> Telefone: </label>
			 <input type="text" id="telefone" name="telefone" class="field-divided" placeholder="Insira o telefone" value="${user.telefone}">

		<li>
		
		<li> <label> Ativo: <span class="required">*</span></label>
			 <input type="checkbox" checked="checked" id="situacao" name="situacao" value="${user.situacao}">
			 
			 
			 <input type="hidden" id="acao" name="acao" value="incluir">
			 <li> <input type="submit" value="Salvar"> 
			 <input type="button" value="Voltar" onclick="voltar()">
</form>


</body>
</html>