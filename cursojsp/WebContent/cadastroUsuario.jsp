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
<link rel="stylesheet" href="resources/css/form.css">
<link rel="stylesheet" href="resources/css/table.css">

<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
</head>
<body>

	<script type="text/javascript">
		function voltar() {
			location.href = "CadastrarUsuarioServlet?acao=listar";
		}

		function validarCampos() {

			if (document.getElementById("nome").value == "") {
				alert("O campo Nome é de preenchimento obrigatório!");
				return false;

			} else if (document.getElementById("login").value == "") {
				alert("O campo Login é de preenchimento obrigatório!");
				return false;

			} else if (document.getElementById("senha").value == "") {
				alert("O campo Senha é de preenchimento obrigatório!");
				return false;

			} else if (document.getElementById("telefone").value == "") {
				alert("O campo Telefone é de preenchimento obrigatório!");
				return false;
			}

			return true;

		}

		function consultarCep() {

			$("#logradouro").val("");
			$("#bairro").val("");
			$("#municipio").val("");
			$("#uf").val("");
			$("#ibge").val("");

			var cep = $("#cep").val().replace(/\D/g, '');

			if (cep != "") {

				var validacep = /^[0-9]{8}$/;

				if (validacep.test(cep)) {

					$("#logradouro").val("Carregando ...");
					$("#bairro").val("Carregando ...");
					$("#municipio").val("Carregando ...");
					$("#uf").val("Carregando ...");
					$("#ibge").val("Carregando ...");

					$.getJSON("https://viacep.com.br/ws/" + cep
							+ "/json/?callback=?", function(dados) {

						if (!("erro" in dados)) {
							$("#logradouro").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#municipio").val(dados.localidade);
							$("#uf").val(dados.uf);
							$("#ibge").val(dados.ibge);

						} else {
							alert("CEP não encontrado!");
						}
					});
				} else {
					alert("O CEP informado é inválido!");
				}
			}

		}
	</script>


	<h1>Cadastrar novo Usuário</h1>

	<h3 style="color: red;">${msg}</h3>

	<form action="CadastrarUsuarioServlet" method="post"
		onsubmit="return validarCampos() ? true : false" enctype="multipart/form-data">
		<ul class="form-style-1">
			<li><label> Nome:<span class="required">*</span></label> <input
				type="text" id="nome" name="nome" class="field-divided"
				placeholder="Insira o nome" >
			<li>
			<li><label> Login: <span class="required">*</span></label> <input
				type="text" id="login" name="login" class="field-divided"
				placeholder="Insira o login" >
			<li>
			<li><label> Senha: <span class="required">*</span></label> <input
				type="password" id="senha" name="senha" class="field-divided"
				placeholder="Insira a senha" >
			<li>
			<li><label> Telefone: <span class="required">*</span></label> <input
				type="text" id="telefone" name="telefone" class="field-divided"
				placeholder="Insira o telefone" >
			<li>
			<li><label> CEP: <span class="required">*</span></label> <input
				type="text" id="cep" name="cep" class="field-divided"
				placeholder="Insira o CEP" onblur="consultarCep()">
			<li>
			<li><label> Logradouro: </label> <input type="text"
				id="logradouro" name="logradouro" class="field-divided"
 				readonly="readonly">
			<li>
			<li><label> Bairro: </label> <input type="text" id="bairro"
				name="bairro" class="field-divided" readonly="readonly">
			<li>
			<li><label> Município: </label> <input type="text"
				id="municipio" name="municipio" class="field-divided"
				readonly="readonly">
			<li>
			<li><label> UF: </label> <input type="text" id="uf" name="uf"
				class="field-divided" readonly="readonly">
			<li>
			<li><label> Código IBGE: </label> <input type="text" id="ibge"
				name="ibge" class="field-divided" readonly="readonly">
				
			<li>
			<li><label>Foto:<span class="required">*</span></label>
				<input type="file" id="foto" name="foto">	
				
			<li><label> Ativo: <span class="required">*</span></label> <input
				type="checkbox" checked="checked" id="situacao" name="situacao">
				 
			<li><input type="submit" value="Salvar"> <input
				type="button" value="Voltar" onclick="voltar()">
				
			<input type="hidden" id="acao" name="acao" value="incluir">	
	</form>


</body>
</html>