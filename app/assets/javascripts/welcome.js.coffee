# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require_self
#= require_tree ./services
#= require_tree ./controllers
#= require_tree ./directives
#= require_tree ./filters

Blog = angular.module("Blog", ['ngRoute'])

Blog.config(["$routeProvider", ($routeProvider) ->
  # Your browser is expecting /posts
  # When it goes to /posts, it will go to
  # the corresponding template and controller
  $routeProvider.when('/posts/new', {templateUrl: '../assets/newPost.html', controller: "NewPostCtrl"})
  $routeProvider.when('/posts/:postId', { templateUrl: "../assets/post.html", controller: "PostCtrl"})

  # This route will be the default
  $routeProvider.otherwise({ templateUrl: '../assets/index.html', controller: "IndexCtrl"})
])

Blog.config(['$httpProvider', (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])






