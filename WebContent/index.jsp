<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bussam</title>
<style type="text/css">
</style>
<script type="text/javascript">
function compruebayenvia() {
	datos=document.iniciosesion;
	if (datos.usuario.value == '' ||
			datos.pass.value == '')
		alert ('¡Tiene que rellenar todos los campos!');
	else datos.submit();
}
function compruebanums(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (keycode < 48 || keycode > 57) //Rango ASCII de números
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir números ');
			return false;
		}
		else return true;
	}
	else return true;
}
function compruebaalfan(campo, evento) {
	var keycode;
	if (window.event) keycode = window.event.keyCode;
	else if (evento) keycode = evento.which;
	else return true;
	if (( keycode < 48 || keycode > 57 ) && ( keycode < 64 || keycode > 90 ) && ( keycode < 97 || keycode > 122 )) //Rango ASCII de números y letras
	{
		if (keycode != 8 && keycode != 27 && keycode != 0 ) { //Caracteres especiales permitidos
			alert('Sólo puede introducir letras y números ');
			return false;
		}
		else return true;
	}
	else 
		return true;
}
</script>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-info navbar-light"> <!-- Brand/logo -->
	<a class="navbar-brand" href="#"> <img src="wimages/buss.png"
		alt="BUSSAM" style="height: 50px;">
	</a> <!-- Links -->
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" href="index.jsp">Login</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="inicio.jsp">Consultas</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="info.jsp">Sobre
				BUSSAM</a></li>
 
		<li class="nav-item "><a class="nav-link "
			href="cerrarsesion.jsp"><button type="button"
					class="btn btn-danger" style="margin-right: 20px">SALIR</button></a></li>

	</ul>
	</nav>

	<br>
	<div class="row">
		<div class="col-lg-2 col-md-2 d-none d-md-block bg-secundary">

			<a href="#"><img
				src="http://i.picasion.com/pic87/84d0bb175e6bf6d61d48f12ef5154c12.gif
		"
				width="100%" height="" border="0" alt="banner" /></a>

		</div>
		<div class="col-lg-8 col-md-10 bg-info">

			<div class="row">
				<div class="col-1"></div>
				<div class="col-10">
					<h1>Iniciar Sesión</h1>
					<table>
						<tr>
							<td><form action="inicio.jsp" method="post"
									name="iniciosesion" /> <input type="hidden" name="varoculta"
								value="secreto" /> <input type="text" name="usuario"
								placeholder="Usuario"
								onkeypress="return compruebaalfan(this,event);" maxlength="11"
								value="" class=" button bg-dark text-light" /></td>
							<td><input type="password" name="pass" placeholder="Clave"
								onkeypress="return compruebaalfan(this,event);" maxlength="11"
								value="" class="button bg-dark text-light" /></td>
							<td><input type="button" name="send" value="Enviar"
								onclick="compruebayenvia();" />
							</form></td>

						</tr>
					</table>
</div></div>
</div>

				

			<div class="col-lg-2 d-none d-lg-block bg-secundary">

				<a href="#"><img
					src="http://i.picasion.com/pic87/e73d8e7c30bc01b4ed6cd1af871b40de.gif"
					width="100%" height="" border="0" alt="banner" /></a>
			</div>


		</div>
		<br>
		<div class="row bg-info">
			<div class="col-1"></div>
			<div class="col-10" style="min-height: 50px">

				<footer>
				<center>
					BUSSAM - Ayuntamiento de Villalta de Abajo <br> 973-32-85200
				</center>
				</footer>
				<div class="col-1"></div>
			</div>
</body>
</html>