<jsp:useBean id="contato" class="beans.BeanContato" type="beans.BeanContato" scope="page" />

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	
	<link rel="stylesheet" href="resources/css/form.css">
	<link rel="stylesheet" href="resources/css/table.css">
<head>
<meta charset="UTF-8">
<title>:: Sistema JSP :: Lista de Contatos</title>
</head>
<body>

	<script type="text/javascript">
	function voltar()
	{
		location.href="CadastrarUsuarioServlet?acao=listar"
	}
	
	function novo()
	{
		location.href="ContatoServlet?acao=novo"
	}
	</script>


	<h1>Pesquisar Contatos (${user.id} - ${user.nome})</h1>
	
		<form action="">
			<ul class="form-style-1">
				<li><label>Tipo de Contato: </label>
					<select id="tipoContato" name="tipocontato" class="field-divided">
						<option value="">Selecione uma opção</option>
						
						<c:forEach var="tipoContato" items="${tipoContato}">
							<option value="${tipoContato.id}">${tipoContato.tipoContato}</option>
						</c:forEach>
						
					</select> 

				<li>
				
				<li><label>Contato:</label>
				<input type="text" id="contato" name="contato" class="field-divided">
				
				<li>
				
				<input type="hidden" id="acao" name="acao" value="pesquisar"> 
				<input type="submit" value="Pesquisar">
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
        		Tipo de contato
        	 </div>
        	 <div class="cell">
        	 	Contato
        	 </div>
        	 <div class="cell">
        	 	Ações
        	 </div>
		</div>
		
		<c:forEach var="contatos" items="${contatos}">
			<div class="row">
					<div class="cell" data-title="Código">
        				<c:out value="${contatos.id}"></c:out>
      				</div>
      				<div class="cell" data-title="Tipo de Contato">
      					<c:out value="${contatos.tipoContato.tipoContato}"></c:out>
      				</div>
      				<div class="cell" data-title="Contato">
        				<c:out value="${contatos.contato}"></c:out>
      				</div>
      				<div class="cell" data-title="Ações">
      					<a href="ContatoServlet?acao=excluir&contato=${contatos.id}"><img alt="Excluir" title="Excluir" src="resources/images/delete.png"></a>
      					<a href="ContatoServlet?acao=editar&contato=${contatos.id}"><img alt="Editar" title="Editar" src="resources/images/edit.png"></a>
      					<a href="ContatoServlet?acao=detalhar&contato=${contatos.id}"><img alt="Detalhar" title="Detalhar" src="resources/images/detalhar.png"></a>
      				</div>
			</div>
		</c:forEach>

	</div>
</body>
</html>