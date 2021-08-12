<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- ETAPE 5 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des praticiens</title>
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
                    <a class="nav-link" href="http://localhost:8080/formation-web-spring-eric/patient"> Patient</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/formation-web-spring-eric/praticien"> Praticien</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/formation-web-spring-eric/motif"> Motif</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/formation-web-spring-eric/RDV"> Rendez-vous</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/formation-web-spring-eric/specialite"> Spécialités</a>
                </li>
            </ul>
        </div>
    </div>
	<div class="container-fluid">
		<div class="card mt-3">
			<div class="card-header bg-info text-white">
				<h2>Liste des Praticiens</h2>
			</div>
			<div class="card-body">
				<table id="praticienTable" class="table table-striped">
					<thead>
						<tr>
							<th>Identifiant</th>
							<th>Prenom</th>
							<th>Nom</th>
							<th>Email</th>
							<th>Mot de passe</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mesPraticiens}" var="prat">
							<c:url value="/praticien/edit" var="editUrl">
								<c:param name="id" value="${prat.id}"/>
							</c:url>
							<c:url value="/praticien/delete" var="deleteUrl">
								<c:param name="id" value="${prat.id}"/>
							</c:url>
							<tr>
								<td>${prat.id}</td>
								<td>${prat.prenom}</td>
								<td>${prat.nom}</td>
								<td>${prat.mail}</td>
								<td>${prat.mdp}</td>
								<td><div class="btn-group btn-group-sm">
									<a href="${editUrl}" class="btn btn-primary"><i class="fa fa-edit"></i></a>
									<a href="${deleteUrl}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
								</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<c:url value="/praticien/add" var="addUrl"/>
			<div class="card-footer">
				<a href="${addUrl}" class="btn btn-success btn-lg">
					<i class="fa fa-plus"></i>
				</a>
			</div>
		</div>
	</div>
	
	<script src="<c:url value="/js/jquery-3.5.0.min.js"/>"></script>
	<script src="<c:url value="/js/bootstrap.bundle.min.js"/>"></script>
</body>
</html>