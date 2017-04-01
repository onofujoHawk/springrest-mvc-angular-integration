<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>AngularJS $http Service</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value='/assets/css/app.css' />" rel="stylesheet"></link>
<link href="<c:url value="/assets/css/validation.css" />" rel="stylesheet"></link>
</head>
<body ng-app="myApp" class="ng-cloak">
	<div class="generic-container" ng-controller="UserController as Ctrl">
	
		<!-- Panello di registrazione Utente -->
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">Registrazione Utente </span>
			</div>
			<div class="formcontainer">
				<form ng-submit="ctrl.submit()" name="myForm"
					class="form-horizontal">
					<input type="hidden" ng-model="Ctrl.user.id" />
					
					<!-- Nome -->
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="uname">Nome</label>
							<div class="col-md-7">
								<input type="text" ng-model="Ctrl.user.username" id="uname"
									class="username form-control input-sm"
									placeholder="Inserisci il tuo nome." required ng-minlength="3" />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.uname.$error.required">Campo obbligatorio </span> 
									<span ng-show="myForm.uname.$error.minlength">Minima dimensione richiesta è 3 </span> 
									<span ng-show="myForm.uname.$invalid">Questo campo è invalido </span>
								</div>
							</div>
						</div>
					</div>

					<!-- Indirizzo -->
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="address">Indirizzo</label>
							<div class="col-md-7">
								<input type="text" ng-model="Ctrl.user.address" id="address"
									class="form-control input-sm"
									placeholder="Inserisci il tuo indirizzo." />
							</div>
						</div>
					</div>

					<!-- Email -->
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="email">Email</label>
							<div class="col-md-7">
								<input type="email" ng-model="Ctrl.user.email" id="email"
									class="email form-control input-sm"
									placeholder="Inserisci il tuo indirizzo email." required />
								<div class="has-error" ng-show="myForm.$dirty">
									<span ng-show="myForm.email.$error.required">Campo obbligatorio </span> 
									<span ng-show="myForm.email.$invalid">Questo campo è invalido </span>
								</div>
							</div>
						</div>
					</div>

					<!-- Buttons  -->
					<div class="row">
						<div class="form-actions floatRight">
							<input type="submit" value="{{!Ctrl.user.id ? 'Salva' : 'Modifica'}}"
								class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
							<button type="button" ng-click="Ctrl.reset()"
								class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset 
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div class="panel panel-default">
			<!-- Tabella Utenti -->
			<div class="panel-heading">
				<span class="lead">Lista Utenti </span>
			</div>
			<div class="tablecontainer">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Nome</th>
							<th>Indirizzo</th>
							<th>Email</th>
							<th width="20%"></th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="u in Ctrl.users">
							<td><span ng-bind="u.id"></span></td>
							<td><span ng-bind="u.username"></span></td>
							<td><span ng-bind="u.address"></span></td>
							<td><span ng-bind="u.email"></span></td>
							<td>
								<button type="button" ng-click="Ctrl.edit(u.id)"
									class="btn btn-success custom-width">Modifica</button>
								<button type="button" ng-click="Ctrl.remove(u.id)"
									class="btn btn-danger custom-width">Cancella</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- Scripts -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
	<script src="<c:url value='/assets/js/module/app.js' />"></script>
	<script src="<c:url value='/assets/js/service/user_service.js' />"></script>
	<script src="<c:url value='/assets/js/controller/user_controller.js' />"></script>
</body>
</html>