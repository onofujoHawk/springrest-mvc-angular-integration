'use strict';

angular.module('App').factory('UserService', ['$http', '$q', function($http, $q) {
	
	var REST_SERVICE_URI = undefined;
	
	if (window.location.href.indexOf('/user/') > -1) {
		REST_SERVICE_URI = 'http://localhost:8080/SpringAngularJSIntegration/user/';
	}
	

	var factory = {
			
			fetchAllUsers: fetchAllUsers,
			createUser: createUser,
			updateUser: updateUser,
			deleteUser: deleteUser

	};
	
	return factory;
	
	function fetchAllUsers() {
		
		var deferred = $q.defer();
		$http.get(REST_SERVICE_URI)
			.then(function(response) {
				deferred.resolve(response.data);
			},
			function(errResponse) {
				console.error('Errore durante il fetching degli Users');
				deferred.reject(errResponse);
			}
		);
		return deferred.promise;
	}
	
	
	function createUser(user) {
		
		var deferred = $q.defer();
		$http.post(REST_SERVICE_URI, user)
			.then(function(response) {
				deferred.resolve(reponse.data);
			},
			function(errResponse) {
				console.error('Errore durante la creazione dello User');
				deferred.reject(errResponse);
			}
		);
		return deferred.promise;
	}
	
	
	function updateUser(user, id) {
		
		var deferred = $q.defer();
		$http.put(REST_SERVICE_URI + id, user)
			.then(function(response) {
				deferred.resolve(response.data);
			},
			function(errResponse) {
				console.error('Errore durante l\'aggiornamento dello User');
				deferred.reject(errResponse);
			}
		);
		return deferred.promise;
	}
	
	
	function deleteUser(id) {
		
		var deferred = $q.defer()
		$http.delete(REST_SERVICE_URI + id)
			.then(function(response) {
				deferred.resolve(response.data);
			},
			function(errResponse) {
				console.error('Errore durante la cancellazione dello User');
				deferred.reject(errResponse);
			}
		);
		return deferred.promise;
	}
	
	
}]);