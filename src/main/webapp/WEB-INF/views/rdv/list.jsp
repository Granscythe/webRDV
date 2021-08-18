<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liste des Rendez-Vous</title>
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
		<div class="card mt-3">
			<div class="card-header bg-info text-white">
				<h2>Liste des rendez-vous</h2>
			</div>
			<div class="card-body">
				<table id="rdvTable" class="table table-striped">
					<thead>
						<tr>
							<th>Identifiant</th>
							<th>Statut</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${mesrdvs}" var="rdv">
							<c:url value="/rdv/edit" var="editUrl">
								<c:param name="id" value="${rdv.id}"/>
							</c:url>
							<c:url value="/rdv/delete" var="deleteUrl">
								<c:param name="id" value="${rdv.id}"/>
							</c:url>
							<tr>
								<td>${rdv.id}</td>
								<td>${rdv.statut}</td>
								<td><div class="btn-group btn-group-sm">
									<a href="${editUrl}" class="btn btn-primary"><i class="fa fa-edit"></i></a>
									<a href="${deleteUrl}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
								</div></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<c:url value="rdv/add" var="addUrl"/>
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