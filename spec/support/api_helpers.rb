module ApiHelpers

  def json
    JSON.parse(response.body)
  end

  def login_with_api(user)
    post '/api/login', params: {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  def create_post_api(post, response)
    post "/api/v1/users/#{user.id}/posts", params: {
      post: {
        title: post.title,
        content: post.content
      }
    }, 
    headers: {
      'Authorization': response['Authorization']
    }
  end

end