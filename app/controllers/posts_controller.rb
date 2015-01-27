class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)

  	if @post.save
  		redirect_to @post
  	else
  		render :new
  	end
  end

  # def edit
  # end

  # def show
  # end

  # def index
  # end
end
