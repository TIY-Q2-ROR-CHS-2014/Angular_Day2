angular.module("Blog").factory("postData", ['$http', ($http) ->
  postData = 
    data:
      posts: [
        {
          title: "Loading...",
          content: ""
        }
      ]
    isLoaded: false

  postData.loadPosts = (deferred) ->
    if postData.isLoaded == false
      $http.get('/posts.json').success( (data) ->
        postData.data.posts = data
        postData.isLoaded = true
        console.log "Successfully received posts."
        if deferred
          deferred.resolve()
      ).error( ->
        console.log "Failed to load posts."
        if deferred
          deferred.reject "Failed to load posts."
      )
    else
      if deferred
        deferred.resolve()

  postData.createPost = (formData) ->
    data = 
      post: 
        title: formData.newPostTitle
        content: formData.newPostContent

    $http.post('/posts.json', data).success( (data) ->
      postData.data.posts.push(data)
      console.log("Successfully created post.")
    ).error( ->
      console.log("Failed to create post.")
    )

    return true

  postData.findPostById = (postId) ->
    console.log postId
    console.log postData.data.posts
    test = _.findWhere(postData.data.posts, { id: parseInt(postId) })
    console.log(test)
    return test

  console.log "Post data is HEREEEEEEEEEEEEEE"

  return postData
])