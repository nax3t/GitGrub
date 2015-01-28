class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.create(post_params)
    # @post = current_user.posts.create(post_params)
  	if @post.save
  		redirect_to @post, :notice => "You have successfully created a post!"
  	else
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


private
  def post_params
    params.require(:post).permit(:time, :body, :place, :neighborhood)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
