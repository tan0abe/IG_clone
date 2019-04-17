class PostsController < ApplicationController
  def new
    @posts = Posts.new
  end

  def index
    @posts = Post.all
  end
end
