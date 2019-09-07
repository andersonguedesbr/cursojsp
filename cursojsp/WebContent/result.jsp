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
	<jsp:setProperty property="*" name="usuario"/>
	Nome: ${param.nome}
	<br/>
	CPF: ${param.cpf}
	<br/>
	Senha: ${param.senha}
	

</body>
</html>