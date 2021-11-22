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

  def create_post_api(post)
    post "/api/users/#{current_user}/posts", params: {
      post: {
        title: post.title,
        content: post.content
      }
    }
  end
end