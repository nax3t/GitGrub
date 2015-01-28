class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
  	@post = Post.new
  end

  def create
    @post = Post.new(post_params)
   
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
