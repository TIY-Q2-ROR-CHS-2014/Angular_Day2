@NewPostCtrl = ($scope, $location, postData) ->
  $scope.data = postData.data
  postData.loadPosts(null)

  $scope.formData =
    newPostTitle: ""
    newPostContent: ""

  $scope.createPost = ->
    console.log $scope.formData
    postData.createPost($scope.formData)
    $scope.returnHome()

  $scope.returnHome = ->
    $location.url "/"
