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
	function Nova()
	{
		location.href="result.jsp"
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
		<input type="button" value="Voltar" onclick="Nova()">
	</form>

	<table>
		<c:forEach items="${usuarios}" var="user">
			<tr>
				<td style="width: 50px"><c:out value="${user.id}"></c:out></td>
				<td style="width: 300px"><c:out value="${user.nome}"></c:out></td>
				<td style="width: 150px"><c:out value="${user.login}"></c:out></td>
				<td style="width: 150px"><c:out value="${user.situacao}"></c:out></td>
		</c:forEach>
	</table>

</body>
</html>