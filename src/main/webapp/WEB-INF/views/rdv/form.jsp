<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edition du Rendez-vous</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/all.css"/>">
</head>
<body>
	<div class="container-fluid">
		<div id="rdvForm" class="card mt-3">
			<form action="<c:url value="/rdv/save"/>" method="post">
				<input type="hidden" name="version" value="${rdv.version}">
				<div class="card-header bg-info text-white">
					<h3>Edition du Rendez-vous</h3>
				</div>
				<div class="card-body">
					<div class="form-group">
						<label for="id">Identifiant:</label> <input type="number" readonly
							class="form-control" id="id" name="id" value="${rdv.id}">
					</div>
					
					
					
						<label for="statut">Statut:</label>
					<select class="form-control" name ="statut">
						
						<c:forEach items="${statuts}" var="statut">
							<option value="${statut}" ${rdv.statut eq statut ? 'selected':'' }>${statut}</option>
						</c:forEach>
			
					</select>
					
					
				</div>
				<div class="card-footer">
					<div class="btn-group btn-group-lg float-right">
						<button type="submit" class="btn btn-success">
							<i class="fa fa-check"></i>
						</button>
						<c:url value="/rdv/cancel" var="cancelUrl" />
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