<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>

	<div class="wrapper fadeInDown">
		<div id="formContent">
			<h2 class="active">Sign In</h2>
			<h2 class="inactive underlineHover">Sign Up</h2>
			
			<form action="LoginServlet" method="post" class="fadeIn second">
				<input type="text" id="login" name="login" class="fadeIn second" placeholder="login"> <br />
				<input type="text" id="senha" name="senha" class="fadeIn third" placeholder="senha"> <br /> <input
					type="submit" value="Logar">
			</form>
			
			    <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
    </div>
		</div>
	</div>

</body>
</html>