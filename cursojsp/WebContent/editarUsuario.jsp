<jsp:useBean id="usuario" class="beans.BeanUsuario"
	type="beans.BeanUsuario" scope="page" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/form.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<script type="text/javascript">
	function voltar()
	{
		location.href="listarUsuarios.jsp"
	}
	</script>


	<h1>Alteração de Usuário</h1>
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
				<li> <label> Ativo: <span class="required">*</span></label>
				<input type="checkbox" checked="checked" id="situacao" name="situacao" value="${user.situacao}">
				
				<li>		
				<input type="hidden" id="acao" name="acao" value="editar">
				<input type="submit" value="Salvar"> 
				<input type="button" value="Voltar" onclick="voltar()">
	</form>

</body>
</html>