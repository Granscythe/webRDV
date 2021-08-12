<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edition des motifs</title>
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
		<div id="motifForm" class="card mt-3">
			<form action="<c:url value="/motif/save"/>" method="post">
				<input type="hidden" name="version" value="${motif.version}">
				<div class="card-header bg-info text-white">
					<h3>Edition des motifs</h3>
				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="id">Identifiant:</label> <input type="number" readonly
							class="form-control" id="id" name="id" value="${motif.id}">
					</div>
					<div class="form-group">
						<label for="commentaires">Intitule:</label> <input type="text"
							class="form-control" id="ititule" name="intitule"
							value="${motif.intitule}">
					</div>
					<div class="form-group">
						<label for="promotion">Duree</label> <input type="number"
							class="form-control" id="duree" name="duree"
							value="${motif.duree}">
					</div>
				</div>
				<div class="card-footer">
					<div class="btn-group btn-group-lg float-right">
						<button type="submit" class="btn btn-success">
							<i class="fa fa-check"></i>
						</button>
						<c:url value="/motif/cancel" var="cancelUrl"/>
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