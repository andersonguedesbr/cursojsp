<jsp:useBean id="usuario" class="beans.BeanUsuario" type="beans.BeanUsuario" scope="page"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Index</h1>
	
	<form action="result.jsp" method="post">
		<input type="text" id="nome" name="nome">
		<input type="text" id="cpf" name="cpf">
		<input type="text" id="senha" name="senha">
		<input type="submit" value="Enviar">
	</form>
		
</body>
</html>