class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]
  before_action :require_permission, only: [:destroy]
 
  def index
    @posts = Post.all
    @posts = @posts.order("created_at desc")
    @post = Post.new
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.js   {}
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def require_permission
    if current_user != Post.find(params[:id]).user
      redirect_to posts_path
    end
  end
  
private
  def post_params
    params.require(:post).permit(:time, :body, :place, :neighborhood)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
