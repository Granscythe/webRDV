<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des lieux</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/all.css"/>">
</head>
<body>
<div class=" navbar navbar-expand-lg navbar-light">
        <a href="#" class="navbar-brand"><img class="logo" style="width:10%; height:10%;" src="https://upload.wikimedia.org/wikipedia/fr/3/30/Logo_Union_Bordeaux_B%C3%A8gles_2018.svg" ></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"  data-target="#navbarResponsive">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/webRDV/patient"> Patient</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/webRDV/praticien"> Praticien</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/webRDV/motif"> Motif</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/webRDV/RDV"> Rendez-vous</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/webRDV/specialite"> Spécialités</a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/webRDV/lieu"> Lieux</a>
                </li>
            </ul>
        </div>
    </div>

	<div class="container-fluid">
		<div id="lieuForm" class="card mt-3">
			<form action="<c:url value="/lieu/save"/>" method="post">
				<input type="hidden" name="version" value="${lieu.version}">
				<div class="card-header bg-info text-white">
					<h3>Liste des lieux</h3>
				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="id">Identifiant:</label> <input type="number" 
							class="form-control" id="id" name="id" value="${lieu.id}">
					</div>
					<div class="form-group">
						<label for="typeLieu">Type de lieu:</label> <input type="text"
							class="form-control" id="typeLieu" name="typeLieu"
							value="${lieu.typeLieu}">
					</div>
					<div class="form-group">
						<label for="rue">Rue:</label> <input type="text"
							class="form-control" id="rue" name="rue"
							value="${lieu.rue}">
					</div>
					<div class="form-group">
						<label for="ville">Ville:</label> <input type="text"
							class="form-control" id="ville" name="ville"
							value="${lieu.ville}">
					</div>
					<div class="form-group">
						<label for="codePostal">CodePostal:</label> <input type="number"
							class="form-control" id="codePostal" name="codePostal"
							value="${lieu.codePostal}">
					</div>
					
					<div class="form-group">
						<label for="numero">Numero:</label> <input type="number"
							class="form-control" id="numero" name="numero"
							value="${lieu.numero}">
					</div>
					
				</div>
				<div class="card-footer">
					<div class="btn-group btn-group-lg float-right">
						<button type="submit" class="btn btn-success">
							<i class="fa fa-check"></i>
						</button>
						<c:url value="/lieu/cancel" var="cancelUrl"/>
						<a href="${cancelUrl}" type="button" class="btn btn-warning">
							<i class="fa fa-undo"></i>
						</a>
					</div>
				</div>
			</form>
		</div>

	</div>

	<script src="<c:url value="/js/jquery-3.5.0.min.js"/>"></script>
	<script src="<c:url value="/js/bootstrap.bundle.min.js"/>"></script>
</body>
</html>