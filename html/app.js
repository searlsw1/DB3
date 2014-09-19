(function() { // We use this anonymous function to create a closure.


	//n Angular module is a collection of functions that are run when the application is “booted.”
	var app = angular.module('splatter-web', ['ngResource']);
	//Restful resource
	app.factory('User', function($resource) {
		return $resource('http://searles.sqrawler.com/api/users/:id.json', {}, 
		{

			'createUser': { method: 'POST', url: "http://searles.sqrawler.com/api/users.json" },
			'updateUser': { method: 'PUT', url: 'http://searles.sqrawler.com/api/users/:id.json' },
			'mySplatts': { method: 'GET', isArray:true, url:"http://searles.sqrawler.com/api/users/splatts/:id.json" },
			'deleteUser': { method: 'DELETE', url: 'http://searles.sqrawler.com/api/users/:id.json' },
			'addFollower': { method: 'POST', url:'http://searles.sqrawler.com/api/users/follows.json' },
			'unfollow': { method: 'DELETE', url:'http://searles.sqrawler.com/api/users/follows/:id/:follows_id'}

		});
	})

	app.factory('Splatt', function($resource) {
		return $resource('http://searles.sqrawler.com/api/splatts/:id.json', {}, 
		{

			'createSplatt': { method: 'POST', url: "http://searles.sqrawler.com/api/splatts.json" }

		});
	})

	app.controller("UserReadController", function(User){
			this.data = {}; //this is the forms data
			this.ViewModel = function() {
				var id = this.data.id;

				this.splatts = User.mySplatts({id:id});

				this.u = User.get({id:id});

				this.data = {}; // clears the form data.
			}
	}); 



	app.controller("CreateUserController", function(User) {
		this.data = {};
		
		this.CreateUser = function() {
			var userData = {
				name: this.data.name,
				email: this.data.email,
				blurb: this.data.blurb,
				password: this.data.password
			}	

			User.createUser({user: userData});
			this.data={};
		}
	});


	app.controller("UpdateUserController", function(User) {
			this.data = {};
			//user object

			this.UpdateUser = function(){
				var userData = {
					name: this.data.name,
					email: this.data.email,
					blurb: this.data.blurb,
					password: this.data.password
				}
				User.updateUser({id: 2}, {user:userData});
				this.data = {};
			}
	});


	app.controller("DeleteUserController", function(User) {
		this.data = {};
		
		this.DeleteUser = function(){
			User.deleteUser({id:this.data.id});
			this.data = {};//clear fields
		}
	
	});


	app.controller("AddFollowerController", function(User) {
		this.data = {};
	
		this.AddFollower = function() {
			User.addFollower({id:this.data.userId,follows_id:this.data.followerId});
			this.data = {};//clear fields

		}
	
	});


	app.controller("UnFollowController", function(User) {
		this.data = {};
	
		this.UnFollow = function() {
			User.unFollow({id:this.data.userId,follows_id:this.data.followerId});
			this.data = {};//clear fields

		}
	
	});

	app.controller("CreateSplattController", function(Splatt) {

		this.data = {};

		this.CreateSplatt = function() {
			//Splatt.createSplatt(splatt:{user_id: this.data.id, body:this.data.splatt}});
			this.data = {};
		}

	});

	
})();
