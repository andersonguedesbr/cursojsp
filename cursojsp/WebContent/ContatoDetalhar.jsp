<jsp:useBean id="contato" class="beans.BeanContato" type="beans.BeanContato" scope="page"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/form.css">
<link rel="stylesheet" href="resources/css/table.css">
<head>
<meta charset="UTF-8">
<title>:: Sistema JSP :: Detalhar Contato</title>
</head>
<body>

<script type="text/javascript">
	
	function voltar() {
		
		location.href="ContatoServlet?acao=listar&user=${user.id}";
		
	}
	
</script>
	
	<h1>Detalhar Contato</h1>
	
		<form>
			<ul class="form-style-1">
				
				<li><label>Código Contato:</label>
					<input type="text" id="id" name="id" readonly="readonly" class="field-divided" value="${contatox.id}">
				
				<li><label>Tipo de Contato:</label>
					<select id="tipoContato" name="tipoContato" class="field-divided" disabled="disabled">
						<c:forEach var="tipoContato" items="${tipoContato}">
							<option value="${tipoContato.id}">${tipoContato.tipoContato}</option>
						</c:forEach>
						
					</select>
					
				<li><label>Contato:</label>
					<input type="text" id="contato" name="contato" readonly="readonly" class="field-divided" value="${contatox.contato}">
					
				<li><input type="button" value="Voltar" onclick="voltar()">
		</form>
	
	
</body>
</html>