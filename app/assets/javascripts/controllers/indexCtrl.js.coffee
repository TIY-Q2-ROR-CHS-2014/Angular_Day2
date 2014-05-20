@IndexCtrl = ($scope, $location, $http, postData) ->
  $scope.title = "My blog"
  $scope.data = postData.data
    
  $scope.viewPost = (postId) ->
    console.log "Hey Chris!"
    # redirect to /post
    $location.url("/posts/#{postId}")

  $scope.createNewPost = ->
    $location.url("/posts/new")
  
  postData.loadPosts(null)









