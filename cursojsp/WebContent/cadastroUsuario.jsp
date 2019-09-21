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

</head>
<body>

	<script type="text/javascript">
	function voltar()
	{
		location.href="listarUsuarios.jsp"
	}
	</script>


	<h1>Cadastro de Usuário</h1>
	<form action="CadastrarUsuarioServlet" method="post">
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" id="nome" name="nome"></td>
			<tr>
				<td>Login:</td>
				<td><input type="text" id="login" name="login"></td>
			<tr>
				<td>Senha:</td>
				<td><input type="password" id="senha" name="senha"></td>
			<tr>
				<td>Ativo:</td>
				<td><input type="checkbox" checked="checked" id="situacao"
					name="situacao">
		</table>
		<input type="submit" value="Salvar"> 
		<input type="button" value="Voltar" onclick="voltar()">
	</form>


</body>
</html>