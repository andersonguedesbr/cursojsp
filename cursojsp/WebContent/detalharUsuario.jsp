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
				
				<li> <label> Ativo: <span class="required">*</span></label>
				<input type="checkbox" id="situacao" name="situacao" value="${user.situacao}" readonly="readonly">
				
				<li>		
				<input type="button" value="Voltar" onclick="voltar()">
		</ul>
	</form>

</body>
</html>