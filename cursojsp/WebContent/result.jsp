<jsp:useBean id="usuario" class="beans.BeanUsuario" type="beans.BeanUsuario" scope="page"/>
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/inicial.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  <div class="container">
		<h1>Curso JSP</h1>
		
		<img src="" width="50px" class="prof"/>
		<div class="right">
			<h2>${user.nome}</h2>
			<p>Bem vindo!</p>
		</div>
		<div class='spacer'>
			<a href="CadastrarUsuarioServlet?acao=listar" class='wide blue'>
				<i class="icon-home"></i>
				<h2>Usuários</h2>
			</a>
			<a href="javascript://" class='wide orange'>
				<i class="icon-cog"></i>
				<h2>Outro menu</h2>
			</a>
			<a href="javascript://" class='box redgay'>
				<i class="icon-camera"></i>
				<h2>Camera</h2>
			</a>
			<a href="javascript://" class='box lime'>
				<i class="icon-heart"></i>
				<h2>Favorite</h2>
			</a>
			<a href="javascript://" class='box bluefish'>
				<i class="icon-twitter"></i>
				<h2>Twitter</h2>
			</a>
			<a href="javascript://" class='box yellow'>
				<i class="icon-map-marker"></i>
				<h2>Places</h2>
			</a>
			<a href="javascript://" class='wide magenta gallery'>
				<h2>Gallery</h2>
			</a>
			<a href="javascript://" class='box redgay'>
				<i class="icon-globe"></i>
				<h2>Browser</h2>
			</a>
			<a href="javascript://" class='box orange'>
				<i class="icon-envelope-alt"></i>
				<h2>E-mail</h2>
			</a>
			<a href="javascript://" class='wide blue cal_e'>
				<h1>25</h1><p>Monday</p>
				<h2 class="top cal_i">Sena Birthday Party At Jack House on 07:00 PM</h2>
				<i class="icon-calendar"></i>
			</a>
			<a href="javascript://" class='box lime'>
				<i class="icon-cloud"></i>
				<h2>SkyDrive</h2>
			</a>
		</div>

		<div class='spacer spacer3x'>
			<a href="javascript://" class='box blue'>
				<i class="icon-facebook"></i>
				<h2>Facebook</h2>
			</a>
			<a href="javascript://" class='box bluefish'>
				<i class="icon-facetime-video"></i>
				<h2>FaceTime</h2>
			</a>
			<a href="javascript://" class='box redgay'>
				<i class="icon-tasks"></i>
				<h2>Task</h2>
			</a>
			<a href="javascript://" class='box magenta'>
				<i class="icon-list-alt"></i>
				<h2>Windows Explorer</h2>
			</a>
			<a href="index.jsp" class='wide yellow'>
				<i class="icon-play"></i>
				<h2>Sair</h2>
			</a>
		</div>

	</div>
	
</body>
</html>