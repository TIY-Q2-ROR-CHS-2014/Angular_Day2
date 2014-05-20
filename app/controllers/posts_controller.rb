class PostsController < ApplicationController
  def index
    @posts = Post.all

    respond_to do |format|
      format.json { render json: @posts.as_json }
    end    
  end

  def create
    @post = Post.create create_params

    respond_to do |format|
      format.json { render json: @post.as_json }
    end
  end

private
  def create_params
    params.require(:post).permit(:title, :content)  
  end
end
