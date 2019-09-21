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
	function menu()
	{
		location.href="result.jsp"
	}
	
	function novo()
	{
		location.href="cadastroUsuario.jsp"
	}
	</script>


	<h1>Pesquisar Usuários</h1>
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
		<input type="hidden" id="acao" name="acao" value="pesquisar"> 
		<input type="button" value="Pesquisar"> 
		<input type="button" value="Novo" onclick="novo()">
		<input type="button" value="Voltar" onclick="menu()">
	</form>
	<br>
	<br>
	<h1>Lista de usuários</h1>
	
	<table>
		<c:forEach items="${usuarios}" var="user">
			<tr>
				<td style="width: 50px"><c:out value="${user.id}"></c:out></td>
				<td style="width: 300px"><c:out value="${user.nome}"></c:out></td>
				<td style="width: 150px"><c:out value="${user.login}"></c:out></td>
				<td style="width: 150px"><c:out value="${user.situacao}"></c:out></td>
				<td style="width: 70px"><a href="CadastrarUsuarioServlet?acao=delete&user=${user.id}">Excluir</a></td>
				<td style="width: 70px"><a href="CadastrarUsuarioServlet?acao=update&user=${user.id}">Editar</a></td>
		</c:forEach>
	</table>

</body>
</html>