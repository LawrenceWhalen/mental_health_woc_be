class Api::V1::PostsController < ApplicationController

  def create
    post = Post.new(post_params.merge(user: current_user))
    post.save
    render_jsonapi_response(post)
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end