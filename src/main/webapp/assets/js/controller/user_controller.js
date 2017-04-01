'use strict';

angular.module('App').controller('UserController', ['$scope', 'UserService', function($scope, UserService) {
	
	var self = this;
	self.user = {
			id: null,
			username: '',
			address: '',
			email: ''
	};
	self.users = [];
	
	self.submit = submit;
	self.edit = edit;
	self.remove = remove;
	self.reset = reset;
	
	
	fetchAllUsers();
	
	
	function fetchAllUsers() {
		
		UserService.fetchAllUsers()
			.then(function(defer) {
				self.users = defer;
			},
			function(errResponse) {
				console.error('Errore durante il fetching degli Users');
			}
		);
	}
	
	
	function createUser(user) {
		
		UserService.createUser(user) 
			.then(fetchAllUsers, function(errResponse) {
				console.error('Errore durante la creazione dello User');
			}
		);	
	}
	
	
	function updateUser(user, id) {
		
		UserService.updateUser(user, id)
			.then(fetchAllUsers, function(errResponse) {
				console.error('Errore durante l\'aggiornamento dello User');
			}
		);
	}
	
	
	function deleteUser(id) {
		
		UserService.deleteUser(id)
			.then(fetchAllUsers, function(errResponse) {
				console.error('Errore durante la cancellazione dello User');
			}
		);
	}
	
	
	function submit() {
		
		if (self.user.id === null) {
			console.log('Salvo il nuovo User', self.user);
			createUser(self.user);
		} else {
			updateUser(self.user, self.user.id);
			console.log('Utente aggiornato con id ', self.user.id);
		}
		reset();
	}
	
	
	function edit(id) {
		
		console.log('id da editare', id);
		for(var i=0; i<self.users.length; i++) {
			if (self.users[i].id === id) {
				self.user = angular.copy(self.users[i]);
				break;
			}
		}
		
	}
	
	
	function remove(id) {
		
		console.log('id da eliminare', id);
		if (self.user.id === id) {
			//pulisci la form se l'utente da cancellare viene mostrato qui.
			reset();
		}
		deleteUser(id);
		
	}
	
	
	function reset() {
		self.user = {
				id: null,
				username: '',
				address: '',
				email: ''
		};
		$scope.myForm.$setPristine(); //reset della form
	}
	
}]);
