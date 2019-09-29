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
<title>Sistema JSP </title>

</head>
<body>

	<script type="text/javascript">
	function voltar()
	{
		location.href="CadastrarUsuarioServlet?acao=listar"
	}
	</script>


	<h1>Alteração de Usuário</h1>
	
	<h3 style="color:red;">${msg}</h3>
	
	<form action="CadastrarUsuarioServlet" method="post">
	<ul class="form-style-1">
				<li> <label> Código</label>
				<input type="text" id="id" name="id" value="${user.id}" readonly="readonly" class="field-divided">
				
				<li>
				
				<li> <label> Nome:<span class="required">*</span></label>
				<input type="text" id="nome" name="nome" value="${user.nome}" class="field-divided">
			
				<li>
				
				<li> <label> Login: <span class="required">*</span></label>
				<input type="text" id="login" name="login" value="${user.login}" class="field-divided">
				
				<li>
				
				<li> <label> Senha:<span class="required">*</span></label>
				<input type="password" id="senha" name="senha" value="${user.senha}" class="field-divided">
			
				<li>
				
				<li> <label> Telefone: </label>
			 	<input type="text" id="telefone" name="telefone" class="field-divided" value="${user.telefone}">

				<li>
				
				<li> <label> Ativo: <span class="required">*</span></label>
				<input type="checkbox" id="situacao" name="situacao" value="${user.situacao}" >
				
				<li>		
				<input type="hidden" id="acao" name="acao" value="editar">
				<input type="submit" value="Salvar"> 
				<input type="button" value="Voltar" onclick="voltar()">
		</ul>
	</form>

</body>
</html>