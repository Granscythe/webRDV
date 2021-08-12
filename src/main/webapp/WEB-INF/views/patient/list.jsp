<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%-- ETAPE 5 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des patients</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/all.css"/>">
</head>
<body>
<div class=" navbar navbar-expand-lg navbar-light">
        <a href="#" class="navbar-brand"><img class="logo" src="https://d30y9cdsu7xlg0.cloudfront.net/png/317354-200.png"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"  data-target="#navbarResponsive">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/formation-web-spring-eric/matiere"> Matiere</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/formation-web-spring-eric/formateur"> Formateur</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/formation-web-spring-eric/patient"> patient</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">A Propos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"> Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"> Contact</a>
                </li>
            </ul>
        </div>
    </div>
	<div class="container-fluid">
		<div class="card mt-3">
			<div class="card-header bg-info text-white">
				<h2>Liste des Patients</h2>
			</div>
			<div class="card-body">
				<table id="patientTable" class="table table-striped">
					<thead>
						<tr>
							<th>Identifiant</th>
							<th>Email</th>
							<th>Mot de passe</th>
							<th>Numéro de sécurité sociale</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mesPatients}" var="patient">
							<c:url value="/patient/edit" var="editUrl">
								<c:param name="id" value="${patient.id}"/>
							</c:url>
							<c:url value="/patient/delete" var="deleteUrl">
								<c:param name="id" value="${patient.id}"/>
							</c:url>
							<tr>
								<td>${patient.id}</td>
								<td>${patient.mail}</td>
								<td>${patient.mdp}</td>
								<td>${patient.numSecuriteSociale}</td>
								<td><div class="btn-group btn-group-sm">
									<a href="${editUrl}" class="btn btn-primary"><i class="fa fa-edit"></i></a>
									<a href="${deleteUrl}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
								</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<c:url value="/patient/add" var="addUrl"/>
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