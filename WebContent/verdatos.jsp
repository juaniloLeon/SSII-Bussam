<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%
	try {
		String aux = session.getAttribute("usuario").toString();
	} catch (Exception e) {
		response.sendRedirect("cerrarsesion.jsp");
	}
 
	

	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>Bussam</title>
<style type="text/css">
</style>
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
			href="javascript:history.back()"><button type="button"
					class="btn btn-danger" style="margin-right: 20px">VOLVER</button></a></li>
		<li class="nav-item "><a class="nav-link "
			href="cerrarsesion.jsp"><button type="button"
					class="btn btn-danger" style="margin-right: 20px">SALIR</button></a></li>

	</ul>
	</nav>

	<br>

	<div class="row">
		<div class="col-lg-2 col-md-2 d-none d-md-block bg-secundary" style="height: 100%">

			<a href="#"><img
				src="http://i.picasion.com/pic87/84d0bb175e6bf6d61d48f12ef5154c12.gif
		"
				width="100%" height="" border="0" alt="banner" /></a>

		</div>
		<div class="col-lg-8 col-md-10 bg-info">
		
			<br>
			
			
			<h3>
				Información de la línea  Aeropuerto
			</h3>
			<table class="table table-striped">
				<tr>
					<th style="width: 20%;">Parada</th>
					<th style="width: 20%;">Siguiente parada</th>
					<th style="width: 40%;">Direccion</th>

				</tr>
				<%
					String query = "select paradas_idparadas,paradasiguiente, paradas.desc from l_p join paradas on (idparadas=paradas_idparadas) where lineas_idlineas=70 order by idparadas desc";
					beanDB basededatos = new beanDB();
					String[][] tablares = basededatos.resConsultaLineas(query);

					ArrayList<Linea> listagrupos = new ArrayList<Linea>();
					for (int i = 0; i < tablares.length; i++) {
						listagrupos.add(new Linea(Integer.parseInt(tablares[i][0]), tablares[i][1], tablares[i][2]));
					}
				%>

				<%
					for (Linea g : listagrupos) { //g es una variable tipo grupo que va recorriendo la lista
				%><tr>

					<td style="width: 20%;"><%=g.getParada()%></td>
					<td style="width: 20%;"><%=g.getParadaSiguiente()%></td>
					<td style="width: 40%;"><%=g.getDireccion()%></td>

				</tr>
				<%
					}
				%>
			 
			</table>



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