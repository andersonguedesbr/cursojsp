<jsp:useBean id="usuario" class="beans.BeanUsuario" type="beans.BeanUsuario" scope="page"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/form.css">
<link rel="stylesheet" href="resources/css/table.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Bem vindo ao sistema!!</h1>
	
	<a href="CadastrarUsuarioServlet?acao=listar">Lista de Usuários</a>
	
</body>
</html>