<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <meta http-equiv="Content-Type" content="text/html;" charset=UTF-8">
 
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

<%
String bonobus= request.getParameter("bonobus");
String cantidad=request.getParameter("cantidad");

%>

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
		<div class="col-lg-2 col-md-2 d-none d-md-block bg-secundary">

			<a href="#"><img
				src="http://i.picasion.com/pic87/84d0bb175e6bf6d61d48f12ef5154c12.gif"	width="100%" height="" border="0" alt="banner" /></a>

		</div>
		<div class="col-lg-8 col-md-10 bg-info">
		<br>
<!-- Codigo propio de la web aqui -->
	<%
 
					String query = " select * from bonobus order by idbonobus desc limit 1;";
					
					beanDB basededatos = new beanDB();
					
					String[][] tablares=basededatos.resConsulta(query);
					
					int numero;
					
					try{
						numero=Integer.parseInt(tablares[0][0]);

					}catch(Exception e){
						numero=0;
					}
					
					
					int bono;
					try{
						bono=Integer.parseInt(request.getParameter("bonobus"));

					}catch(Exception e){
						bono=-1;
					} 
					int saldo;
 					try{
						saldo=Integer.parseInt(request.getParameter("cantidad"));

					}catch(Exception e){
						saldo=-1;
					} 
					
					
					if(numero!=0&&bono!=-1&&saldo>0&&bono<=numero){
						
 						String insert="INSERT INTO recargas (cantidad, momento,bonobus_idbonobus) VALUES ("+saldo+",curtime(),"+bono+");"; 

						basededatos.insert(insert);
						
						
						
						
						 
						%>
						<h2> Se ha recargado el bonobus numero <%=bono %> por <%=saldo %>$</h2>
 						<%
						
						
						
						
					}
					else{
						%>
						<h2> No existe el bonobus numero <%=bono %> </h2>
 						<%
					}


 
		%>




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
</html>





