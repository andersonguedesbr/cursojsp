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
<title>Sistema JSP</title>

</head>
<body>

	<script type="text/javascript">
	function voltar()
	{
		location.href="LoginServlet?acao=inicial"
	}
	
	function novo()
	{
		location.href="CadastrarUsuarioServlet?acao=novo"
	}
	</script>


	<h1>Pesquisar Usuários</h1>
	<form action="CadastrarUsuarioServlet" method="post">
		<ul class="form-style-1">
				<li> <label> Nome: </label> 
				<input type="text" id="nome" name="nome" value="${param.nome}" class="field-divided">
			
				<li> <label> Login: </label>  
				<input type="text" id="login" name="login" value="${param.login}" class="field-divided">
			
				<li> <label> Situação: </label> 
				<input type="checkbox" checked="checked" id="situacao" name="situacao">
		
		<input type="hidden" id="acao" name="acao" value="pesquisar"> 
		<li> <input type="submit" value="Pesquisar"> 
		<input type="button" value="Novo" onclick="novo()">
		<input type="button" value="Voltar" onclick="voltar()">
	</form>
	<br>
	<br>
	
	
	<div class="table">
	    
	    <div class="row header blue">
      		<div class="cell">
        		Código
        	 </div>
        	 <div class="cell">
        		Nome
        	 </div>
        	 <div class="cell">
        		Login
        	 </div>
        	 <div class="cell">
        		Telefone
        	 </div>
        	 <div class="cell">
        		Situação
        	 </div>
        	 <div class="cell">
        		Ações
        	 </div>
        </div>
			<c:forEach items="${usuarios}" var="user">
				<div class="row">
					<div class="cell" data-title="Código">
        				<c:out value="${user.id}"></c:out>
      				</div>
      				<div class="cell" data-title="Nome">
        				<c:out value="${user.nome}"></c:out>
      				</div>
      				<div class="cell" data-title="Login">
        				<c:out value="${user.login}"></c:out>
      				</div>
      				<div class="cell" data-title="Telefone">
        				<c:out value="${user.telefone}"></c:out>
      				</div>
      				<div class="cell" data-title="Situação">
        				<c:out value="${user.situacao}"></c:out>
      				</div>
      				<div class="cell" data-title="Ações">
        				<a href="CadastrarUsuarioServlet?acao=delete&user=${user.id}"><img alt="Excluir" title="Excluir" src="resources/images/delete.png"></a>
        				<a href="CadastrarUsuarioServlet?acao=update&user=${user.id}"><img alt="Editar" title="Editar" src="resources/images/edit.png"></a>
        				<a href="CadastrarUsuarioServlet?acao=detalhar&user=${user.id}"><img alt="Detalhar" title="Detalhar" src="resources/images/detalhar.png"></a>
      				</div>
      			</div>
					
				</c:forEach>

	</div>
</body>
</html>