<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="mipk.Sesionok"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%@page import="java.util.ArrayList"%>


<html>
<head>
<%
	//aquí pongo todo el código java que quiera que mi servidor ejecute.
	String usuario = request.getParameter("usuario");
	String pass = request.getParameter("pass");
	if (usuario == null)
		usuario = "";
	if (pass == null)
		pass = "";
	boolean ok = false;
	try {
		String aux = session.getAttribute("usuario").toString();
		ok = true;
	} catch (Exception e) {
		ok = false;
	}
	if (!ok)
		if (pass.equals("contrasenya") || pass.equals("1357")||usuario.equals("bussi")) {

		//if (usuario.equals("admin") && pass.equals("1357")) {
			//usuario correcto - Tengo que crearle un handler de sesion
			session.setAttribute("usuario", usuario);
			ok = true;
		}
%><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
.naranja {
	background-color: orange;
}
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
			href="cerrarsesion.jsp"><button type="button"
					class="btn btn-danger" style="margin-right: 20px">SALIR</button></a></li>

	</ul>
	</nav>

	<br>
	<%
		if (ok) {
	%>
	<div class="row">
		<div class="col-lg-2 col-md-2 d-none d-md-block bg-secundary">
			<a href="#"><img
				src="http://i.picasion.com/pic87/84d0bb175e6bf6d61d48f12ef5154c12.gif
		"
				width="100%" height="" border="0" alt="banner" /></a>

		</div>
		<div class="col-lg-8 col-md-10 bg-info">

			<br>

			<div class="col-1"></div>
			<div class="col-11">
				<div class="row d-none d-md-block">

					<table>
						<tr>
							<th width="45%"><a href="verlineas.jsp">
									<button class="btn btn-danger"
										style="width: 80%; padding: 5px; margin: 5px;">
										Listar lineas</button>
							</a> <br> <a href="verdatos.jsp">
									<button class="btn btn-danger"
										style="width: 80%; padding: 5px; margin: 5px;">Linea
										Aeropuerto</button>

							</a></th>

							<th width="45%"><center>
									<form action="verdatosMasDatos.jsp" method="post"
										name="consultaBono">
										<input style="width: 100%; padding: 5px; margin: 5px;"
											class="bg-danger" list="lineas"
											placeholder="Linea a Consultar" name="lineas">

			<%
				String query = "select idlineas, total, lineas.desc from lineas join (select lineas_idlineas l, count(idlp) total from l_p group by lineas_idlineas) numPar on (l=idlineas);";
					beanDB basededatos = new beanDB();
					String[][] tablares = basededatos.resConsultaSelectA3(query);
					ArrayList<Lineas> listagrupos = new ArrayList<Lineas>();

					for (int i = 0; i < tablares.length; i++) {
						listagrupos.add(new Lineas(Integer.parseInt(tablares[i][0]), Integer.parseInt(tablares[i][1]),
								tablares[i][2]));
					}
			%>





										<datalist id="lineas"> 
	<% 	for (Lineas g : listagrupos) { //g es una variable tipo grupo que va recorriendo la lista
	 %>
										<option value="<%=g.getLinea()%>">(<%=g.getLinea()%>)-<%=g.getDescripcion()%></option>
										<%
											}
										%> </datalist>

										<input style="width: 100%; padding: 5px; margin: 5px;"
											type="submit" name="consulta" value="Consultar"
											class="btn btn-danger" />
									</form>
								</center></th>



						</tr>


					</table>
					<hr>
					<table>
						<tr>
							<th width="30%"><a href="verdatosBonobus.jsp">
									<button class="btn btn-warning"
										style="width: 80%; padding: 5px; margin: 5px;">
										Listar bonos</button>
							</a> <br> <a href="altaBono.jsp">
									<button class="btn btn-warning"
										style="width: 80%; padding: 5px; margin: 5px;">Alta
										bono</button>
							</a></th>
							<th width="30%"><form action="verdatosBonobusConcreto.jsp"
									method="post" name="consultaBono">
									<center>
										<input type="text" class="bg-warning"
											style="width: 80%; padding: 5px; margin: 5px;"
											placeholder="Numero de bonobus" name="bonobus"> <br>
										<input type="submit" name="consulta" value="Consultar"
											style="width: 80%; padding: 5px; margin: 5px;"
											class="btn btn-warning" />
									</center>
								</form></th>


							<th width="40%"><center>
									<form action="RecargaBonobus.jsp" method="post"
										name="consultaBono">
										<input style="width: 60%; padding: 5px; margin: 5px;"
											class="bg-warning" type="text" placeholder="Nº de bono"
											name="bonobus"> <input
											style="padding: 5px; margin: 5px; width: 25%;"
											class="bg-warning" type="number" placeholder="€"
											name="cantidad" min="7" max="50"> <br> <input
											style="width: 100%; padding: 5px; margin: 5px;"
											" type="submit" name="consulta" value="Recargar"
											class="btn btn-warning" />
									</form>
								</center></th>

						</tr>


					</table>

					<hr>
 
 
						<table>
							<tr>
								<th width="45%"><a href="verBuses.jsp">
										<button class="btn btn-secondary"
											style="width: 80%; padding: 5px; margin: 5px;">
											Listar buses</button>
								</a> <br> <a href="verConductores.jsp">
										<button class="btn btn-success"
											style="width: 80%; padding: 5px; margin: 5px;">Listar
											Chófers</button>

								</a></th>

								<th width="45%"><center>
										<form action="turnosSemana.jsp" method="post"
											name="consultaBono">
											<input type="date" class="bg-success"
												style="width: 100%; padding: 5px; margin: 5px;"
												placeholder="Fecha" name="fecha" min="2017-04-01"
												max="2018-06-30"> <input type="submit"
												name="consulta" value="Consultar turnos"
												style="width: 100%; padding: 5px; margin: 5px;"
												class="btn btn-success" />

										</form>
									</center></th>



							</tr>


						</table>

					 

				</div>

				<div class="row d-block d-md-none">
					<center>
						<a href="verlineas.jsp">
							<button class="btn btn-danger"
								style="width: 80%; padding: 5px; margin: 5px;">Listar
								lineas</button>
						</a> <br> <a href="verdatos.jsp">
							<button class="btn btn-danger"
								style="width: 80%; padding: 5px; margin: 5px;">Linea
								Aeropuerto</button>

						</a>
						<hr>

						<center>
							<form action="verdatosMasDatos.jsp" method="post"
								name="consultaBono">
								<input style="width: 80%; padding: 5px; margin: 5px;"
									class="bg-danger" list="lineas" placeholder="Linea a Consultar"
									name="lineas">

 

								<input style="width: 80%; padding: 5px; margin: 5px;"
									type="submit" name="consulta" value="Consultar"
									class="btn btn-danger" />
							</form>
						</center>


						<hr>

						<a href="verdatosBonobus.jsp">
							<button class="btn btn-warning"
								style="width: 80%; padding: 5px; margin: 5px;">Listar
								bonos</button>
						</a> <br> <a href="altaBono.jsp">
							<button class="btn btn-warning"
								style="width: 80%; padding: 5px; margin: 5px;">Alta
								bono</button>
						</a>
						<hr>
						<form action="verdatosBonobusConcreto.jsp" method="post"
							name="consultaBono">
							<center>
								<input type="text" class="bg-warning"
									style="width: 80%; padding: 5px; margin: 5px;"
									placeholder="Numero de bonobus" name="bonobus"> <br>
								<input type="submit" name="consulta" value="Consultar"
									style="width: 80%; padding: 5px; margin: 5px;"
									class="btn btn-warning" />
							</center>
						</form>
						<hr>

						<center>
							<form action="RecargaBonobus.jsp" method="post"
								name="consultaBono">
								<input style="width: 60%; padding: 5px; margin: 5px;"
									class="bg-warning" type="text" placeholder="Nº de bono"
									name="bonobus"> <input
									style="padding: 5px; margin: 5px; width: 25%;"
									class="bg-warning" type="number" placeholder="€"
									name="cantidad" min="7" max="50"> <br> <input
									style="width: 80%; padding: 5px; margin: 5px;" " type="submit"
									name="consulta" value="Recargar" class="btn btn-warning" />
							</form>
						</center>

						<hr>
						<a href="verConductores.jsp">
							<button class="btn btn-success"
								style="width: 80%; padding: 5px; margin: 5px;">Listar
								Conductores</button>
						</a>
						<hr>
						<form action="turnosSemana.jsp" method="post" name="consultaBono">
							<center>
								<input type="date" class="bg-success"
									style="width: 80%; padding: 5px; margin: 5px;"
									placeholder="Fecha" name="fecha" min="2017-04-01"
									max="2018-06-30"> <br> <input type="submit"
									name="consulta" value="Consultar turnos"
									style="width: 80%; padding: 5px; margin: 5px;"
									class="btn btn-success" />
							</center>
						</form>

  
					</center>
					<hr>
					<center>
						<a href="verBuses.jsp">
							<button class="btn btn-secondary"
								style="width: 80%; padding: 5px; margin: 5px;">Listar
								Autobuses</button>
						</a>
					</center>


				</div>

			</div>

		</div>
		<div class="col-lg-2 d-none d-lg-block bg-secundary">

			<a href="#"><img
				src="http://i.picasion.com/pic87/e73d8e7c30bc01b4ed6cd1af871b40de.gif"
				width="100%" height="" border="0" alt="banner" /></a>
		</div>





		<%
			} else {
				//AHORA PONGO EL HTML DE SESION INCORRECTA
		%>


		<div class="row">
			<div class="col-4"></div>
			<div class="col-4 bg-warning">
				<h4>Usuario y/o contraseña incorrectos.</h4>
				Por favor, inténtelo de nuevo. <br /> <a href="index.jsp"><button>Volver</button></a>


			</div>

			<div class="col-4"></div>

		</div>
		<%
			}
		%>
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